#import "@preview/commute:0.2.0": node, arr, commutative-diagram
#import "@preview/ctheorems:1.1.3": *
#import "template.typ": *

#show: thmrules.with(qed-symbol: $square$)

#set page(width: 16cm, height: auto, margin: 1.5cm)
#set heading(numbering: "1.1.")

#let theorem = thmbox("theorem", "定理", fill: rgb("#eeffee"))
#let lemma = thmbox("lemma", "引理", fill: rgb("#eeffee"))
#let corollary = thmplain(
  "corollary",
  "Corollary",
  base: "theorem",
  titlefmt: strong
)
#let definition = thmbox("definition", "定义", fill: rgb("eeeeff"))

#let example = thmplain("example", "例子")
#let proof = thmproof("proof", "证明")

#show: template.with(
  title: [抽象代数笔记],
  authors: (
    (
      name: "詹奇",
    ),
  ),
  lof: false,
  lot: false,
  lol: false,
  bibliography_file: none,
  paper_size: "a4",
  cols: 1,
  code_font: "Cascadia Mono",
  accent: "#DC143C",
)
#show link: underline
#set text(
  font: "Songti SC",
)

本文是刘思齐老师的#link("https://space.bilibili.com/85657899/channel/collectiondetail?sid=3808884")[抽象代数课程]笔记。

= 域与线性空间

== 定义与例子

#definition("域")[
  一个域系指以下资料:
  1. 集合 $F$, 有 $1_F, 0_F in F$ 满足 $1_F != 0_F$, 有时简写为 $1, 0$.
  2. $F$ 上的加法记为 $+$, 满足加法结合律, 加法交换律, 有加法单位元 $0$ 与加法逆元 $-a$. (这保障了加法逆元是唯一的).
  3. $F$ 上的乘法记为 $*$, 满足乘法结合律, 乘法交换律, 有乘法单位元 $1$, 对于非零元 $a$, 有乘法逆元 $a^(-1)$. (这保障了乘法逆元是唯一的).
  4. 乘法对加法的分配律成立.
]

我们记 $F^*$ 为 $F$ 中所有非零元素的集合.

为了说明为什么我们要求 $0_F != 1_F$, 有以下引理:

#lemma[
  1. $0_F dot 0_F = 0_F$.
  2. $forall x in F, x dot 0_F = 0_F$
]
#proof[
  1. $0_F = 0_F + 0_F = 0_F dot 0_F + 0_F dot 0_F$, 两边减去 $0_F dot 0_F$ 即得.
  2. $x dot 0_F = x dot (0_F + 0_F) = x dot 0_F + x dot 0_F$, 两边减去 $x dot 0_F$ 即得.
]

由此可见, 若 $0_F = 1_F$, 那么 $F$ 中所有元素满足 $x = x dot 1_F = x dot 0_F = 0_f$, 这显然不是我们所期望的.

同理, 若对于域 $F$ 上的 $0_F$ 有逆元, 那么我们有 $0_F = a dot 0_F = 1_F$, 又推出了域中所有元素都是 $0_F$.

#example("域")[
  1. 有理数域 $QQ$, 实数域 $RR$, 复数域 $CC$, 对于我们熟知的加法和乘法运算构成域.
  2. $F = QQ(sqrt(2)) = { x + sqrt(2) y | x, y in QQ}$.
  3. $F = QQ(root(3, 2)) = {x + root(3, 2) y | x, y in QQ}$
  4. $F = QQ(sqrt(2), sqrt(3)) = {x_1 + x_2 sqrt(2) + x_3 sqrt(3) + x_4 sqrt(4) | x_i in QQ}$.
  5. 任取素数 $p$, $F = ZZ_p = {0, 1, 2, ..., p-1}$, 其中加法和乘法都是模 $p$ 的. 其中乘法逆的存在是不显然的. 对于 $F$ 中任意一个非零元 $k$, 有, 我们考虑映射 $T: F_P^* -> F_P^*: y |-> k y $, 易证 $T$ 是双射, 从而存在逆元 $m$ 使得 $k m = 1$.
  6. 设 $F$ 是一个域, 则 $F(x) = { P(x) / Q(x) | P(x), Q(x) in F[x], Q(x) != 0 }$ 同样构成域.
  7. $k = CC(x, sqrt(x^3 + 2))$, 可以视作 $CC(x)(y)$ 其中 $y^2 = x^3 + 2$, 则 $k = {R_1(x) + R_x(y) | R_1, R_2 in CC(x)}$.
]

#definition("线性空间")[
  设 $F$ 是一个域, $V$ 是一个集合, 若 $V$ 上定义了加法运算 $+: V times V -> V$, 以及数乘运算 $*: F times V -> V$, 满足以下条件:
  1. 对于任意 $u, v, w in V$, 有 $u + (v + w) = (u + v) + w$.
  2. 对于任意 $v in V$, 有 $v + 0 = v$.
  3. 对于任意 $v in V$, 存在 $w in V$, 使得 $v + w = 0$.
  4. 对于任意 $v in V$, 有 $1 v = v$.
  5. 对于任意 $a, b in F, v in V$, 有 $a(b v) = (a b)v$.
  6. 对于任意 $a in F, u, v in V$, 有 $a(u + v) = a u + a v$.
  7. 对于任意 $a, b in F, v in V$, 有 $(a + b)v = a v + b v$.
]

线性空间的观点对于研究域的结构有很大的帮助, 例如我们可以将 $QQ(sqrt(2))$ 视作 $QQ$ 上的二维线性空间. $RR$ 可以视作 $QQ$ 上的无穷维线性空间.

#example[
  $FF_4 = FF_2(alpha) = {x + alpha y | x, y in FF_2}$. 其中的问题是我们该取什么样的 $alpha$. 考虑 $FF_2[x]$ 上的所有二次多项式 $f(x) = x^2 + p x + q$, 及 $x^2, x^2 + x, x^2 + 1, x^2 + x + 1$. 其中前三个都是可约的, 所以我们取 $alpha$ 满足 $alpha^2 + alpha + 1 = 0$.
]

== 域的同态

我们先从线性空间上的同态(线性映射)开始.

#definition("线性映射")[
  设 $V_1, V_2$ 是域 $F$ 的线性空间, 若映射 $f: V_1 -> V_2$ 满足:
  1. 对于任意 $u, v in V_1$, 有 $f(u + v) = f(u) + f(v)$.
  2. 对于任意 $a in F, v in V_1$, 有 $f(a v) = a f(v)$.
  那么我们称 $f$ 是一个线性空间的同态, 即线性映射.
]

类似地, 我们可以定义域的同态.

#definition("域的同态")[
  设 $F_1, F_2$ 是域, 若映射 $f: F_1 -> F_2$ 满足:
  1. $f(0_F_1) = 0_F_2, f(1_F_1) = 1_F_2$.
  2. 对于任意 $a, b in F_1$, 有 $f(a + b) = f(a) + f(b)$.
  3. 对于任意 $a, b in F_1$, 有 $f(a b) = f(a) f(b)$.
  那么我们称 $f$ 是域的同态.
]

不同于群和环的同态, 事实上域的同态是一个"没什么用"的概念, 有下面的定理:

#theorem[
  设 $F_1, F_2$ 是域, $f: F_1 -> F_2$ 是域的同态, 则 $f$ 是单射.
]

#proof[
  设 $a, b in F_1$ 满足 $f(a) = f(b)$. 设 $x = b - a$. 若 $x != 0$, 那么存在 $y in F_1$, 使得 $x y = 1$. 那么有 $0 dot f(y) = (f(b) - f(a)) dot f(y) = f(1) = 1$, 矛盾. 所以 $x = 0$, 即 $a = b$.
]

这也就说明若存在一个 $phi: F_1 -> F_2$, 那么我们视 $F_1$ 为 $F_2$ 的子域, 所以在研究域的时候, 我们不关心域的同态, 而更关心子域和域扩张的概念.

#definition("子域与扩域")[
  设 $F$ 是域, 若 $E$ 是 $F$ 的子集, 且 $E$ 也构成域, 那么我们称 $E$ 是 $F$ 的子域, 同时称 $F$ 是 $E$ 的扩域, 记为 $F "/" E$.
]

#definition("域的同构")[
  设 $F_1, F_2$ 是域, 若存在双射 $phi: F_1 -> F_2$, 且满足域的同态, 那么我们称 $F_1$ 与 $F_2$ 是同构的. 若 $F_1 = F_2$, 我们称 $phi$ 是域 $F_1$ 的自同构. 我们称在自同构下不变的元素为域 $F_1$ 的不动域.
]

#example[
  1. $RR "/" QQ, CC "/" RR, QQ(sqrt(2)) "/" QQ, FF_4 "/" FF_2$.
  2. $f: CC -> CC, x + i y |-> x - i y$ 是域 $CC$ 的自同构, 其中不动域是实数域 $RR$.
  3. $QQ(sqrt(2))$ 与 $QQ(sqrt(3))$ 不存在同态.
]

事实上, $QQ, FF_p$ 是某种程度上的"最小"域, 我们有以下定理:

#theorem[ $QQ, FF_p$ 没有真子域. ]

#theorem[
  若 $F$ 是 $E$ 的扩域, 则 $F$ 是 $E$ 上的线性空间, 我们记 $[F: E]= dim_E F$, 称为 $F "/" E$ 的次数. 若 $[F: E] < oo$, 则称 $F "/" E$ 为有限扩张.
]

