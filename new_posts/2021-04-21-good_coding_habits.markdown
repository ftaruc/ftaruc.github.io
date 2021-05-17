---
layout: post
title:  ""
date:   2021-04-18 15:10:56 +0900
categories: notes
---

`tqdm` allows for progress bars when testing out code, good for determining length of runtime.

---

This article is to determine the best practices for project structure, environments & reproducibility, coding for reusability, testing, and collaborating. 



**Project Structure**

> defined by Cookie Cutter DS:

```nohighlight
├── LICENSE
├── Makefile           <- Makefile with commands like `make data` or `make train`
├── README.md          <- The top-level README for developers using this project.
├── data
│   ├── external       <- Data from third party sources.
│   ├── interim        <- Intermediate data that has been transformed.
│   ├── processed      <- The final, canonical data sets for modeling.
│   └── raw            <- The original, immutable data dump.
│
├── docs               <- A default Sphinx project; see sphinx-doc.org for details
│
├── models             <- Trained and serialized models, model predictions, or model summaries
│
├── notebooks          <- Jupyter notebooks. Naming convention is a number (for ordering),
│                         the creator's initials, and a short `-` delimited description, e.g.
│                         `1.0-jqp-initial-data-exploration`.
│
├── references         <- Data dictionaries, manuals, and all other explanatory materials.
│
├── reports            <- Generated analysis as HTML, PDF, LaTeX, etc.
│   └── figures        <- Generated graphics and figures to be used in reporting
│
├── requirements.txt   <- The requirements file for reproducing the analysis environment, e.g.
│                         generated with `pip freeze > requirements.txt`
│
├── setup.py           <- Make this project pip installable with `pip install -e`
├── src                <- Source code for use in this project.
│   ├── __init__.py    <- Makes src a Python module
│   │
│   ├── data           <- Scripts to download or generate data
│   │   └── make_dataset.py
│   │
│   ├── features       <- Scripts to turn raw data into features for modeling
│   │   └── build_features.py
│   │
│   ├── models         <- Scripts to train models and then use trained models to make
│   │   │                 predictions
│   │   ├── predict_model.py
│   │   └── train_model.py
│   │
│   └── visualization  <- Scripts to create exploratory and results oriented visualizations
│       └── visualize.py
│
└── tox.ini            <- tox file with settings for running tox; see tox.readthedocs.io
```



![image-20210421111208208](C:\Users\ferdi\AppData\Roaming\Typora\typora-user-images\image-20210421111208208.png)



![image-20210421111347967](C:\Users\ferdi\AppData\Roaming\Typora\typora-user-images\image-20210421111347967.png)



**Environment:**

- Try to create the minimum reproducible environment so there is less dependencies so the project can be run locally by anyone.
  - docker/vagrant (for complex environments for virtual machines)
- ![image-20210421111831828](C:\Users\ferdi\AppData\Roaming\Typora\typora-user-images\image-20210421111831828.png)
- `watermark` allows people to know what version certain things are
- ![image-20210421111906858](C:\Users\ferdi\AppData\Roaming\Typora\typora-user-images\image-20210421111906858.png)

* to create isolated environments: `conda env` to create an environment on your machine

  `conda create -n <name> python =3`

  - venv, pyenv are alternatives
  - name environment as project root

* `conda env list` to see all environments

* include a `requirements.txt` to include dependancies where:

  ![image-20210422111206331](C:\Users\ferdi\AppData\Roaming\Typora\typora-user-images\image-20210422111206331.png)

  - to install all requirements, go into the directory of this file and do `pip install -r requirements.txt`
  - `pip freeze > requirements.txt` to create

* so activate environment, install necessary dependencies, then deactivate when necessary

* create pip project:

  ![image-20210422112312200](C:\Users\ferdi\AppData\Roaming\Typora\typora-user-images\image-20210422112312200.png)

* %debug in jupyter notebooks as a magic tool to debug code
  * use `u` to go up the error code, can use functions inside 
  * use `q` to quit the debugger
* %prun to find computational inefficiencies for memory and runtime



**Testing**

* use `pytest` and assertions to see and test code
* use @pytest.fixture for static data referencing

--

More resources:

1. [Video where notes are taken from](https://www.youtube.com/watch?v=EKUy0TSLg04)
2. [Cookie Cutter DS Structure](https://drivendata.github.io/cookiecutter-data-science/)
3. [DSLP Structure](https://github.com/dslp/dslp)
4. [Labs](https://github.com/drivendata/data-science-is-software)