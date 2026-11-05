"""Register CMake-installed Muscat with Python packaging tools.

The conda package is named muscat-core, but the Python distribution is muscat.
Native libraries and conda-only dependencies remain managed by the recipe.
"""

import os
import tempfile

from setuptools import setup


def install_metadata():
    setup(
        name="muscat",
        version=os.environ["PKG_VERSION"],
        description="Tools for finite element computations",
        url="https://gitlab.com/drti/muscat",
        license="BSD-3-Clause",
        packages=[],
        install_requires=[
            "numpy>=2",
            "scipy>=1.12",
            "sympy",
            "eigency>=5.0.1.0",
            "networkx>=3",
            "dill",
            "h5py",
        ],
        script_args=["egg_info", "--egg-base", os.environ["SP_DIR"]],
    )


if __name__ == "__main__":
    # Do not let an upstream setup.cfg or pyproject.toml override this metadata.
    original_directory = os.getcwd()
    with tempfile.TemporaryDirectory(prefix="muscat-metadata-") as directory:
        try:
            os.chdir(directory)
            install_metadata()
        finally:
            os.chdir(original_directory)
