import mysql.connector as mysql
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
import streamlit as st


# Function for connecting to the database, executing a SQL query and returning the results in a dataframe
def get_data(query: str) -> pd.DataFrame:

    # create a dictionary of connection parameters
    config = {
    "host":"localhost",
    "port":"3307",
    "user":"root",
    "password":"example",
    "database":"ikeo_bdd"
    }
    # connect to the database (the ** unpacks the dictionary) and create a cursor
    db = mysql.connect(**config)
    cursor = db.cursor()

    # execute the query
    cursor.execute(query)

    # create a dataframe from the results
    df = pd.DataFrame(cursor.fetchall())

    # close the connection
    db.close()

    # return the dataframe
    return df


# Function to display all products and their production sites in streamlit
def show_products():

    # get the data from the database with the right query and store it in a dataframe
    query = "SELECT nom, usine FROM produits"
    df = get_data(query)

    # add column names to the dataframe and set the index
    df.rename(columns={0: "Produit", 1: "Sites de production"}, inplace=True)
    df = df.set_index('Produit')

    # display the dataframe
    st.header("Liste des produits par site de production")
    st.dataframe(df)


# Function to display the number of orders per product in a seaborn barplot
def show_orders_for_products():

    query = """
    SELECT p.nom, CAST(SUM(f.quantite) AS DECIMAL(10,2)) AS quantite_totale 
    FROM produits p
    JOIN facturer f ON p.id_produit = f.id_produit
    GROUP BY p.id_produit
    """

    df = get_data(query)
    df = df.rename(columns={0: "Produit", 1: "Quantité totale"})

    # histogram
    st.header("Quantité totale de produits vendus par nom de produit")
    fig, ax = plt.subplots()
    ax = sns.barplot(x="Produit", y="Quantité totale", data=df)
    ax.set_xticklabels(ax.get_xticklabels(), rotation=45, horizontalalignment='right')

    st.pyplot(fig)


# Function to display every order for each customer in a 
def show_orders_for_custumers():

    query = """
    SELECT raison_sociale, SUM(quantite) AS total_commandes
    FROM facturer
    JOIN factures ON facturer.id_facture = factures.id_facture
    JOIN clients ON factures.id_client = clients.id_client
    GROUP BY raison_sociale
    """

    df = get_data(query)
    df = df.rename(columns={0: "Client", 1: "Total Commandes"})

    # Affichage dans Streamlit
    st.title("Graphique des commandes par clients")

    # Création du graphique à barres
    fig, ax = plt.subplots()
    ax = sns.barplot(x="Client", y="Total Commandes", data=df)
    ax.set_xticklabels(ax.get_xticklabels(), rotation=45, horizontalalignment='right')

    # Affichage du graphique dans Streamlit
    st.pyplot(fig)
