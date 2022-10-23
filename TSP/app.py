import streamlit as st
import os
import streamlit.components.v1 as components

st.title('TSP')
st.markdown("Three different ways on getting solutions por the Travelling Salesman Problem, applying **Simplex, Ant Colony and Genetic algorithm**")
# embed streamlit docs in a streamlit app
st.subheader("Simplex")
HtmlFile = open(os.path.join("maps/exact.html"), 'r', encoding='utf-8')
source_code = HtmlFile.read()
components.html(source_code,height=400)

st.subheader("Ant colony")
HtmlFile = open(os.path.join("maps/ant.html"), 'r', encoding='utf-8')
source_code = HtmlFile.read()
components.html(source_code,height=400)

st.subheader("Genetic")
HtmlFile = open(os.path.join("maps/genetic.html"), 'r', encoding='utf-8')
source_code = HtmlFile.read()
components.html(source_code,height=400)