== 域的特征

#definition("域的特征")[
  设 $F$ 是域, 若存在最小的正整数 $n$, 使得 $n 1_F = 0_F$, 那么我们称 $n$ 为域 $F$ 的特征, 记为 $"char"(F) = n$. 若不存在这样的 $n$, 我们称 $F$ 的特征为 $0$.
]

容易看出如果域的特征是正的, 那么它一定是素数. 若 $"char"(F) = 0$, 那么 $QQ$ 是 $F$ 的子域; 若 $"char"(F) = p$, 那么 $FF_p$ 是 $F$ 的子域.
(注意这里的子域可以看作是存在一个域同态而不是严格的包含). 这就是说明了每个域都是 $QQ$ 或 $FF_p$ 的扩域.

在正特征的域上有一个有趣的运算. 若 $"char"F = p > 0$, 我们考虑 $(x+y)^p $, 由二项式定理, 我们有:
$(x+y)^p = x^p + y^p + C_p^1 x^(p-1) y + ... + C_p^(p-1) x y^(p-1) + y^p = x^p + y^p$.
我们记 $sigma: F->F$ 满足 $x|-> x^p$, 由上面的性质容易发现 $sigma$ 是一个域同构, 我们称 $sigma$ 为域 $F$ 的 Frobenius 自同构.

== 域的扩张

#definition[
  设 $E "/" F$ 是一个域扩张, 对于 $E$ 中的子集 $S$, 有 $F(S)$ 为 $E$ 中包含 $F union S$ 的最小子域, 称为 $F$ 在 $S$ 上生成的域. 若 $S$ 是有限的且 $F(S) = E$, 我们称 $E$ 是由 $F$ 上的有限生成扩张. 若对 $E$ 的任意有限子集, $F(S) != E$, 则称 $E$ 为无限生成的.
]

#example[
  1. $QQ(sqrt(2))$ 是 $QQ$ 上的有限生成扩张, 也是有限扩张.
  2. $RR(x)$ 有理函数域是 $RR$ 上的有限生成扩张, 但不是有限扩张.
  3. $F = QQ$, $E = QQ(2^(1/2^k)), k=1,2,...$. 我们考虑逐步添加元素. $E_1 = QQ(2^(1/2)), E_2 = E_1(2^(1/2^2)) = QQ(2^(1/2^k))$, 容易得到 $E_k = QQ(2^(1/2^k))$. $F = E_0 subset.eq E_1 subset.eq ..., E = union.big_(k=1)^oo E_k$.
]

我们研究的域扩张要解决的问题: 一个*尽可能简单*的域扩张是什么样的?

#theorem[
  有限扩张一定是有限生成扩张, 反之不然.
]
#proof[
  若 $[E:F] = n$, 可推得 $E = "Span"_F(e_1, ..., e_n)$, $E = F(e_1, ..., e_n)$.
]

#definition("代数扩张与超越扩张")[
  设扩域 $E"/"F$, 若 $u in E$ 存在 $f(u) = 0, f != 0, f in F[x]$, 则称 $u$ 为 $F$ 上的代数元. 若 $E/F$ 中的每个元素都是代数元, 则称 $E"/"F$ 为代数扩张. 若存在 $u in E$ 使得 $u$ 不是任何 $f in F[x]$ 的根, 则称 $u$ 为超越元, $E"/"F$ 为超越扩张.
]

#example[
  1. $QQ(sqrt(2))$ 为代数扩张.
  2. $QQ(x), QQ(pi)$ 为超越扩张.
]

现在我们有了三个“不太大”的扩张, 有限扩张, 有限生成扩张和代数扩张, 我们的目标是理解这三个概念之间的关系, 从而理解域上较小的扩张是什么样的.

我们先证明一些有关代数数的性质.

#lemma[
  设 $E "/" F$, $alpha, beta$ 是 $F$ 上的代数元, 则 $alpha + beta$ 和 $alpha beta$ 也是代数元.
]

这一引理有不同的证法. 一种证法基于对称多项式的理论直接构造出对应的多项式, 我们这里给出另一种证法.

#proof[
  设 $f(alpha) = 0, f in F[x], g(beta) = 0, g in F[x], deg f = n, deg g = m$. 定义 $h(y) = R_(x)(f(x), g(y-x)) in F[y]$. 其中 $R_x(A[x], B[x])$ 为多项式 $A, B$ 关于变量 $x$ 的结式. 我们断言 $h(alpha + beta) = 0$, 这是因为 $f(x)$ 与 $g(alpha + beta -x)$ 有公共根 $x = alpha$. 对于 $alpha beta $ 同理.
]

现在我们来看具体的关系.

#theorem[
  有限扩张一定是代数扩张, 反之不然.
]

#proof[
  设 $[E "/" F] = n$ 是有限扩张, 对于任意 $u in E$, 我们要找 $f in F[x]$ 使得 $f(u) = 0$. 考虑 $1, u, u^2, ... in E$. 由 $dim_F (E) = n$, 所以 $1, u, u^2, ..., u^n$ $F-$线性相关, 所以存在 $b_0, ..., b_n in F$ 不全为0, 使得 $b_0 + b_1 u + ... + b_n u^n = 0$, 故 $u$ 是代数元.

  反例: $F = QQ$, $E = QQ(2^(1/2^k)), k=1,2,...$ 是代数扩张, 但不是有限生成扩张, 更不是有限扩张.
]

由上文的例子我们知道代数扩张不能推出有限生成扩张, 有限生成扩张也不能推出代数扩张.
看起来代数扩张和有限生成扩张都是不太好的扩张, 但下面的定理告诉我们, 有限生成扩张和代数扩张的交集是一个很好的扩张.

#theorem[
  有限生成的代数扩张是有限扩张. 具体来说, 对于域扩张 $E "/" F$, 以下两个事实等价:
  1. $E "/" F$ 是有限扩张.
  2. $E = F(u_1, ..., u_n)$, 其中 $u_1, ..., u_n$ 是 $F$ 上的代数元. 此时 $E "/" F$ 是代数扩张.
]

1. (1) => (2). 设 $[E: F] = n$, $u_1, ... u_n$ 是 $E "/" F$ 的基, 则 $E = F(u_1, ..., u_n)$. 因为 $E "/" F$ 是代数扩张, 所以 $u_1, ..., u_n$ 是代数元.

2. (2) => (1). 为了证明这一点, 我们需要一些定义和引理.

#definition("中间域")[
  设 $E "/" F$, 则域 $K$ 是 $E$ 和 $F$ 的中间域, 若 $F subset.eq K subset.eq E$.
]

#example[
  下图即为中间域的一个例子.
#align(center)[
  #commutative-diagram(
  node((0, 1), $QQ(sqrt(3))$),
  node((1, 0), $QQ$),
  node((-1, 0), $QQ(sqrt(2), sqrt(3))$),
  node((0, -1), $QQ(sqrt(2))$),
  arr((0,1), (-1, 0), ""),
  arr((0,-1), (-1, 0), ""),
  arr((1, 0), (0, 1), ""),
  arr((1,0), (0, -1), "")
)]]

#lemma("维数公式")[
  设 $E "/" F$ 是有限扩张, $K$ 是一个中间域, 则 $[E:F] = [E:K][K:F]$.
]
#proof[
  有限维线性空间的线性子空间自然也是有限的.
  设 $u_1, ..., u_n$ 是 $K "/" F$ 的基, $v_1, .., v_m$ 是 $E "/" K$ 的基, 下面构造 $E "/" F$ 的基.
  对于 $beta in E$, 存在 $alpha_1, ..., alpha_m in K$ 使得 $beta = alpha_1v_1+...+ alpha_m v_m$, 对于每个 $alpha_i$ 存在 $a_(i 1), ..., a_(i n) in F$, 使得 $alpha_1 = a_(i i) u_1 +...+ a_(i n) u_n$, 整理可得 $beta = Sigma_(i=1)^m Sigma_(j=1)^n a_(i j) u_j v_i$.  所以 $dim_F E <= n dot m$. 
  下证 $u_j v_i$ 线性无关. 设 $Sigma_(i,j) c_(i j) u_j v_i = 0$, 推得 $Sigma_i (Sigma_j c_(i j) u_j)v_i = 0$. 由 $v_1, ..., v_m$ 线性无关, 所以 $Sigma c_(i j) u_j = 0$, 由 $u_1, ..., u_n$ 线性无关, 得 $c_(i j) = 0$.
]

#lemma[
  单代数扩张是有限扩张.
]
#proof[
  设 $E = F(u)$, $u$ 是 $F$ 上的代数元, 我们要证明 $[E:F] < oo$. 设 $f in F(x), f != 0$ 使得 $f(u) = 0$, 并且 $f$ 是满足该条件的次数最小的首一多项式. 设 $deg f = n$, 则 $E = f(u) = "Span"_F (1, u, ..., u^(n-1))$, 由此 $dim_F E = n$, 是有限的.
]

回到我们想要证明的结论, 我们同样可以逐个添加元素. $F subset.eq F(u_1) subset.eq F(u_1, u_2) subset.eq ... subset.eq F(u_1, ..., u_n)$. 每次的扩张都是单代数扩张, 也就是有限扩张, 维数就是有限的. 而由维数公式我们知道最终的维数也就是 $[F(u_1, u_2): F(u_1)] dot [F(u_1): F] dot ...$.

