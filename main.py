import mysql.connector as mysql
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
import streamlit as st

import my_library as mylib



def main():
    st.title("IKEO - Analyse des données")
    mylib.show_products()
    mylib.show_orders_for_products()
    mylib.show_orders_for_custumers()


if __name__ == "__main__":
    main()
