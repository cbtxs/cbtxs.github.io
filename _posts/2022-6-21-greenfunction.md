---
title: Green's function 
author: cbtxs
date: 2022-06-21 11:02:14 +0800
katex: true
comments : true
categories: [偏微分方程数值解]
tags: [偏微分方程, 偏微分方程数值解]
---

## **Poisson 方程的格林函数**
考虑问题:

$$
\begin{cases}
    -\Delta u = f \quad \text{in} \ \Omega\\
    u = g \quad \text{on} \ \partial \Omega
\end{cases}
\qquad \qquad (1)
$$

假设 $$G(x)$$ 满足:

$$
\begin{cases}
    -\Delta G = \delta_0 \quad \text{in} \ \Omega\\
    G = 0 \quad \text{on} \ \partial \Omega
\end{cases}
\qquad \qquad (2)
$$

则有: 

$$
\begin{aligned}
u(x) & = \int_{\Omega} \delta_x u(y) \ \mathrm dy\\
& = -\int_{\Omega} \Delta G(y-x) u(y) \ \mathrm dy\\
& = \int_{\Omega} \nabla G(y-x) \nabla u(y) \ \mathrm dy
 - \int_{\partial \Omega} u(y)\nabla G(y-x) \cdot \boldsymbol n \ \mathrm dS\\
& = \int_{\partial \Omega} G(y-x) \nabla u(y) \cdot \boldsymbol n -
\int_{\Omega} \Delta u(y) G(y-x) \ \mathrm dy\\
& \quad \quad - \int_{\partial \Omega} u(y)\nabla G(y-x) \cdot \boldsymbol n \ \mathrm dS\\
& = -\int_{\Omega} f(y)G(y-x) \ \mathrm dy - \int_{\partial \Omega} g\nabla
G(y-x)\cdot \boldsymbol n \ \mathrm dS
\end{aligned} 
$$

所以只要我们能解出问题 (2) 中的 $$G(y)$$ 那么对于任意的 $$L^1$$ 函数 $$f, g$$
都可以用上面的公式解决问题 (1).

### 特殊区域的格林函数
1. $$R^n$$ 上的格林函数
对问题 (2) 第一项左右同时傅里叶变换:

$$
-\hat{\Delta G} = \hat{\delta_0} \quad \Rightarrow \quad 
k^2 \hat{G} = 1 \quad \Rightarrow \hat{G} = \frac{1}{k^2}
$$

## **Helmholtz 方程的格林函数**