至此, 我们证明了有限生成的代数扩张一定是有限扩张. $square$

#theorem[
  若 $F subset.eq K subset.eq E$, 其中 $K "/" F$ 代数, $E "/" K$ 代数, 那么 $E "/" K$ 代数.
]
#proof[
  设  $alpha in E$, 存在 $f in K[x], f != 0$, $f(alpha) = 0$. 设 $f(x) = x^n + a_1 x^(n-1) + ... + a^n, a_i in K$. 设 $K' = F(a_1, ..., a^n)$, 注意到 $a_1, ..., a_n$ 在 $F$ 上代数, 则 $K' "/" F$ 是有限扩张. 再注意到 $K'(alpha) "/" K'$ 是一个单扩张, 所以 $K'(alpha) "/" K'$ 是有限扩张, 可得 $[K'(alpha): F] = [K'(alpha)] [K':F] = oo$, 也是有限扩张. 因为 $F subset.eq K'$, 所以 $F(alpha) subset.eq K'(alpha)$ 也是有限扩张.
  所以 $F(alpha)$ 是代数扩张, $alpha$ 是代数元.
]

== 代数闭包

上一节我们考虑的是小的扩张长什么样, 这一节我们讨论大的扩张, 尤其是大的代数扩张.

#definition("代数闭包")[
  设 $F$ 是域, 若 $E "/" F$ 是代数扩张, $K = {alpha in E | alpha "在" E "代数"}$, 显然 $K$ 是中间域, 我们称 $K$ 是 $F$ 在 $E$ 中的代数闭包.

  若 $K$ 没有真代数扩张, 我们称 $K$ 是代数闭域.

  若 $K "/" F$ 是代数扩张且 $K$ 是代数闭域, 我们称 $K$ 是 $F$ 的一个(绝对)代数闭包.
]

例如 $CC$ 就是代数闭的.

#theorem[
  $QQ$ 在 $CC$ 中的相对代数闭包就是 $QQ$ 的一个绝对代数闭包.
]
#proof[
  我们证明一个更一般的版本: $E$ 是代数闭的, $F$ 是 $E$ 的子域, $K$ 是 $F$ 在 $E$ 中的代数闭包, 则 $K$ 是 $F$ 的绝对代数闭包.

  只需证明 $K$ 是代数闭的. 假设 $K'$ 是 $K$ 的一个代数扩张, $alpha in K'$, 则由 $alpha$ 的极小多项式 $f(x) in K[x]$, 因为 $K subset.eq E$, 所以 $f(x) in E[x]$, 所以 $f(x) = (x-alpha_1) ... (x-alpha_n) in K[x], a_i in E$. 另一方面 $alpha_i$ 是 $K$ 上的代数元, 因为 $K$ 是相对代数闭包, 所以 $a_i in K$, 所以 $f(x) = x - alpha$. 最终我们得到 $K' = K$.
]

== Galois 群初探

一个自然的问题是我们还没有定义抽象的群, 那么该如何讨论 Galois 群. 事实上在 Galois 研究时他并没有采用抽象的群概念, 而是考虑一种特殊的群, 即*置换*群.

#definition("对称群")[
  设集合 $X$, $S(X) = {sigma: X -> X | sigma "是双射"}$, 我们可以定义映射的复合和逆运算, 也有单位映射 $e$. 事实上它满足如下性质:
  1. $(sigma tau) mu = sigma (tau mu)$.
  2.  $sigma e = e sigma = sigma$.
  3.  $sigma sigma^(-1) = sigma^(-1) sigma = e$.
  我们称 $(S, e)$ 是 $X$ 上的对称群.
]

事实上上述的性质其实就是抽象群的定义.

我们一般不需要研究整个置换, 而是研究一部分的封闭子集, 也就引出了置换群的概念.

#definition("置换群")[
  若 $G subset.eq S$ 满足于任意 $sigma, tau in G$, 有 $sigma tau in G$, $sigma^(-1) in G$, 则称 $G$ 是 $X$ 上的置换群.
]

更进一步的, 我们可以定义域 $E$ 上的自同构群, 记为 $"Aut"(E) = {sigma in S(E) | sigma(0) = 0, sigma(1) = 1, sigma(alpha + beta) = sigma(alpha) + sigma(beta), sigma(alpha beta) = sigma(alpha) sigma(beta), ...}$.

#definition("Galois 群")[
  设 $E "/" F$ 是域扩张, 我们定义 $"Gal"(E "/" F) = {sigma in "Aut"(E) | sigma|_F = id_F}$, 称为 $E "/" F$ 的 Galois 群.
]

#theorem[
  若 $E "/" F$ 是有限扩张, 则 $"Gal"(E "/" F)$ 是有限群.
]
#proof[
  设 $E = "Span"_F(u_1,...,u_n)$, 其中 $u_n$ 在 $F$ 上代数. 对于 $u_1$, 有极小多项式 $f_1 in F[x]$, 满足 $f_1(u_1) = mu_1^n + a_1 u_1^(n-1) + ... +  a_n = 0, a_i in F$.

  设 $sigma in "Aut"(E), sigma|_F = id_F$, 考虑 $sigma$ 作用 $f_1$. $sigma(f_1(u_1)) = sigma(0) = 0 = sigma(u_1^n + ... + a_n) = f_1(sigma(mu_1))$.

  这就说明了对于 $X_1 = {sigma in E | f_1(alpha) = 0}$, $sigma|x_1$ 是 $X_1$ 的一个置换. 同样的对于任意 $u_1$ 取 $f_i$, 定义 $X = union.big_(i=1)^n X_i$, $sigma$ 是 $X$ 上的一个置换. 由于 $X$ 是有限集, 所以 $sigma$ 是有限的.
]

#definition("不动域")[
  设 $E$ 是一个域, 且 $G <= "Aut"(E)$, 定义 $"Inv"(G) = {alpha in E | sigma(alpha) = alpha, sigma in G}$, 称为 $G$ 的不动域.
]

#theorem("Artin 引理")[
  设 $E$ 是域, $G <= "Aut"(E)$, 则 $"Inv"(G)$ 是 $E$ 的子域, 且 $[E:F] <= |G|$, 于是 $E "/" F$ 是有限扩张.
]
#proof[
  设 $G = {eta_1 = e, ..., eta_n}, |G| = n$. 下证对于 $m > n$, $E$ 中的任意 $u_1, ..., u_m$ 是线性相关的. 考虑 $eta_j (x_1mu_1  + ... + x_mu_m) = x_1 eta_j(mu_1) + ... + x_m eta_j(mu_m) = 0$, 一定有非零解, 所以存在 $(x_1, ..., x_m) in E^m$. 下证 $x_j in F$.

  我们从这些解挑一个含0元素最多的解, 记为 $x = x_1, ..., x_m$, 不妨假设 $x_1 != 0, x_1 = 1$, 下证 $x_2, ..., x_m in F$. 假设 $x_2 in.not F$, 则存在 $eta in G$ 使得 $eta(x_2) != x_2$, 考虑 $eta(x) = (1, eta(x_2), ..., eta(x_m))$, 显然 $eta(x)$ 仍是方程的解, 且 $eta(x)$ 0 的个数和 $x$ 中个数一样多.

  考虑 $eta(x) - x$ 仍然是方程组的解, 但包含更多的0, 另一方面 $eta(x_2) - x_2 !=0 $, 矛盾!
]

事实上我们可以证明 $[E: F] = |G|$, 但这需要一些额外的知识.

有了这两个方向的引理,  我们可以考虑它们的复合, 就有了下面两个问题:

Q1. $E "/" F$ 是有限扩张, $G = "Gal"(E "/" F)$ 是有限群, 我们可以定义 $F' = "Inv"(G)$ 由定义可知 $F subset.eq F'$. 问题是  $F'$ 与 $F$ 能否相等?

Q2. 有 $E$ 域, $G <= "Aut"(E)$, 我们有 $F = "Inv"(G)$, 其中 $E "/" F$ 是有限扩张, 于是 $G' = "Gal"(E "/" F)$ 是有限群, 由定义可知 $G subset.eq G'$. 问题是 $G$ 与 $G'$ 能否相等?

对于 Q2, 我们的结论是肯定的, 这也被称为 Artin 定理.

而对于 Q1, 则不能保证, Galois 理论研究的就是在什么样的有限扩张 $E "/" F$ 可以使得 $"Inv"("Gal"(E "/" F)) = F$.

#example[
  1. $E = QQ(sqrt(2)), F = QQ$, 易知 $"Gal"(E "/" F) = { id }$, 所以 $F' = E != F$. 我们考虑 $alpha = root(3, 2)$, 极小多项式 $f(x) = x^3 - 2 = (x-alpha)(x^2 + alpha x + alpha^2)$. 可以看到另外两个复数根都不在 $E$ 中, 方程的其他根没有 $E$ 中.
  2. $F = FF_2(T), E = F(sqrt(T)), sqrt(T) = s$, $E$ 可以写成 $"Span"_T (1,s)$, 考虑 $sigma: E -> E$ 是保 $F$ 的一个自同构, $sigma(1) = 1, sigma(s) = u$. 因为 $s^2 = T$, 所以 $sigma(s)^2 = sigma(T) = T$, 即 $u^2 = T$. 考虑 $u = a + b s, a, b in F$, $u^2 = a^2 + b^2 T = T$, 得到 $a^2 = T(1+b^2) = T(1+b)^2$. 考虑两边的次数, 只能有 $a = 0, b = 1$, 所以 $u = s$, 即 $sigma (s) =s$, 所以 $F' = E$.
]

