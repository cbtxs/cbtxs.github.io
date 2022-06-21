---
title: 不等式(一)：基本不等式 
author: cbtxs
date: 2022-04-29 20:30:52 +0800
katex: true
comments : true
categories: [偏微分方程数值解]
tags: [偏微分方程, 偏微分方程数值解]
---

## **写在前面** 
不等式在偏微分方程数值解的误差分析中有至关重要的作用, 本文讲解常用的一些不等式.

## **常用不等式**
1. **Cauchy 不等式**

   $$
   ab \leq \frac{a^2}{2} + \frac{b^2}{2} \quad (a, b \in \R)
   $$

   **证明:** $$\ a^2+b^2 -2ab \geq 0$$
2. **Young 不等式** 若 $$1 < p, q < +\infty$$, $$\frac{1}{p} + \frac{1}{q}=1$$,
   则:

   $$
   ab \leq \frac{a^p}{p} + \frac{b^q}{q} \quad (a, b > 0)
   $$

   **证明:** 映射 $$x \to e^x$$ 是凸的, 即:

   $$
   e^{\lambda a + (1-\lambda)b} \leq \lambda e^a + (1-\lambda)e^b 
   $$

   所以:

   $$
   ab = e^{ \frac{1}{p}\ln a^p + \frac{1}{q}\ln b^q} \leq 
   \frac{e^{\ln a^p}}{p}  + \frac{e^{\ln b^q}}{q} = \frac{a^p}{p} + \frac{b^q}{q}
   $$


## 偏微分方程中的不等式
1. **$$\mathrm{Poincar\'e}$$ 不等式:** 令 $$U$$ 是一个 $$R^n$$ 中的有界连通开集,
   边界 $$C^1$$ 光滑, 那么存在只与 $$n, U$$ 有关的常数 $$C$$, 使得:

   $$
   ||u - (u)_U||_{L^2(U)} \leq C||Du||_{L^2(U)}
   $$

   其中 $$(u)_U = \frac{1}{\|U\|}\int_{U} u \mathrm dx$$.

2. **$$\mathrm{Poincar\'e}$$ 不等式:** 令 $$U$$ 是一个 $$R^n$$ 中的有界连通开集,
   边界 $$C^1$$ 光滑, 若 $$u \in H^1_0(U)$$ 那么存在只与 $$n, U$$ 
   有关的常数 $$C$$, 使得:

   $$
   ||u||_{L^2(U)} \leq C||Du||_{L^2(U)}
   $$











