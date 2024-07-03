# nephroid-multipliers

### Inspiration
I was inspired to reproduce this phenomenon after watching Mathologer's video titled [Times Tables, Mandelbrot and the Heart of Mathematics](https://www.youtube.com/watch?v=qhbuKbxJsk8&list=WL&index=2) and the article [The reflection of light rays in a cup of coffee or the curves obtained with b^n mod p](http://xahlee.info/SpecialPlaneCurves_dir/Cardioid_dir/_p/LightsRaysReflections.pdf).


# Concept
Given a multiplier parameter $\lambda$ and a number of points $n$ with an iteration count of $n-1$, we can describe a beautiful method of generating a nephroid with $\lambda - 1$ cusps. 

The $n$ points are equally distributed around a circle of radius $1.$

For each point $p$, an edge is connected between that point and the neighbouring point which has an index of $\lambda p.$ i.e.

$$\text{For } \lambda = 3:$$
- the $0^{\text{th}}$ point would have an edge incident on the $(3\cdot 0)^{\text{th}}=0^{\text{th}}$ point, therefore mapping onto itself.
- the $1^{\text{st}}$ point would have an edge incident on the $(3\cdot 1)^{\text{th}}=3^{\text{rd}}$ point
- the $2^{\text{nd}}$ point would have an edge incident on the $(3\cdot 2)^{\text{th}}=6^{\text{rd}}$ point
- $\vdots$
- the $p^{\text{th}}$ point would have an edge incident on the $3p^{\text{th}}$ point.

Performing this process with a sufficient number of iterations results with a discrete graphic of a nephroid with $\lambda - 1$ cusps. For example

$\lambda = 2; \ n = 64:$

![](https://github.com/alfredo-reevo/nephroid-multipliers/blob/main/gifs/n=64,%20lambda%20=%202,%20c=c0.gif?raw=true)

With $\lambda = 2$, we can see that the shape generated will always be a cardioid (a nephroid with $1$ cusp). 

Increasing the number of points, the shape becomes more defined (subject to compression):

$\lambda = 2; \ n = 128:$
![](https://github.com/alfredo-reevo/nephroid-multipliers/blob/main/gifs/n=128,%20lambda%20=%202,%20c=c0.gif?raw=true)

$\lambda = 2; \ n = 256:$
![](https://github.com/alfredo-reevo/nephroid-multipliers/blob/main/gifs/n=256,%20lambda%20=%202,%20c=c0.gif?raw=true)

### Colour Schemes
To showcase another example with a different value of $\lambda,$ I also implemented a collection of colour matrices which alter the colour of the background, edges and points.

$\lambda = 6; \ n = 64:$
![](https://github.com/alfredo-reevo/nephroid-multipliers/blob/main/gifs/n=64,%20lambda%20=%206,%20c=c3.gif?raw=true)

$\lambda = 6; \ n = 128:$
![](https://github.com/alfredo-reevo/nephroid-multipliers/blob/main/gifs/n=128,%20lambda=6,%20c=c3.gif?raw=true)

$\lambda = 6; \ n = 256:$
![](https://github.com/alfredo-reevo/nephroid-multipliers/blob/main/gifs/n=256,%20lambda%20=%206,%20c=c3.gif?raw=true)
