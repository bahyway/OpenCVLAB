Build Container Command:

```
# cd "H:\[AllProjects\OpenCVLAB\anaconda_solution"
docker build -t opencvlab .
```

Run Container Command:

```
docker run -it --rm -p 8888:8888 opencvlab
```

Activate the Conda Environment:

```
# use source inside docker linux container , if it is on the laptop os (windows0 then without source)
source activate opencvlab
```
