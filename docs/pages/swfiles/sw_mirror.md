---
{title: sw_mirror( ), summary: mirrors a 3D vector, keywords: sample, sidebar: sw_sidebar,
  permalink: sw_mirror.html, folder: swfiles, mathjax: 'true'}

---
mirrors a 3D vector
 
[V, mirM] = SW_MIRROR(n, {V}) 
 
It mirrors the vectors in V to the mirror plane that is defined by its
normal vector mNorm.
 
Input:
 
n         Vector, normal to the mirror plane, dimensions are [1 3].
V         Matrix of 3D vectors, dimensions are [3 N], optional.
 
Output:
 
V         Mirrored vectors, dimensions are [3 N].
mirM      Matrix of the mirror operation, dimensions are [3 3].
 
To mirror any column vector use the following:
  vp = mirM * v;
 
To apply mirror plane operation on tensors (3x3 matrices) use the
following command:
  Ap = mirM * A * mirM';
 
See also SPINW.GENMAGSTR, SW_ROT.
 