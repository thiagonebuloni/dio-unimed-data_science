from setuptools import setup, find_packages

with open("README.md", "r") as f:
    page_description = f.read()

with open("requirements.txt") as f:
    requirements = f.read().splitlines()

setup(
    name="jokenpo",
    version="0.0.1",
    author="Thiago Nebuloni",
    author_email="https://github.com/thiagonebuloni",
    description="jokenpo game",
    long_description=page_description,
    long_description_content_type="text/markdown",
    url="100470956+thiagonebuloni@users.noreply.github.com",
    packages=find_packages(),
    install_requires=requirements,
    python_requires='>=3.8',
)
