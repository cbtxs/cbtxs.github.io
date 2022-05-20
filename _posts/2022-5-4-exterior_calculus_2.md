---
title: 有限元外微分(二)：流形上的外微分
author: cbtxs
date: 2022-05-04 22:31:14 +0800
katex: true
comments : true
categories: [偏微分方程数值解]
tags: [微分几何, 偏微分方程数值解, 有限元]
---

## **写在前面**
在[有限元外微分(一)](https://cbtxs.github.io/posts/exterior_calculus_1/)
中讲了基本的外代数的知识, 主要是在线性空间上的操作, 
本文讲的是在一个微分流形上, 每个点上都有一个切空间,
这个切空间上就可以定义外代数, 由此可以定义这个流形上的外微分.

## **流形**
一个 $$n$$ 维的光滑流形可以认为就是局部是 $$\mathbb R^n$$ 的拓扑空间,
流形上每一点有一个切空间, 流形 $$\Omega$$ 上一点 $$x$$ 处的切空间记为
$$T_x\Omega$$, 用一个元组 $$(x, v)$$ 表示 $$\Omega$$ 上的一个**切丛**, 其中 
$$x \in \Omega, v \in T_x\Omega$$, $$\Omega$$ 上所有的切丛组成一个新的流形, 
维数为 $$2n$$, 事实上, **切丛就是向量场**.

对于两个流形 $$\Omega, \Omega'$$, 若 $$\phi : \Omega \to \Omega'$$
是一个光滑映射, 那么定义切映射 $$D\phi_x$$ 是 $$T_x\Omega$$ 到
$$T_{\phi(x)}\Omega'$$ 的映射.
- 当 $$\Omega' = \R$$, $$\phi$$ 就是 $$\Omega$$ 上的标量函数, 用 
  $$\partial_v \phi(x)$$ 表示 $$D\phi_x(v)$$.
- 当 $$\Omega = \R$$, $$\phi$$ 是 $$\Omega$$ 上的一条曲线. 用 
  $$\frac{d\phi(t)}{dt}$$ 表示 $$D\phi_t(1)$$.

## **微分形式**
类似于切丛的概念, 可以定义**外形式丛**: $$(x, \mu)$$, 其中 $$x\in \Omega, \mu
\in \mathrm{Alt}^k T_x\Omega$$. 一个微分 $$k$$ 形式就是一种外形式丛, 即:
$$\omega = (x, \omega_x)$$ 是一个微分 $$k$$ 形式, 当对于任意的光滑矢量场 
$$\{v_i\}_{i=0}^{k-1}$$, 映射

$$
x \to \omega_x(v_0(x), \cdots, v_{k-1}(x))
$$

是无穷光滑的.

即光滑的外形式丛就是微分 $$k$$ 形式, 简记为 $$k$$ 形式, 这里用
$$\Lambda^k(\Omega)$$ 表示 $$\Omega$$ 上所有的微分 $$k$$ 形式组成的空间, 特别的,
$$ \Lambda^0(\Omega) = C^{\infty}(\Omega)$$, $$\Lambda^1(\Omega)$$
是所有的光滑余切向量场.

## **外积**
令 $$\Lambda(\Omega) = \oplus_k\Lambda^k(\Omega)$$, 逐点定义外积

$$
(\omega \wedge \eta)_x = \omega_x \wedge \eta_x
$$

## $$C^m$$ **光滑的微分形式**
现在考虑没有那么光滑的微分形式, 对于一个外形式丛 $$\omega = (x, \omega_x)$$, 
若映射 

$$
x \to \omega_x(v_0(x), \cdots, v_{k-1}(x))
$$

对于任意光滑向量场 $$\{v_i\}_{i=0}^{k-1}$$ 属于 $$C^m(\Omega)$$ 
即是 $$m$$ 次光滑的, 则称 $$\omega$$ 是一个 $$C^m$$ 微分 $$k$$ 形式,
其组成的空间记为 $$C^m\Lambda^k(\Omega)$$.

## **微分形式的积分**
微分 $$1$$ 形式可以在线上积分, 微分 $$2$$ 形式可以在面上积分, 微分 $$3$$
形式可以在体上积分.

## **外微分**
外微分算子 $$ \mathrm{d}: \Lambda^{k}(\Omega) \to \Lambda^{k+1}(\Omega)$$ 
是一个线性微分算子, 当 $$\Omega$$ 是 $$\R^n$$ 中的区域, 
$$T_x\Omega$$ 是 $$\R^n$$, 取 $$\omega \in \Lambda^k(\Omega)$$
则对于任意的光滑向量场 $$\{v_i\}_{i=0}^{k-1}$$, 定义:

$$
\mathrm{d}\omega(v_0, v_1, \dots, v_{k}) = \sum_{j=0}^{k}(-1)^{j}
\partial_{v_j} \omega_x(v_0, \dots, \hat v_{j}, \dots, v_{k})
$$

其中 $$\hat{v}_j$$ 表示没有这一项. 因为映射

$$
x \to \omega_x(v_0, \dots, v_{k-1})
$$

是光滑的, 所以上面的定义是 well define 的. 这样定义的微分算子 $$ \mathrm{d}$$ 
有以下两个性质:
- $$ \mathrm{d} \circ \mathrm{d} = 0$$
- $$\mathrm{d}(\omega\wedge\eta) = \mathrm{d}\omega\wedge\eta + (-1)^j \omega
  \wedge \mathrm{d}\eta, \quad \forall \omega \in \Lambda^j(\Omega), \eta \in 
  \Lambda^k(\Omega)$$

这里推导一下当 $$\{\partial_{x_i}\}_{i=0}^{n-1}|_x$$ 是 $$T_x\Omega$$
上的标准正交基时外微分的形式: 记 $$\{ \mathrm{d}{x_i}\}_{i=0}^{n-1}$$ 
是一形式的基, 满足:

$$
\mathrm{d}x_i(\partial_{x_j}) = \delta_{ij}
$$

则有:

$$
\mathrm{d}x_0\wedge \mathrm{d}x_1\wedge\cdots\wedge
\mathrm{d}x_{k-1}(\partial_{x_{\sigma(0)}}, \partial_{x_{\sigma(1)}}, \dots, 
 \partial_{x_{\sigma(k-1)}}) = 
 \begin{cases}
 \mathrm{sign}(\sigma)  & \quad \sigma < k\\
 \quad 0                & \quad \mathrm{other}
 \end{cases}
$$

若 $$\omega = a \mathrm{d}x_0\wedge \mathrm{d}x_1\wedge\cdots\wedge
\mathrm{d}x_{k-1}$$, 则:

$$
\mathrm{d}\omega(\partial_{x_0}, \partial_{x_1}, \dots, \partial_{x_{k-1}},
\partial_{x_m}) =  (-1)^{k}(\partial_m a)
$$

所以:

$$
\begin{aligned}
\mathrm{d}\omega 
& = (-1)^k \partial_m a\ \mathrm{d}x_0\wedge \mathrm{d}x_1\wedge\cdots\wedge
\mathrm{d}x_{k-1} \wedge \mathrm dx_m\\
& = \mathrm{d}a \wedge\mathrm{d}x_0\wedge \mathrm{d}x_1\wedge\cdots\wedge
\mathrm{d}x_{k-1}
\end{aligned}
$$

## **拉回映射**
对于光滑映射 $$\phi: \Omega \to \Omega'$$, 可以定义拉回映射 $$\phi^*$$, 将
$$\Lambda^k(\Omega')$$ 映射到 $$\Lambda^k(\Omega)$$: 满足:

$$
(\phi^*\omega)_x(v_0, \dots, v_{k-1}) = \omega_{\phi(x)}(D\phi_x(v_1), \dots,
D\phi(v_{k-1}))
$$

拉回映射有如下性质:
- 保外积: $$\phi^*(\omega\wedge\eta) = \phi^*\omega \wedge \phi^*\eta$$
- 保微分: $$\phi^*( \mathrm{d}\omega) = \mathrm{d}(\phi^*\omega)$$
- 保积分: 当 $$\phi$$ 是一个保定向的微分同胚, 则有:
    $$
    \int_{\Omega}\phi^* \omega = \int_{\Omega'} \omega, \omega \in
    \Lambda^k(\Omega')
    $$

当 $$\Omega$$ 是 $$\Omega$$ 的子流形, 那么包含映射 $$i : \Omega' \to \Omega$$
的拉回映射写作 $$ \mathrm{Tr}_{\Omega, \Omega'} : \Lambda(\Omega) \to
\Lambda(\Omega')$$, 当 $$\Omega' = \partial \Omega$$, 
$$ \mathrm{Tr}_{\Omega, \partial\Omega}$$ 简写为 $$ \mathrm{Tr}$$.  











