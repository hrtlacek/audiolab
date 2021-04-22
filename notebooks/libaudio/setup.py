import setuptools

with open("README.md", "r", encoding="utf-8") as fh:
    long_description = fh.read()

setuptools.setup(
    name="libaudio", 
    version="0.0.1",
    author="Patrik Lechner",
    author_email="ptrk.lechner@gmail.com",
    description="Audio and DSP library",
    long_description=long_description,
    long_description_content_type="text/markdown",
    url="https://github.com/hrtlacek/libaudio",
    packages=setuptools.find_packages(),
    classifiers=[
        "Programming Language :: Python :: 3",
        "License :: OSI Approved :: MIT License",
        "Operating System :: OS Independent",
    ],
    python_requires='>=3.6',
)