为了避免这两种坏情况, 我们后面要引入分裂域, 正规扩张等概念.
对于这些问题的深入探讨, 要留到最后一部分, 等我们讨论完环论和群论的基础知识.

= 环与模

== 定义与例子

#definition("环")[
  设 $R$ 是一个集合, 定义了加法运算 $+: R times R -> R$, 以及乘法运算 $*: R times R -> R$, 满足以下条件:
  1. 对于任意 $a, b, c in R$, 有 $a + (b + c) = (a + b) + c$.
  2. 对于任意 $a, b in R$, 有 $a + b = b + a$.
  3. 存在 $0 in R$, 使得对于任意 $a in R$, 有 $a + 0 = a$.
  4. 对于任意 $a in R$, 存在 $-a in R$, 使得 $a + (-a) = 0$.
  5. 对于任意 $a, b, c in R$, 有 $a(b c) = (a b) c$.
  6. 对于任意 $a, b, c in R$, 有 $a(b + c) = a b + a c$.
  7. 对于任意 $a, b, c in R$, 有 $(a + b) c = a c + b c$.

  我们称 $(R, +, dot)$ 构成一个环. 
  
  若存在 $1_R in R$ 满足 $a 1_R = 1_R a = a$, 称 $1_R$ 为单位元, 这样的环称为幺环.

  若 $a b = b a$, 我们称 $R$ 是交换环.
]

#example("环")[
  1. $ZZ, ZZ_m = {0, 1, dots, m -1}$.
  2. $QQ, RR, CC$ 等所有的域都是环.
  3. 多项式环.
  4. 有线性空间 $V$, 则 $"End"(V)$ 是一个环.
  5. 考虑 $R = m ZZ, m in NN, m >= 2$. $R$ 没有单位元.
  6. $ZZ[i]$ 为 Gauss 整数环. $ZZ[eta_m], eta_m = e^(2pi i / n)$.
  7. 设集合 $X$, 环 $R$, $R^X = {f: X -> R}$, 定义 $f + g = x |-> f(x) + g(x)$, $f g = x |-> f(x) g(x)$, 则 $R^X$ 是一个环.
  8. 假设 $G$ 是有限群, $F$ 是群, 我们定义 $R = "Span"_F(G)$, 不难按定义写出 $R$ 的加法和乘法, 叫做 $G$ 的群代数, 这是群表示论的基础.
  9. $HH = "Span"_RR (1, i, j, k)$,其中 $1, i, j , k$ 是四元数, 定义 $i^2 = j^2 = k^2 = -1, i j = k, j k = i, k i = j, j i = -k, k j = -i, i k = -j$, 这是一个含有单位, 非交换, 非零元可逆的环. 容易看出 $(a + b i + c j + d k)(a - b i - c j - d k ) = a^2 + b^2 + c^2 + d^2 > 0$.
]

#definition("模")[
  设 $R$ 是一个环, $M$ 是一个集合, 定义了加法运算 $+: M times M -> M$, 以及乘法运算 $*: R times M -> M$, 满足以下条件:
  1. 对于任意 $a, b, c in M$, 有 $a + (b + c) = (a + b) + c$.
  2. 对于任意 $a, b in M$, 有 $a + b = b + a$.
  3. 存在 $0 in M$, 使得对于任意 $a in M$, 有 $a + 0 = a$.
  4. 对于任意 $a in M$, 存在 $-a in M$, 使得 $a + (-a) = 0$.
  5. 对于任意 $a, b in R$, $x in M$, 有 $a(x + y) = a x + a y$.
  6. 对于任意 $a, b in R$, $x in M$, 有 $(a + b) x = a x + b x$.
  7. 对于任意 $a, b in R$, $x in M$, 有 $(a b) x = a (b x)$.
  8. 对于任意 $x in M$, 有 $1 x = x$.

  我们称 $(M, +, dot)$ 构成一个 左$R$-模. 同理可以定义右$R$-模.
]

#example("模")[
  1. 域上的线性空间是模.
  2. $ZZ_m, ZZ times ZZ_m -> ZZ_m$, 定义 $(a, overline(x)) |-> overline(a dot x)$. 更进一步的, 如果 $G$ 是交换群, 可以定义 $ZZ times G -> G$, 其中 $(a, g) |-> g^a$, 我们称为 $ZZ-j$ 模.
  3. (还有很多例子但我懒得写了)
]

== 环与模同态

#definition("环同态")[
  设 $R, S$ 是两个环, $phi: R -> S$ 是一个映射, 若满足:
  1. 对于任意 $a, b in R$, 有 $phi(a + b) = phi(a) + phi(b)$.
  2. 对于任意 $a, b in R$, 有 $phi(a b) = phi(a) phi(b)$.
  则称 $phi$ 是一个环同态. 若 $R, S$ 都是幺环, 且 $phi(1_R) = 1_S$, 则称 $phi$ 是幺环同态.
]

其他的一些我们所期待的性质都是可以推出的, 例如 $phi(0) = 0$, $phi(-a) = -phi(a)$, $phi(a^n) = phi(a)^n$ 等.

#definition("模同态")[
  设 $R$ 是环, $M, N$ 是两个模, $phi: M -> N$ 是一个映射, 若满足:
  1. 对于任意 $a, b in M$, 有 $phi(a + b) = phi(a) + phi(b)$.
  2. 对于任意 $a in R$, $x in M$, 有 $phi(a x) = a phi(x)$.
  则称 $phi$ 是一个模同态.
]

#example[
  1. 考虑 $ZZ -> ZZ_m$ 上的一个映射 $a |-> (n mod m)$ 是环同态. 有趣的是不存在环同态 $ZZ_m -> ZZ$. 假设存在, 则 $phi(1) = 1, phi(2) = 2, ..., phi(m) = m$, 但是 $phi(m) = phi(0) = 0$, 矛盾.
  2. 1 中的例子不难推广到 $ZZ_(m n) -> ZZ_m$.
  3. $R = F[x]$, 对于 $alpha in F$, 定义 $phi(f) = f(alpha)$, 则 $phi$ 是一个环同态.
]

#definition[
  设 $phi: R -> S$ 是一个环同态, 则 $ker(phi) = {a in R | phi(a) = 0}$, 称为 $phi$ 的核.
  而 $"img" (R) = {phi(a) | a in R}$, 称为 $phi$ 的像.
]

对于模也是一样的, 我们不再赘述.

注意到环的核与像都是在加法与乘法下封闭的, 我们可以从中提炼出子环的概念.

#definition[
  设 $R$ 是一个环, $S subset.eq R$, 若满足 $S$ 是 $R$ 的子集, 且对于任意 $a, b in S$, 有 $a + b, a b in S$, 则称 $S$ 是 $R$ 的子环.
]

显然, 对于环同态, 它的核与像是一个子环. 不过核有一个更强的性质: $a in ker(phi), b in R => a b in ker(phi)$, 这是因为 $phi(a b) = phi(a) phi(b) = 0 phi(b) = 0$.
这启示我们子环和子环之间也是不同的. 对于这种子环称为理想.

#definition[
  设 $R$ 是一个环, $I subset.eq R$, 若满足 $I$ 是 $R$ 的子集, 且对于任意 $a in I, b in R$, 有 $a b in I$, 则称 $I$ 是 $R$ 的左理想. 右理想类似定义.
]

不难看出, 对于交换环来说 $a R$ 自然构成一个理想, 因为 $a x + a b = a (x + y), a x a y = = a (a x y)$. 这种理想称为由 $a$ 生成的主理想.

#example[
  1. $ZZ$ 中的理想都是主理想. 假设 $I$ 是 $ZZ$ 的一个理想, 且 $I != {0}$, 则存在 $m in I, m > 0$ 是最小的, 则 $I = m ZZ$. 若存在 $n > 0$ 不能表示为 $m$ 的倍数, 则根据裴蜀定理, 存在 $x, y in ZZ$ 使得 $m x + n y = gcd(m, n) < m$, 矛盾.
  2. 考虑 $R = ZZ(sqrt(-5))$, $I = { a + b sqrt(-5) | a equiv b mod 2 }$, 不难证明 $I$ 是 $R$ 的一个理想. 它不是主理想, 可以视作 $I = "Span" {2, 1 + sqrt(-5)}$.
]

我们知道域有特征的概念, 但当我们考虑环的时候, 这个概念似乎不太好. 以 $ZZ_6$ 为例, 它的特征是 $6$, 然而对于元素 $2$ 来说, $3 dot 2 = 0$, 这似乎是一个特征为 $3$ 的环. 为了解决这个问题, 我们引入了零因子的概念.

#definition[
  设 $R$ 是一个环, 若存在 $a, b in R, a != 0, b != 0$, 使得 $a b = 0$, 则称 $a$ 和 $b$ 是 $R$ 中的零因子.

  若交换幺环 $R$ 中没有零因子, 则称 $R$ 是一个整环.
]

而在整环上, 特征有了非常好的定义, 我们有下面的定理.

