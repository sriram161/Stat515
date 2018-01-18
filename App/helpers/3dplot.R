require('tidyverse')
library(rgl)

fixLights <- function(specular=gray(c(.3,.3,0))){
  clear3d(type="lights")
  light3d(theta=-50,phi=40,
          viewpoint.rel=TRUE, ambient=gray(.7),
          diffuse=gray(.7),specular=specular[1])
  
  light3d(theta=50,phi=40,
          viewpoint.rel=TRUE, ambient=gray(.7),
          diffuse=gray(.7),specular=specular[2])
  
  light3d(theta=0,phi=-70,
          viewpoint.rel=TRUE, ambient=gray(.7),
          diffuse=gray(.7),specular=specular[3])
}

