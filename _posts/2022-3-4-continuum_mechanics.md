---
title: 张量分析基础
author: cbtxs
date: 2022-03-04 22:19:00 +0800
katex: true
categories: [连续介质力学]
tags: [连续介质力学, 微分几何, 张量分析]
---

## **写在前面**
**连续介质力学** 是理性力学的基础.

连续介质力学中的数学部分是张量分析, 也是微分几何的基础, 
之前学过梁灿彬教授的 《微分几何与广义相对论》中的微分几何部分,
但是因为太过抽象, 理解的不够深刻, 这次学习的是
《连续介质力学》这本书, 书中重点讲的是 $$\mathbb R^3$$ 中的微分几何, 
像导数算符, 克氏符之前都是抽象的概念,
现在终于找到了具体的对应, 解决了很多我以前的疑惑. 

本文是记录我在《连续介质力学》这本书的数学部分学习中学到的知识点以及自己的想法, 
文中有很多我将本书的知识点知识与抽象的微分几何知识的对应, 可能有误, 
有读者看到的话望给我发邮件指出, 谢谢!


## **1. Kronecker 符号, Levi-Civita 符号**

设 $$\boldsymbol{\{e_0, e_1, e_2\}}$$ 为 $$\mathbb R^3$$ 中一组标准正交基, 则有:

$$
\boldsymbol{e_i \cdot e_j} = \delta_{ij}, \quad 
\boldsymbol{e_i \times e_j} = \in_{ijk} \boldsymbol{e_k}
$$

其中 $$\delta_{ij}$$ 是 Kronecker 符号, $$\in_{ijk}$$ 是 Levi-Civita 符号:

$$
\delta_{ij} = 
\begin{cases}
1 \quad i = j\\
0 \quad i \neq j 
\end{cases}
, \quad
\in_{ijk} = 
\begin{cases}
1 \quad \quad i, j, k \text{是偶排列}\\
-1 \ \quad i, j, k \text{是奇排列}\\
0 \quad \quad i, j, k \text{有重复指标}\\
\end{cases}
$$

Levi-Civita 符号满足下面恒等式:

$$
\in_{ijk}\in_{lmn} = \left| 
\begin{matrix}
\delta_{il} & \delta_{im} & \delta_{in}\\
\delta_{jl} & \delta_{jm} & \delta_{jn}\\
\delta_{kl} & \delta_{km} & \delta_{kn}\\
\end{matrix} \right|
$$

## 2. 赝标量, 赝矢量
首先引入两种坐标变换
1. **镜面反射**: 关于 $$\boldsymbol{e_y, e_z}$$ 所在平面的镜面反射:

  $$
  \boldsymbol{e}'_x = -\boldsymbol{e}_x,\quad
  \boldsymbol{e}'_y = \boldsymbol{e}_y,\quad
  \boldsymbol{e}'_z = \boldsymbol{e}_z.
  $$

2. **反演变换**: 

  $$
  \boldsymbol{e}'_x = -\boldsymbol{e}_x,\quad
  \boldsymbol{e}'_y = -\boldsymbol{e}_y,\quad
  \boldsymbol{e}'_z = -\boldsymbol{e}_z.
  $$

在空间反演下改变方向的是 **真矢量**, 否则是 **赝矢量**.
**两个真矢量的叉乘是赝矢量.**

**事实上在微分几何中, 令** $$V = \mathbb E^3$$, **真矢量对应于** $$\Lambda V$$ 
**中的元素, 赝矢量对应于 $$\Lambda^2 V$$ 中的元素.**

## 3. 逆变矢量, 协变矢量

对于一个线性空间 $$V$$, 其上的所有线性泛函组成其 **对偶空间(共轭空间)** $$V^*$$. 
逆变矢量就是 $$V$$ 中的元素, 协变矢量就是 $$V'$$ 中的元素. 

设 $$\boldsymbol{\{e_0, e_1, e_2\}}$$ 为 $$\mathbb R^3$$ 中一组基(**逆变基**), 取
$$\boldsymbol{e^0, e^1, e^2} \in (\mathbb R^3)'$$ 满足:

$$
\boldsymbol{e^i(e_j)} = \delta_{ij}
$$

则 $$\boldsymbol{e^0, e^1, e^2}$$ 是 $$(\mathbb R^3)'$$ 中的一组基(**协变基**). 当 $$V$$
上定义了度规以后, 根据 **里斯表示定理**, 存在 
$$\boldsymbol{e^{0*}, e^{1*}, e^{2*}} \in (\mathbb R^3)$$ 与 $$\boldsymbol{e^0, e^1, e^2}$$ 
对应.(逆变基在 $$V$$ 中的表示)

## 4.度规张量
前面讲的东西其实是有一些问题的:
为什么有标准正交基? 因为有向量内积? 那为什么有向量内积? $$\mathbb E^3$$
上天然有内积么? 不是的, 这是需要定义的, 即定义一个双线型泛函

$$
A : \mathbb E^3 \times \mathbb E^3 \to \mathbb R
$$

满足 3 个条件(内积的 3 个条件, 省略)

而度规张量就是内积的另一个名字. 内积的定义一般为:

$$
(u, v) = u \cdot v 
$$

而若 $$A$$ 是一个正定矩阵

$$
(u, v) = uAv = u_i A^{ij}v_i
$$

也是一个内积, 而其中 $$A^{ij}$$ 就是一个度规张量.
