#theorem[
  设 $R$ 是一个整环, 若 $a in R, a != 0, m in NN, m a = 0$, 则存在素数 $p$ 使得 $ forall b in R, p b = 0.$
]
#proof[
  任取 $b in R$, 考虑 $0 = 0 dot b = (m a) b = a (m b) = 0 => m b = 0$. 找素数与域上的证明类似.
]

== 子环, 理想与商环

上文已经介绍过子环和理想的概念. 我们讨论一些例子.

#example[
  1. 所有环同态的 $ker$ 都是理想. (后面会证明所有的理想也都是某一个环同态的 $ker$).
  2. $R$ 和 ${0_R}$ 是 $R$ 的理想, 称为平凡理想.
  3. 若 $R$ 是幺环, $I$ 是理想, 且 $1_R in I$, 则 $I = R$.
  4. 若 $R$ 是域, 则 $R$ 的理想只有 ${0_R}$ 和 $R$ 本身.
  5. $R = CC[x]$, 我们证明这也是主理想环. 首先 $CC[x]$ 是一个整环. 假设理想 $I != 0, I != 1$, 假设存在多项式 $P(x) in I, deg p >= 1$. 不妨设 $P$ 在 $I$ 是次数最下的, 这对于任意 $Q(x) in I$, 考虑带余除法 $Q(x) = a(x)P(x) + b(x)$, 其中 $deg b < deg P$, 由理想定义可知 $a(x) P(x) in I => b(x) in I$. 从而 $b = 0$.
  6. 考虑 R= $CC[x, y]$ 考虑 $I = x R + y R = {
    p in R | p(0, 0) = 0
  }$, 这不是主理想.
]

上面的讨论引出了生成的概念.

#definition[
  设 $R$ 是一个环, $a in R$, 考虑 $a$ 所生成的理想 $I_a = (a) = {sum_(i=1)^k f_k a g_k | f_k, g_k in R, k in NN}$.
]

#definition[
  设环 $R$, $I$ 是 $R$ 的一个理想, 定义 $R$ 上的二元关系 $~_I$: $a ~_I b <=> b - a in I$, 不难验证这是一个等价关系.
  在等价类 $R "/" I$ 上定义 $(a + I) + (b + I) := a + b + I$; $(a + I) (b + I) := (a b + I)$. 可以验证这是良定义的, 且构成一个环, 称为 $R$ 关于 $I$ 的商环.
]

不难发现, 考虑 $pi: R -> R "/" I, a |-> a + I$, 则 $pi$ 是一个满射环同态, 且 $ker(pi) = I$.

#example[
  1. $QQ(sqrt(2)) = QQ[x] "/" (x^2 - 2)$
  2. $CC = RR[x] "/" (x^2 + 1)$
]

== 同态基本定理与中国剩余定理

#theorem("第一同态定理")[
  设 $phi: R -> S$ 是一个环同态, 则 $R "/" ker(phi) tilde.equiv "img"(phi)$.
]
#proof[
  记 $I = ker(phi)$ 考虑映射 $psi: R "/" I -> "Img"(phi), a + I |-> phi(a)$, 不难验证各种性质...
]

#theorem[
  若 $phi: R -> S$ 是满同态, $J = ker(phi)$ 是 $R$ 的理想, 那么

  1. 对于 $R$ 中包含 $J$ 的子环 $R'$, 记 $S' = phi(R')$, 则 $S'$ 是 $S$ 的子环; 反之对于 $S$ 的子环 $S'$, 记 $R' = phi^(-1)(S')$, 则 $R'$ 是 $R$ 中包含 $J$ 的子环.
  特别的, 上述两条若将 "子环" 换成 "理想" 也成立, 且此时 $R "/" R' tilde.equiv S "/" S'$.
  2. 对于每个包含于 $J$ 的 $R$ 的理想 $I$, 存在唯一的环同态 $overline(phi): R "/" I -> S$ 使得 $phi = overline(phi) compose pi_I$, 其中 $pi_I$ 是 $R$ 到 $R "/" I$ 的商同态, 且此时 $ker(overline(phi)) = J "/" I$, 于是 $(R"/" I) "/" (J "/" I) tilde.equiv R "/" J$.
]

#proof[
  1. $R'$ 是子环 $=>$ $S' = phi(R')$ 是子环, 容易得到.
  2. $S'$ 是子环 $=>$ $R'$ 是子环, 容易得到.
  3. $R'$ 是理想 $=>$ $S' = phi(R')$ 是理想. 设 $s_1 in S', s_2 in S$, 要证明 $s_1 s_2 in S'$. 由定义知存在 $r_1 in R' s.t. s_1 = phi(r_1)$, 由满同态知存在 $r_2 in R s.t. s_2 = phi(r_2)$, 则 $s_1 s_2 = phi(r_1) phi(r_2) = phi(r_1 r_2) in S'$.
  4. $S'$ 是理想 $=>$ $R'$ 是理想.
  5. 要证 $R "/" R' tilde.equiv S "/" S'$, 定义 $psi: a + R' |-> phi(a) + S'$, 良定义不难看出. 容易验证 $psi$ 是单的, 满的, 且为环同态.
  定理的第一条证明完毕, 我们回答了对于包含 $ker$ 的子环或者理想的情况.
  6. 首先 $I$ 是 $J$ 的理想. 定义 $overline(phi): R "/" I -> S, a + I |-> phi(a)$, 同样不难证明这是良定义的, 满的, 同态.
  在验证完 $ker(overline(phi)) = J "/" I$ 后, 由第一同构定理自然有 $R "/" I "/" ker(overline(phi)) tilde.equiv "Img"(overline(phi)) = S tilde.equiv R "/" J$, 这一结论我们称为第三同构定理.
  7. $overline(phi)(a+ I) = phi(a) = 0 => a in ker(phi) = J => a + I in J "/" I => ker(overline(phi)) subset.eq J "/" I$. 另一边也是显然的.
  8. 最后证明唯一性.
  这一部分回答的是被 $ker$ 包含的理想的情况.
]

上面回答了两个理想有包含关系的情况, 下面我们考虑两个理想的和与积, 显然它们都是理想.

#theorem("第二同构定理")[
  $phi: I "/" (I sect J) -> (I + J) "/" J$, $x + I sect J |-> x + J$ 是一个环同构.
]

#example[
  $R = ZZ, I = 2 ZZ, J = 3 ZZ, I + J = ZZ, I sect J = 6ZZ$, 则 $2ZZ "/" 6 ZZ tilde.equiv ZZ "/" 3 ZZ$.
]

#definition[
  设 $I, J$ 是 $R$ 的理想, 若 $I + J = R$, 则称 $I, J$ 互素.
  对于幺环, 这一条件等价于 $1_R in I + J$.
]

#theorem("中国剩余定理")[
  设 $I, J$ 是 $R$ 的互素理想, 则 $R "/" (I sect J) tilde.equiv (R "/" I) times (R "/" J)$.
]

#proof[
  1. 构造 $phi: R -> (R "/" I) times (R "/") J$, $x -> (x + I, x + J)$.
  2. 由于 $I + J = R => x = y + z, y in I, z in J$, 所以 $phi(x) = (z + I, y + J)$.
  3. 我们要说明 $phi$ 是满的.
  4. 不难看出 $ker(phi) = I sect J$. 由环同构第一定理知结论成立.
]

接下来我们将推广到多个理想的情况, 这时我们需要额外的条件.

#definition("理想的乘积")[
  设 $I, J$ 是 $R $ 的理想, 定义 $I J = {sum_(i=1)^n a_i b_i | a_i in I, b_i in J, n in NN}$. 这是一个理想.
]

$I J subset.eq I sect J$, 但一般来说不相等. 例如 $R = ZZ, I = 2 ZZ, J = 2 ZZ$, 则 $I J = 4 ZZ, I sect J = 2 ZZ$.

我们关注什么时候 $I J = I sect J$.

#lemma[
  设 $R$ 是一个交换幺环, $I_1, ..., I_n$ 是 $R$ 的理想, 且两两互素, 则
  1. $I_1 ... I_n = I_1 sect ... sect I_n$.
  2. $I_1 + ... + I_(n-1) $ 与 $I_n$ 互素.
]

#proof[
  采用数学归纳法.
  1. 当 $n=2$ 时 (2) 是显然的. 对于 (1), 显然有 $I_1 I_2 subset.eq I_1 sect I_2$. 考虑 $x in I_1 sect I_2$, 由 $I_1 + I_2 = R$, 所以 $1_R = y + z, y in I_1, z in I_2$. 于是 $x = x 1_R = x y + x z = y x + x z in I_1 I_2$.
  2. 当 $n > 2$ 时, $I_n + I_k = R$, 所以 $R = Pi_(k=1)^(n-1) (I_n + I_k) = I_n + I_1 ... I_(n-1) <=> I_n + I_1 sect ... sect I_(n-1) = R$. (1) 同样由归纳假设易得.
]

由这一引理和前面二元版本的中国剩余定理, 我们可以得到多元版本的中国剩余定理.

#theorem("中国剩余定理")[
  设 $R$ 是交换幺环, $I_1, ..., I_n$ 是两两互素的理想, 此时有同构 $R slash (I_1 sect ... sect I_n) = (R slash I_1) times ... times (R slash I_n)$
]

