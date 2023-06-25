import streamlit as st

st.title("Merise - Modèle logique de données pour la base de données IKEO")

st.write("USINES      ( id_usine,  nom,  adresse,  ville )")
st.write("PRODUIRE      ( id_usine#,  id_produit# )")
st.write("PRODUITS      ( id_produit,  ref, nom,  description,  abandonne,  usine )")
st.write("FACTURER      ( id_produit#,  quantité,  id_facture#)")
st.write("FACTURES      ( id_facture,  numero,  date,  id_client# )")
st.write("CLIENTS      ( id_client, type,  raison_sociale,  adresse, ville,  pays )")
