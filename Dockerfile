# Use the official JupyterLab base-notebook image as the base image
FROM jupyter/base-notebook:python-3.11

# Switch to root to install system packages
USER root

# Install the nbdefense_jupyter extension
RUN pip install nbdefense_jupyter

# Optionally, install the en_core_web_trf model for spaCy if the PII module is needed
# RUN pip install spacy && python -m spacy download en_core_web_trf

# Switch back to the jovyan user
USER $NB_UID

# Enable the nbdefense_jupyter extension
RUN jupyter server extension enable nbdefense_jupyter

# Expose the port JupyterLab will run on
EXPOSE 8888

# Start JupyterLab by default
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]