#example[
  $R = ZZ, I_1 = 3ZZ, I_2 = 5ZZ, I_3 = 7ZZ$, 可以得到 $R slash (I_1 sect I_2 sect I_3) tilde.equiv R slash I_1 times R slash I_2 times R slash I_3$, 即 $ZZ slash 105 ZZ tilde.equiv ZZ slash 3 ZZ times ZZ slash 5 ZZ times ZZ slash 7 ZZ$.
]

== 整环与整除性

环 $supset.eq$ 幺环 $supset.eq$ 交换幺环 $supset.eq$ *整环* $supset.eq$ 整闭整环 $supset.eq$ GCD 环 $supset.eq$ *唯一分解整环* $supset.eq$ *主理想整环* $supset.eq$ *欧几里得整环* $supset.eq$ 域. 

我们这里只涉及部分概念.

#definition("整环")[
  设 $R$ 是一个非平凡的交换幺环, 若 $R$ 没有零因子, 则称 $R$ 是一个整环.
]

我们知道对于整数环 $ZZ$, 存在有理数域 $QQ supset.eq ZZ$, 一个自然的想法是对于任意整环 $R$, 是否存在域 $F$ 使得 $R supset.eq F$? 这个问题的答案是肯定的.

我们首先定义 $S = R slash {0}$, 显然 $S$ 在乘法下依旧封闭且 $1_R in S$.
下面要构造一个域 $F$, 其中的元素形如 $r / s, r in R, s in S$.
考虑 $(r, s) in R times S$, 定义等价关系 $(r_1, s_1) ~ (r_2, s_2) <=> r_1 s_2 = r_2 s_1$.

考虑 $F = R times S slash ~$, 我们可以在上面定义加法和乘法, 容易验证这是一个域, 我们称为 $R$ 的分式域.

#theorem[
  设 $R$ 是一个整环, $F$ 是其分式域, 若有另一个域 $F'$ 以及单的环同态 $phi: R -> F'$, 则存在唯一的域同态 $psi: F -> F'$ 使得 $phi = psi compose i_R$.
  换句话说, 分式域是整环的最小域.
]

#definition("素理想")[
  设 $R$ 是一个非零交换幺环, $I$ 是 $R$ 的理想, 若 $R slash I$ 是一个整环, 则称 $I$ 是 $R$ 的素理想.
]

#theorem[
  $I$ 是素理想 $<=>$ $I != R$ 且对于任意 $a, b in R$, 若 $a b in I$, 则 $a in I$ 或者 $b in I$.
]

#proof[
  1.($=>$) $R slash I$ 非零可推出 $I != R$. $a b in I => a b + I = (a + I)(b + I) = 0_(R slash I)$. $R slash I$ 是整环可推出 $a + I =0 or b + I =0$, 即 $a in I or b in I$.
  2. 反之, $I != R$ 可推出 $R slash I$ 非零. 考虑 $a + I, b + I in R slash I$, 若 $(a + I)(b + I) = 0$, 则 $a b in I$, 由条件知 $a in I or b in I$, 即 $a + I = 0 or b + I = 0$.
]

#definition("极大理想")[
  设 $R$ 是一个非零交换幺环, $m$ 是 $R$ 的理想, 若 $R slash m$ 是一个域, 则称 $m$ 是 $R$ 的极大理想.
]

显然极大理想是素理想. 和素理想一样, 极大理想也有另一种定义方式:

#theorem[
  $m$ 是极大理想 $<=>$ $m != R$ 且对于包含 $m$ 的理想只能是 $m$ 或者 $R$.
]

#proof[
  1. $=>$ $R slash m$ 是域, 所以 $R slash m$ 的理想只能是 $0$ 或者 $R slash m$, 所以 $R$ 中包含 $m$ 的理想只能是 $m$ 或者 $R$.
  2. 若 $R slash m$ 不是域, 则一定存在非平凡的理想, 则 $m$ 一定含于这个非平凡理想, 与条件矛盾.
]

#definition("整除")[
  设 $R$ 是一个整环, $a, b in R$, 若存在 $c in R$ 使得 $a = b c$, 则称 $b$ 整除 $a$, 记作 $b | a$.
]

#definition("单位")[
  设 $R$ 是一个整环, 若 $a$ 有乘法逆, 则称 $a$ 是一个单位. $R$ 中所有单位构成一个群, 记为 $R^x$.
]

#example[
  1. $R = ZZ, R^x = {1, -1}$.
  2. $R = ZZ[i], R^x = {1, -1, i, -i}$.
  3. $R = ZZ[sqrt(3)]$, 牵扯到 Pell 方程.
]

在谈论整数的唯一分解性时, 我们一般只讨论正数的情况; 同样的, 在谈论任意一个环的时候, 我们也希望不用考虑正负号的问题, 也就是模掉单位群:

#definition("相伴")[
  $a ~ b <=> exists u in R^x, s.t. a = u b $. 不难证明这是一个等价关系.
]

我们下文所讨论的相等即是在相伴意义下的.

#definition[
  1. $a, b in R, a != 0, b != 0$, 若 $a | b, b divides.not a$, 则称 $a$ 是 $b$ 的一个真因子.
  2. $a in R, a != 0$, 若 $a$ 不能分解为一系列真因子的乘积, 则称 $a$ 是不可约的.
  3. $a in R, a != 0$, 若 $(a)$ 是素理想, 则称 $a$ 是素的.
]

一个自然的问题是不可约元与素元有何关系? 结论是素元肯定是不可约的, 不可约的不一定是素元.

#example[
  1. $R = CC[x,y] slash (y^2 - x^3) = CC[t^2, t^3] $, 考虑 $x = x + (y^2 - x^3)$, 它是不可约的, 但不是素的.
  2. $R = ZZ[sqrt(-3)]$, $a = 2$, 这也是不可约但是不是素的例子.
]

#lemma[
  $R$ 是整环, $q in R, q != 0, q in.not R^x$, $q$ 不可约 $<=>$ $(q)$ 是极大主理想.
]

利用上述引理不难证明:

#theorem[
  素元一定是不可约元.
]

#proof[
  设 $p$ 是素的, $(p) subset.eq (a)$, 则 $p = a b$, 由素的定义, 则 $a in (p) $ 或 $b in (p)$.
  若 $a in (p)$, 则 $(a) = (q)$; 若 $b in (p)$, 可得 $a in R^x => (a) = R$.
]

另一方面, 在环上加一些限制之后, 不可约元就一定是素的.
这一限制就是可以谈论最大公因子.

#definition[
  对于整环 $R$, $a, b in R$ 且非零.
  - 若 $d in R$ 满足 $d | a "且" d | b$, 则称 $d$ 是一个公因子.
  - 设 $d$ 是一个公因子, 若对 $a, b$ 的另一个公因子 $c$ 有 $c | d$, 则称 $d$ 是 gcd.
  - 若对任意的 $a, b in R$, 存在 $a, b$ 的 gcd, 则称其为 GCD 整环.
]

#example[
  $R = ZZ[sqrt(-3)]$, 取 $a = 4, b = 2(1+sqrt(-3))$, $2$ 和 $1 + sqrt(-3)$  都是公因子.
]

#theorem[
  若 $R$ 是GCD整环, 则 $R$ 的不可约元是素元.
  我们也称满足不可约元一定是素元的整环满足素性条件.
]

#definition[
  设整环 $R$, $a in R$ 非零非单位, 若 $a$ 可分解为有限个不可约元的乘积, 且这个分解在相伴意义下唯一, 则称 $R$ 是唯一分解整环 UFD.
]

不难看出 UFD 一定是 GCD, 反之不然.

#definition[
  设 $R$ 是整环, 若 $R$ 中不存在如下形式的序列, $a_1, a_2 ,...,$,
  其中每个 $a_(i+1)$ 都是 $a_i$ 的真因子, 则称 $R$ 满足因子链条件 (ACCP).
]

#theorem[
  设 $R$ 是整环, 则 $R$ 是 UFD 等价于 ACCP + 素性条件.

  一个显然的推论是 ACCP + 素性条件 $<=>$ UFD.
]

#definition[
  设 $R$ 是整环, 若 $R$ 中的每个理想都是主理想, 则称 $R$ 是主理想整环, 简称 PID.
]

#theorem[
  PID 是 UFD, 反之不然.
]

)这段内容我个人比较无感, 就跳过了.

== 多项式环

对于一个交换幺环 $R$, 不难定义 $R[x]$.

#definition[
  设 $R$ 是 UFD, 对于 $f in R[x]$, $f(x) = a_0 + a_1 x + ... + a_n x^n$,
  称 $d = gcd_R(a_0, ..., a_n)$ 为 $f$ 的最大公因子, 若 $d$ 是单位, 则称 $f$ 是本原的.
]

== 主理想整环上的有限生成模分类

#definition[
  设 $R$ 是 PID, $M$ 是 $R$ 上的模, 若存在 $a_1, ..., a_n in M$, 使得 $M = (a_1, ..., a_n)$, 则称 $M$ 是有限生成的.
]

#theorem[
  对于任意主理想整环上的有限生成模,
  存在真理想的降链 $(d_1) supset.eq (d_2) supset.eq ... supset.eq (d_n)$,
  使得 $M = (R slash (d_1)) times ... times (R slash (d_n))$, $d_i$ 叫不变因子.
]

证明有时间再讲.

= 群与群作用

== 定义与例子

