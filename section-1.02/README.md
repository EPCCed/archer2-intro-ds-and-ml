# Practical: Introduction to Jupyter Notebooks & Pandas

In this initial practical, your goal is to connect to ARCHER2 and open a Jupyter Notebook. Once you are able to do this, you should use the notebook to start working through an exercise from Data Carpentry which introduces Pandas.

**Jupyter Notebooks** provide a useful environment for working with Python interactively. They allow you to store your input and output in a single file which facilitates reproducibility and reuse. They can be useful for **exploratory data analysis** including **visualisation** where the goal is to quickly iterate. 

## Step 1: Open a Jupyter notebook on ARCHER2

Please run the following commands.

```bash
cd ${HOME/home/work}

cp ../shared/start-jupyter-server.sh ./
cp ../shared/run-interactive.sh ./

git clone https://github.com/EPCCed/archer2-intro-ds-and-ml.git
```

The first command moves you to a location on the `/work` file system. You'll need to be in this location if you wish
to run Jupyter notebooks from an ARCHER2 compute node: the `/home` file system is not accessible from the compute nodes.

The next two commands copy two scripts from a shared folder to your user folder on `/work`.

The `start-jupyter-server.sh` script activates a Python environment located at `/work/ta209/ta209/shared/pyenv`
in order to start the JupyterLab server. The `start-jupyter-server.sh` script can be run either from a login node
or from a compute node accessed via an interactive session, see `run-interactive.sh`.

Lastly, the `git` command clones the repository for this training course. Within the `archer2-intro-ds-and-ml`
folder, you should find the Jupyter notebook (`.ipynb`) files for the practical exercises.

As you may have guessed, the JupyterLab server is started by running `./start-jupyter-server.sh`.
In the ouput from the this script, you should see the URL for the JupyterLab server formatted like so,
`http://127.0.0.1:<port_number>/lab?token=<string>`. However, before you can access that URL from your local browser,
you first need to create an SSH tunnel to ARCHER2 using a separate terminal window.

```bash
ssh <username>@login.archer2.ac.uk -L<port_number>:<node_id>:<port_number>
```

A version of this tunnelling command is printed at the top of the JupyterLab server output.
The `username` and `node_id` fields are populated, but the `port_number` label must be replaced by the actual port number,
which can be found in the JupyterLab server output.

You're now ready to run JupyterLab notebooks on ARCHER2 from your browser using the `http://127.0.0.1` URL mentioned above.
Navigate to the `archer2-intro-ds-and-ml` folder (from within the JupyterLab session presented within your browser) where
you can find the JupyterLab notebook exercises.

Detailed instructions about running JupyterLab on ARCHER2 can be found in the [Using Jupyterlab section of the ARCHER2 Documentation](https://docs.archer2.ac.uk/user-guide/python/#using-jupyterlab-on-archer2). 

When you have finished working with JupyterLab notebooks, you should close the browser tab and the SSH tunnel connection;
then, from the terminal session where you launched JupyterLab, type `Ctrl+C` to shutdown.

If you're interested in how the Python environment for this training course was setup, you can find the instructions
at `/work/ta209/ta209/shared/install-pyenv.sh`. It should be straightforward to adapt this for a system hosted at
your home institution if you wish.


## Step 2: Explore some basic data processing using Pandas

Work through [Episode 3](https://datacarpentry.org/python-ecology-lesson/02-starting-with-data.html) and [Episode 4](https://datacarpentry.org/python-ecology-lesson/03-index-slice-subset.html) from the Data Carpentry course, "[Data Analysis and Visualization in Python for Ecologists](https://datacarpentry.org/python-ecology-lesson/)".

For these introductory exercises, we recommend that you start from a blank Jupyter notebook and type/paste commands from the tutorial pages above.

## Notebooks for the rest of this course

The easiest way to get the notebooks for practicals for the rest of this course is to clone this repository directly on ARCHER2 with the command:

```bash
git clone https://github.com/EPCCed/archer2-intro-ds-and-ml.git
```