#definition[
  回顾一下, 若集合 $G$ 上定义了一个二元运算 $dot: G times G -> G$, 满足结合律, 有单位元, 有逆元, 则称 $(G, dot)$ 是一个群.

  若群 $G$ 上定义了一个映射 $G times X -> X$, 满足 $1 x = x$, $(a b) x = a (b x)$, 则称 $(G, X)$ 是一个群作用.
]

同样不难定义群上的子群, 群同态.

#example[
  1. 域, 线性空间, 环, 模在加法下都是群.
  2. 有限群. 
    1. $|G| = 1, G = {e}$; 
    2. $|G| = 2, G = {e, a}, a^2 = e$, 此时 $G = ZZ_2$.; 
    3. $|G| = 3, G = {e, a, a^2}, a^3 = e$, 此时 $G = ZZ_3$;
    4. $|G| = 4, G_1 = {e, a, a^2, a^3}, a^4 = e$, 此时 $G_1 = ZZ_4$. $G_2 = ZZ_2 times ZZ_2$.
    5. $|G| = 5, G = {e, a, a^2, a^3, a^4}, a^5 = e$, 此时 $G = ZZ_5$.
    6. $|G| = 6, G_1 = {e, a, a^2, a^3, a^4, a^5}, a^6 = e$, 此时 $G = ZZ_6$. $G_2 = S_3 = {e, (1 2), (1 3), (2 3), (1 2 3), (1 3 2)}$. 这是第一个非交换群.
  3. 无限群.
    1. $"GL"(V) = {phi: V -> V | phi "线性, 可逆"}$, 称为一般线性群.
    2. $"SL"(V) = {phi in "GL"(V) | det(phi) = 1}$, 称为特殊线性群.
    3. $O(V) = {phi in "GL"(V) | phi "保内积"}$, 称为正交群.
    4. $"SO"(V) = {phi in "O"(V) | det(phi) = 1}$, 称为特殊正交群.
  4. 多面体群
]


== 子群, 正规子群与商群

#definition[
  设 $(G, dot)$ 是一个群, $H subset.eq G$, 若 $H$ 是 $G$ 的子集, 且对于任意 $a, b in H$, 有 $a dot b in H$ 且 $a^(-1) in H$, 则称 $H$ 是 $G$ 的子群.
]

#definition("陪集")[
  设 $G$ 是一个群, $H subset.eq G$ 是一个子群, $a in G$, 定义左陪集 $a H = {a h | h in H} eq.delta G slash H$, 右陪集 $H a = {h a | h in H} eq.delta H "/" G$.
]

#definition("正规子群")[
  设 $G$ 是一个群, $H subset.eq G$ 是一个子群, 若对于任意 $a in G$, 有 $a H = H a$, 则称 $H$ 是 $G$ 的正规子群, 记为 $H lt.tri G$.
]

#definition[
  设 $H lt.tri G$, 在 $G slash H$ 上定义 $(x H) (y H) = (x y) H$, 则 $G slash H$ 是一个群, 称为 $G$ 关于 $H$ 的商群.
]

#example[
  1. 在交换群上, 正规子群等价于子群.
  2. $G_1 = {1, c, c^2, c^3}$, $H = {1, c^2}$, $G_1 slash H = {H, c H}$; 考虑另一个四个元素的群 $G_2 = {1, a, b, a b}$, $H = {1, a}$, $G_2 slash H = {H, b H}$.
  我们可以发现 $H_1 tilde.equiv H_2, G_1 slash H_1 tilde.equiv G_2 tilde.equiv H_2$, 然而 $G_1 != G_2$.
  3. 定义群的中心 $Z(G) = {a in G | forall b in G, a b = b a}$, 容易验证 $Z(G) lt.tri G$.
  4. 定义交换子 $[a, b] = a^(-1) b^(-1) a b$.
  $[a, b]^(-1) = [b, a], g[a,b]g^(-1) = [g a g^(-1), g b g^(-1)]$. 所有交换子也构成子群, 而事实上是正规子群, 记为 $[G, G]$.
  $G slash [G, G]$ 是一个交换群.
]

#theorem[
  子群 $|H| | |G|$.
]

== 同态基本定理

#definition[
  设 $(G, dot)$ 和 $(H, *)$ 是两个群, $phi: G -> H$ 是一个映射, 若满足 $phi(a dot b) = phi(a) * phi(b)$, 则称 $phi$ 是一个群同态.
]

#theorem[
  设群同态 $phi: G -> H$, 则 $G slash ker(phi) tilde.equiv "Img"(phi)$.
]

#theorem[
  若群同态 $phi: G -> H$ 是满的, 则 $H tilde.equiv G slash ker(phi)$.
]

#definition[
  设 $H, K$ 是 $G$ 的子群, 定义 $H K = {h k | h in H, k in K}$.
  若 $K$ 是正规子群, 则 $H K$ 是子群, 且 $K lt.tri H K$.
]

#example[
  $G = {1, r, r^2, s, s r, s r^2}$,
  $H = {1, s}$, $K = {1, s r}$,
  $H K$ 不是子群.
]

三同构定理的证明和之前环的情况类似, 我们不再赘述.

#definition[
  1. 设 $G$ 是有限群, 若有 $G$ 的子群链 $G = G_0 > G_1 > ... > G_k = k$ 满足每个 $G_i$ 都是 $G_(i-1)$ 的正规子群, 则称 $k$ 是 $k$-次正规子群.
  2. 若有 $G$ 的子群链 $G = G_0 > G_1 > ... > G_k = {e}$ 满足每个 $G_i$ 都是 $G_(i-1)$ 的正规子群, 则称为一个次正规子群链.
  3. 对于一个次正规子群链, 若 $G_i slash G_(i-1)$ 都是单群(没有非平凡的正规子群), 则称为一个合成列, 这些单群称为合成因子.
]

#theorem("Jordan-Holder 定理")[
  有限群 $G$ 的极小合成列有相同的长度, 且合成因子在同构意义下唯一.
  即给定 $G = G_0 lt.tri G_1 lt.tri ... lt.tri G_s = {e}$, $G = H_0 lt.tri H_1 lt.tri ... lt.tri H_t = {e}$, 要证 $t = s$ 且 $G_i slash G_(i-1)$ 与 $H_i slash H_(i-1)$ 在调整顺序后两两同构.
]

#proof[
  对 $s$ 归纳.
  - 当 $s = 1$ 时, $G$ 是单群, 显然成立.
  - 假设 $s-1$ 时成立, 考虑 $s$ 的情形. 若 $G_1 = H_1$, 则结论显然成立.
  若 $G_1 != H_1$, 因为 $G_0 slash G_1, H_0 slash H_1$ 都是单群, 所以 $G_1, H_1$ 都是极大正规子群. 考虑 $G' = G_1 dot H_1$ 也是正规的.
  可见 $G' = G$. 设 $G_1 and H_1 = N_2$.
  则 $G_0 slash G_1 = G_1 dot H_1 slash G_1 = H_1 slash G_1 and H_1 = H_1 slash N_2$, $H_0 slash H_1 = G_1 slash N_2$.
  取极小合成列 $N_2 lt.tri N_3 lt.tri ... lt.tri N_r = {e}$.
  构造 $G = G_0 lt.tri G_1 lt.tri N_2 lt.tri ... lt.tri N_r = H_0 lt.tri H_1 lt.tri N_2 lt.tri ... lt.tri N_r = {e}$.
  可得 $r = s, r = t$, 故 $s = t$. 通过这四个合成列的相互关系与归纳假设, 可得结论.
]

在这一定理基础上, 对于研究所有有限群, 我们可以1. 找出所有有限单群, 2. 在给定合成因子的前提下找出所有 $G$.
看起来第二个问题比较简单, 但事实上第二个问题到现在也没有很好的算法; 而第一个问题有限单群的分类已经基本完成了:

(1) $ZZ_p$, $p$ 为素数
(2) $A_n, n >= 5$
(3) 李型单群
(4) 从(3)导出的
(5) 散在单群 26 个

== 群作用与Sylow定理

这一节我们假设 $G$ 是一个有限群, 被作用的空间也是有限的.

#definition[
  设群 $G$ 与集合 $X$, 若映射 $mu: G times X -> X, (g, x) |-> g x$ 满足:
  1. $e x = x$
  2. $(g h) x = g (h x)$
  则称 $(G, X)$ 是一个群作用.
]

1. 对于 $g in G$, 考虑 $t_g: X -> X, x |-> g x$ 是一个平移.
2. 对于 $x in G$, 考虑 $G x = { g x | g in G}$, 称为 $x$ 的轨道. 和陪集一样, 轨道只能相等或者不相交.
3. 我们还可以定义 $"stab"(x) = {g in G | g x = x}$, 称为 $x$ 的稳定化子群. 若 $"stab"(x) = G$, 则称 $x$ 是一个不动点.

#lemma[
  存在双射 $G slash "stab"(x) -> G x$.
]

根据这一引理我们可以得到一个计数的结果:
$|G_x| = [G: "stab"(x)]$ = $|G|$ / $|"stab"(x)|$.

设 $O = {G x | x in X} subset.eq 2^X$, 构造 $pi: X -> O, x |-> G x$ 满射.
由选择公理知道存在单射 $theta: O -> X$ 满足 $pi compose theta = id $.
记 $C = "Img"(theta)$, 与每一个轨道恰好有一个交点, 称为一个截面.

若 $x_1, x_2$ 属于同一个轨道 $G x$, 容易看出来 $"stab"(x_2)$ 与 $"stab"(x_1)$ 只差一个共轭作用.

完成了这些准备工作, 我们考虑 $X = union.big_(x in C) G x$, 可知
$|X| = sum_(x in C) |G x| = sum_(x in C)[G:"Stab"(x)]$.

下面考虑 $G$ 在自身的共轭作用, 取 $X = G, mu(g, x) = g x g^(-1)$.
$x$ 的轨道就是 ${g x g^(-1) | g in G}$, 称为 $x$ 的共轭类.
$x$ 的稳定化子就是中心化子.
若 $x$ 是不动点, 则是一个平凡共轭类. 若不是, 则称为非平凡共轭类. 非平凡共轭类记 $Tau$.

通过这一区分, 我们知道 $|G| = |Z| + sum_Tau [G: "stab"(x)]$. 这里的后项是非平凡共轭类的集合.

#example[
  1. 若 $|G| = p^m$, $p$ 为素数, 则称为 $G$ 为一个 $p$ 群, 类方程为 $p^m = |Z| + sum_(x in Tau)[G: C(x)]$. 我们可知 $p | |Z|$.
  2. 设有 $n$ 个轨道, 则 $n = 1/(|G|) sum_(g in G) | X^g|$, 其中 $X^g = { x in X | g x = x}$.
  证明: $sum_(g in G) |X^g| = sum_(x in X) | "stab"(x) | = sum_(x in X) (|G|) / (|G x|) = |G| sum_(x in X) 1/(|G x|) = |G| n$.
]

接下来我们进入 Sylow 定理的讨论. 这一定理在探讨什么时候 $d | |G|$, 问是否存在 $H < G, |H| = d$. Sylow 定理告诉我们当 $d$ 是素数的阶数时, 这一结论是对的.

#lemma[
  设 $G$ 是有限交换群, $p$ 是素数, $p | |G|$, 则 $G$ 中存在阶数为 $p$ 的元素.
]

#proof[
  对群 $G$ 的阶数归纳.
  - $|G| = 1$, 成立.
  - 当阶数 $< |G|$ 时交换群都成立, 考虑 $G$. 任取 $a in G, a != e$, 设 $a$ 的阶数为 $m$, 若 $p | m$ 显然可找到这样的 $p$ 阶元; 反之, $H = <a>$ 是正规子群. 考虑 $G slash H$, 由归纳假设...
]

#theorem("Sylow-I")[
  假设有限群 $G$, 素数 $p$, 且 $p^k | |G|$, 则 $G$ 有 $p^k$ 阶子群.
]

#proof[
  对 $|G|$ 归纳.
  - $|G| = 1$, 成立.
  - 设对 $|G| < n$ 成立, 考虑 $|G| = n$. 有方程 $|G| = |Z| + sum_(x in Tau) [G:C(x)]$. 若 $p$ 不整除 $|Z|$, 则一定存在 $p^k | C(x)$, 成立; 若 $p | |Z|$, 那么由上引理得到 $Z$ 有 $p$ 阶子群 $H = <a>$. $H$ 是 $G$ 的正规子群, 考虑 $G slash H = G', |G'| < |G|$, $p^(k-1) | |G'|$. 由归纳假设得到 $G'$ 有 $p^(k-1)$ 阶子群 $H'$, 那么我们就能得到 $G$ 有 $p^k$ 阶子群.
]


#definition[
  1. 若 $|H| = p^k$, 则称 $H$ 叫 p-群.
  2. 若 $G, p$, $|G|$ 中 $p$ 的阶为 $m$,
  则该群中的 $p^m$阶子群叫 $p-$Sylow子群.
]

#theorem("Sylow-II")[
  群 $G$ 中的任意两个 $p-$Sylow子群都共轭.
]

一个显然的推论是如果只有一个 Sylow 子群, 则这个群是正规的.

#proof[
  我们要证明: 设 $P$ 是 $p-$Sylow子群, $H$ 是 $G$ 的 $p$-子群, $|H| = p^k$,
  则存在 $g in G$, 使得 $H subset.eq g P g^(-1)$.

  考虑群作用: $mu: H times G slash P -> G slash P$, $(h, g P) |-> h_g P$,
  因为 $|P| = p^m$, 所以 $|G slash P| = (|G|) / p^m$, 从而 $p$ 不整除.

  考虑 $mu$ 的轨道, $|H(g P)| = 1 or p^l, 1 <= l < k$.
  因为不整除, 所以至少有一个不动点, 所以 $H subset.eq g P g^(-1)$.
]

#theorem("Sylow-III")[
  给定群 $G, P$ 同上, 设 $G$ 的 $p-$Sylow 的个数为 $n_P$,
  再设 $[G:P] = m$, 则 $n_p | m$, 且 $n_p = 1 (mod p)$.
]

#proof[
  设 $G$ 的所有子群集合为 $S$, 考虑群作用 $G times S -> S$, $(g, H) |-> g H g^(-1)$.
  设 $P$ 是 $G$ 的一个 $p-$Sylow 子群, 先问它的稳定化子是什么.
  由 Sylow-II 定理我们知道 $n_p = |G P| = [G: "stab"(P)] = [G: N_G (P)]$.
  另一方面, $m = [G:P] = [G: N_G (P)] [N_G (P): P] = n_p [N_G (P): P]$, 从而 $n_p | m$.

  考虑另一个群作用, $P times G slash P -> G slash P$, $(h, g P) |-> h g P$. ...
]

这些定理实在看的人有点累, 不过我们利用上述三定理可以对有限群的结构做许多有趣的研究.

#example[
  1. 设 $p, q$ 是素数, $p < q$, 则 $p q$ 阶群 $G$ 一定不是单群.
  考虑 $G$ 的 $q$-Sylow子群, 那么 $n_q | p, n_q = 1 (mod q)$, 所以 $n_q = 1$, 从而 $G$ 有正规子群.
  2. 若 $|G| = 2024 = 2^3 . 11 . 23$, $n_(23) | 2^3 . 11, n_(23) = 1 (mod 23)$, 所以 $n_(23) = 1$, 从而 $G$ 有一个 23 阶正规子群.
  $G slash P_(23) = G_1$, $|G_1| = 2^3 . 11$, $n_(11) | 2^3, n_(11) = 1 (mod 11)$, 所以 $n_(11) = 1$, 从而 $G_1$ 有一个 11 阶正规子群.
  3. $|G| = 56 =>$ $G$ 不是单群. $n_7 = 1 or n_7 = 8$. 若 $n_7 = 1$, 则 $G$ 有正规子群; 
  若 $n_7 = 1$, 证毕;
  若 $n_7 = 8$, 则 $G$ 有 8 个 7 阶子群, 我们断言这些子群的交只能是单位元. 所以 $G$ 中有一个 $e$, 8 x 6 个七阶元, 还剩 7 个元素.
  再考虑 $2-$Sylow 子群, 阶是 8, 恰好只有一个子群, 所以是正规子群.
  4. $|G| = 108 => $ $G$ 不是单群.
]

#theorem[
  最小的非交换单群是 60 阶的. (就是 $A_5$)
]

#proof[

1. 平凡群显然是交换.
2. 素数阶群都交换 $2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59$.
3. pq 型的都不单 $6, 10, 14, 22, 26, 34, 38, 46, 57, 58, 5, 8, 15, 21, 33, 39, 51, 35, 55$.
4. $p^k$ 阶的都是交换的或者不单 $4, 9, 25, 49, 8, 27, 16, 32$.
5. $2^2 p$ 型群, $|G| = 12, 20, 28, 44, 52$, 继续利用 Sylow 定理可以解决.
6. $3^2 p$ 型群, $|G| = 18, 57$, $n_3 = 1$, 不是单群.

还有 24 和 36 阶群, 我们需要引入一个引理

#lemma[
  若有限群 $G$ 有子群 $H$, $[G:H] = n$, 则 $H$ 一定包含一个 $G$ 的正规子群 $K$, 且 $[G:K] | n!$. 特别的, 如果 $|G|$ 不整除 $n!$, 则 $K$ 是非平凡的正规子群.
]

考虑 24 阶群, $24 = 2^3 dot 3$.
由Sylow第三定理则 $n_2 | 3, n_2 = 1 (mod 2)$, 所以 $n_2 = 1 or 3$. 若是第一种情况, 则证毕; 若是第二种情况, 设 $H$ 是一个八阶子群, 且 $24 > 3! = 6$, 由引理知存在正规子群 $K$.

36阶群同理.
]

== 对称群

上一节我们已经知道 60 阶以下的群都是交换群或者不单的, 我们接下来要构造并证明一个 60 阶的非交换单群.

对于奇置换, 偶置换, 轮换, 循环等等定义我们不再赘述.

偶置换构成的群是 $A_n$, 它是 $S_n$ 的正规子群, 且 $|S_n : A_n| = 2$.

#lemma[
  $A_n$ 可由 3-循环生成.
]

#lemma[
  $n >= 5$ 时, 所有 3-循环都是共轭的.
]

#theorem[
  $A_n, n >= 5$ 是单群.
]

#proof[
  设 $K$ 是 $A_n$ 的正规子群, $K != {e}$, 要证 $K = A_n$.
  由引理1知只需要证明包含所有3-循环, 由引理2知只需要证明包含一个3-循环.
]

= Galois 理论
