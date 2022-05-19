var zl=function(n){return function(t){for(var r=t.length,e=new Array(r),a=0;a<r;a++)e[a]=n(t[a]);return e}};var fa={compose:function(n){return function(t){return function(r){return n(t(r))}}}},We=function(n){return n.compose};var Q=function(n){return n.identity},V={identity:function(n){return n},Semigroupoid0:function(){return fa}};var Qt=!0;var df=function(n){return function(t){return function(r){return function(e){return n(t(r))(t(e))}}}},at=function(n){return function(t){return function(r){return n(r)(t)}}},E=function(n){return function(t){return n}};var Df=function(n){return function(t){return t(n)}};var x=function(){function n(){}return n.value=new n,n}();var s=function(n){return n.map},qr=function(n){return function(t){return function(r){return s(n)(r)(t)}}},Z=function(n){return s(n)(E(void 0))},Ir=function(n){return function(t){return function(r){return s(n)(E(r))(t)}}};var Sr={map:We(fa)},ot={map:zl};var Vl=function(n){return Math.min(Math.abs(n),2147483647)},Jl=function(n){return function(t){return t===0?0:t>0?Math.floor(n/t):-Math.floor(n/-t)}},jl=function(n){return function(t){if(t===0)return 0;var r=Math.abs(t);return(n%r+r)%r}};var Gl=function(n){return function(t){return n-t|0}};var Xl=function(n){return function(t){return n+t|0}},Ql=function(n){return function(t){return n*t|0}},Yl=function(n){return function(t){return n+t}},Zl=function(n){return function(t){return n*t}};var St=function(n){return n.reflectSymbol};var Cr=function(n){return function(t){return t[n]}},De=function(n){return function(t){return function(r){var e={};for(var a in r)({}).hasOwnProperty.call(r,a)&&(e[a]=r[a]);return e[n]=t,e}}};var Eo={add:Yl,zero:0,mul:Zl,one:1},hr={add:Xl,zero:0,mul:Ql,one:1};var zr=function(n){return n.mul};var Lt=function(n){return n.add};var gf={sub:Gl,Semiring0:function(){return hr}};var Kl={Ring0:function(){return gf}};var ns=function(n){return function(t){return n===t}};var ts=ns;var rs=ns;var He={eq:rs};var Fo={eq:ts};var tn=function(n){return n.eq};var Pu=function(n){return n.mod};var bf={degree:Vl,div:Jl,mod:jl,CommutativeRing0:function(){return Kl}};var rn=function(){function n(){}return n.value=new n,n}(),sn=function(){function n(){}return n.value=new n,n}(),fn=function(){function n(){}return n.value=new n,n}();var as=function(n){return function(t){return n+t}},os=function(n){return function(t){return n.length===0?t:t.length===0?n:n.concat(t)}};var is={append:function(n){return function(t){return void 0}}},ge={append:as};var bt={append:os};var A=function(n){return n.append};var Pr={mempty:void 0,Semigroup0:function(){return is}},Mo={mempty:"",Semigroup0:function(){return ge}};var En=function(n){return n.mempty};var Na=function(n){return{always:E(En(n)),Monoid0:function(){return n}}},Ra=function(n){return{always:Q(V),Monoid0:function(){return n}}},xo=function(n){return n.always};var U=function(n){return n.alt};var fs=function(n){return function(t){for(var r=n.length,e=t.length,a=new Array(r*e),u=0,c=0;c<r;c++)for(var l=n[c],_=0;_<e;_++)a[u++]=l(t[_]);return a}};var wo={apply:fs,Functor0:function(){return ot}},bn=function(n){return n.apply};var Tn=function(n){return function(t){return function(r){return bn(n)(s(n.Functor0())(E(Q(V)))(t))(r)}}},mr=function(n){return function(t){return function(r){return function(e){return bn(n)(s(n.Functor0())(t)(r))(e)}}}};var Od=String.fromCharCode(65535),Wd=String.fromCharCode(0),Ud=Number.POSITIVE_INFINITY,Hd=Number.NEGATIVE_INFINITY;var cs=function(n){return function(t){return function(r){return function(e){return function(a){return e<a?n:e===a?t:r}}}}};var ls=cs;var ss=cs;var Ht=function(){return{compare:ss(rn.value)(fn.value)(sn.value),Eq0:function(){return He}}}();var vr=function(){return{compare:ls(rn.value)(fn.value)(sn.value),Eq0:function(){return Fo}}}();var un=function(n){return n.compare};var Nr=function(n){return n.top};var ca={top:2147483647,bottom:-2147483648,Ord0:function(){return vr}};var Vr=function(n){return n.bottom};var ps=function(n){return n.toString()},ms=function(n){var t=n.toString();return isNaN(t+".0")?t:t+".0"};var vs=function(n){var t=n.length;return'"'+n.replace(/[\0-\x1F\x7F"\\]/g,function(r,e){switch(r){case'"':case"\\":return"\\"+r;case"\x07":return"\\a";case"\b":return"\\b";case"\f":return"\\f";case`
`:return"\\n";case"\r":return"\\r";case"	":return"\\t";case"\v":return"\\v"}var a=e+1,u=a<t&&n[a]>="0"&&n[a]<="9"?"\\&":"";return"\\"+r.charCodeAt(0).toString(10)+u})+'"'};var Rr={show:vs};var Lo={show:ms},kr={show:ps};var k=function(n){return n.show};var y=function(n){return n.pure};var be=function(n){return function(t){return function(r){if(t)return r;if(!t)return y(n)(void 0);throw new Error("Failed pattern match at Control.Applicative (line 63, column 1 - line 63, column 63): "+[t.constructor.name,r.constructor.name])}}},Io=function(n){return function(t){return function(r){return bn(n.Apply0())(y(n)(t))(r)}}};var So={pure:function(n){return[n]},Apply0:function(){return wo}};var D=function(){function n(){}return n.value=new n,n}(),v=function(){function n(t){this.value0=t}return n.create=function(t){return new n(t)},n}();var Zn=function(n){return function(t){return function(r){if(r instanceof D)return n;if(r instanceof v)return t(r.value0);throw new Error("Failed pattern match at Data.Maybe (line 237, column 1 - line 237, column 51): "+[n.constructor.name,t.constructor.name,r.constructor.name])}}};var ku=Zn(!1)(E(!0));var et={map:function(n){return function(t){return t instanceof v?new v(n(t.value0)):D.value}}};var Zt=function(n){return Zn(n)(Q(V))},dr=function(){return function(n){if(n instanceof v)return n.value0;throw new Error("Failed pattern match at Data.Maybe (line 288, column 1 - line 288, column 46): "+[n.constructor.name])}};var la={apply:function(n){return function(t){if(n instanceof v)return s(et)(n.value0)(t);if(n instanceof D)return D.value;throw new Error("Failed pattern match at Data.Maybe (line 67, column 1 - line 69, column 30): "+[n.constructor.name,t.constructor.name])}},Functor0:function(){return et}},Dr={bind:function(n){return function(t){if(n instanceof v)return t(n.value0);if(n instanceof D)return D.value;throw new Error("Failed pattern match at Data.Maybe (line 125, column 1 - line 127, column 28): "+[n.constructor.name,t.constructor.name])}},Apply0:function(){return la}};var qe=function(){return{pure:v.create,Apply0:function(){return la}}}();var O=function(){function n(t){this.value0=t}return n.create=function(t){return new n(t)},n}(),P=function(){function n(t){this.value0=t}return n.create=function(t){return new n(t)},n}();var Ef=function(n){return Zn(new O(n))(P.create)};var Oa={map:function(n){return function(t){if(t instanceof O)return new O(t.value0);if(t instanceof P)return new P(n(t.value0));throw new Error("Failed pattern match at Data.Either (line 31, column 1 - line 31, column 52): "+[t.constructor.name])}}};var Or=function(n){return function(t){return function(r){if(r instanceof O)return n(r.value0);if(r instanceof P)return t(r.value0);throw new Error("Failed pattern match at Data.Either (line 208, column 1 - line 208, column 64): "+[n.constructor.name,t.constructor.name,r.constructor.name])}}},Ff=function(){return Or(E(D.value))(v.create)}();var cn=function(n){return n.empty};var gs=function(n){return function(t){return function(r){for(var e=t,a=r.length,u=a-1;u>=0;u--)e=n(r[u])(e);return e}}},bs=function(n){return function(t){return function(r){for(var e=t,a=r.length,u=0;u<a;u++)e=n(e)(r[u]);return e}}};var Ts=function(n){return function(t){for(var r=[],e=0,a=n.length;e<a;e++)Array.prototype.push.apply(r,t(n[e]));return r}};var Vn=function(n){return n.discard};var Ou={bind:Ts,Apply0:function(){return wo}},b=function(n){return n.bind},Te=function(n){return at(b(n))},Wu=function(n){return function(t){return function(r){return function(e){return Te(n)(t)(r(e))}}}},Uu=function(n){return function(t){return function(r){return function(e){return b(n)(t(e))(r)}}}};var Jn={discard:function(n){return b(n)}};var sa=function(n){return function(t){return b(n)(t)(Q(V))}};var fD=function(n,t,r){var e=0,a;return function(u){if(e===2)return a;if(e===1)throw new ReferenceError(n+" was needed before it finished initializing (module "+t+", line "+u+")",t,u);return e=1,a=r(),e=2,a}};var Es={defer:function(n){return function(t){return n(void 0)(t)}}},Wa=function(n){return n.defer},xf=function(n){return function(t){var r=fD("go","Control.Lazy",function(){return Wa(n)(function(a){return t(r(25))})}),e=r(25);return e}};var Fs=function(n){return function(t){return n&&t}},Ms=function(n){return function(t){return n||t}},xs=function(n){return!n};var Wr=function(n){return n.not};var $o=function(n){return n.ff};var Ha=function(n){return n.disj},Kt={ff:!1,tt:!0,implies:function(n){return function(t){return Ha(Kt)(Wr(Kt)(n))(t)}},conj:Fs,disj:Ms,not:xs};var F=function(){function n(t,r){this.value0=t,this.value1=r}return n.create=function(t){return function(r){return new n(t,r)}},n}();var $t=function(n){return n.value1};var _a={map:function(n){return function(t){return new F(t.value0,n(t.value1))}}};var ko=function(n){return n};var gD=function(n){return{append:function(t){return function(r){return Ha(n)(t)(r)}}}};var Sf=function(n){return{mempty:$o(n),Semigroup0:function(){return gD(n)}}};var bD=function(n){return{append:function(t){return function(r){return We(n)(t)(r)}}}};var ma=function(n){return{mempty:Q(n),Semigroup0:function(){return bD(n.Semigroupoid0())}}};var C=function(n){return n};var va=function(){return C};var pt=va;var Vu=function(){return function(){return function(){return function(){return function(n){return va()}}}}};var ut=function(n){return n.foldr};var za=function(n){return function(t){return ut(n)(U(t.Alt0()))(cn(t))}},oe=function(n){return function(t){return function(r){return ut(n)(function(){var e=U(t.Alt0());return function(a){return e(r(a))}}())(cn(t))}}},jr=function(n){return function(t){return function(r){return ut(t)(function(){var e=Tn(n.Apply0());return function(a){return e(r(a))}}())(y(n)(void 0))}}},nr=function(n){return function(t){return at(jr(n)(t))}},Ju=function(n){return function(t){return jr(n)(t)(Q(V))}},it=function(n){return n.foldl};var Ce=function(n){return function(t){return function(r){return function(e){var a=function(u){return function(c){return u.init?{init:!1,acc:c}:{init:!1,acc:A(t.Semigroup0())(u.acc)(A(t.Semigroup0())(r)(c))}}};return it(n)(a)({init:!0,acc:En(t)})(e).acc}}}};var It={foldr:function(n){return function(t){return function(r){if(r instanceof D)return t;if(r instanceof v)return n(r.value0)(t);throw new Error("Failed pattern match at Data.Foldable (line 138, column 1 - line 144, column 27): "+[n.constructor.name,t.constructor.name,r.constructor.name])}}},foldl:function(n){return function(t){return function(r){if(r instanceof D)return t;if(r instanceof v)return n(t)(r.value0);throw new Error("Failed pattern match at Data.Foldable (line 138, column 1 - line 144, column 27): "+[n.constructor.name,t.constructor.name,r.constructor.name])}}},foldMap:function(n){return function(t){return function(r){if(r instanceof D)return En(n);if(r instanceof v)return t(r.value0);throw new Error("Failed pattern match at Data.Foldable (line 138, column 1 - line 144, column 27): "+[t.constructor.name,r.constructor.name])}}}};var Ls=function(n){return function(t){return function(r){return ut(n)(function(e){return function(a){return A(t.Semigroup0())(r(e))(a)}})(En(t))}}},$n={foldr:gs,foldl:bs,foldMap:function(n){return Ls($n)(n)}};var tr=function(n){return n.foldMap};var ze=function(n){return function(t){return Vu()()()()(ko)(tr(n)(Sf(t)))}};var Is=function(n){return function(t){for(var r=t.length,e=Array(r),a=0;a<r;a++)e[a]=n(a)(t[a]);return e}};var ue=function(n){return n};var ie={map:function(n){return function(t){return n(t)}}};var Ps={apply:function(n){return function(t){return n(t)}},Functor0:function(){return ie}},ED={bind:function(n){return function(t){return t(n)}},Apply0:function(){return Ps}},FD={pure:ue,Apply0:function(){return Ps}},tt={Applicative0:function(){return FD},Bind1:function(){return ED}};var Ee=function(n){return n.mapWithIndex};var Uo={mapWithIndex:Is,Functor0:function(){return ot}};var Hs=function(){function n(a){return[a]}function t(a){return function(u){return[a,u]}}function r(a){return function(u){return function(c){return[a,u,c]}}}function e(a){return function(u){return a.concat(u)}}return function(a){return function(u){return function(c){return function(l){return function(_){function f(i,d){switch(d-i){case 0:return c([]);case 1:return u(n)(l(_[i]));case 2:return a(u(t)(l(_[i])))(l(_[i+1]));case 3:return a(a(u(r)(l(_[i])))(l(_[i+1])))(l(_[i+2]));default:var m=i+Math.floor((d-i)/4)*2;return a(u(e)(f(i,m)))(f(m,d))}}return f(0,_.length)}}}}}}();var er=function(n){return n.traverse};var zs=function(n){return function(t){return er(n)(t)(Q(V))}},Ve={traverse:function(n){return Hs(bn(n.Apply0()))(s(n.Apply0().Functor0()))(y(n))},sequence:function(n){return zs(Ve)(n)},Functor0:function(){return ot},Foldable1:function(){return $n}};var fe=function(){function n(t,r){this.value0=t,this.value1=r}return n.create=function(t){return function(r){return new n(t,r)}},n}();var ti=function(n){return function(t){return new fe(t,cn(n))}};var ft=function(){function n(){}return n.value=new n,n}(),K=function(){function n(t,r){this.value0=t,this.value1=r}return n.create=function(t){return function(r){return new n(t,r)}},n}(),ri=function(n){return n},Ay=function(n){return new K(n.value0,n.value1)};var Ly=function(n){var t=function(r){return function(e){var a=r,u=!1,c;function l(_,f){if(f instanceof K&&f.value1 instanceof K&&f.value1.value1 instanceof K){a=new K(f,_),e=f.value1.value1.value1;return}var i=function(m){return m instanceof K&&m.value1 instanceof K&&m.value1.value1 instanceof ft?new K(n(m.value0),new K(n(m.value1.value0),ft.value)):m instanceof K&&m.value1 instanceof ft?new K(n(m.value0),ft.value):ft.value},d=function(m){return function(o){var p=m,B=!1,Un;function Gt(Rn,Br){if(Rn instanceof K&&Rn.value0 instanceof K&&Rn.value0.value1 instanceof K&&Rn.value0.value1.value1 instanceof K){p=Rn.value1,o=new K(n(Rn.value0.value0),new K(n(Rn.value0.value1.value0),new K(n(Rn.value0.value1.value1.value0),Br)));return}return B=!0,Br}for(;!B;)Un=Gt(p,o);return Un}};return u=!0,d(_)(i(f))}for(;!u;)c=l(a,e);return c}};return t(ft.value)},Jf={map:Ly};var Me={foldr:function(n){return function(t){var r=function(){var a=function(u){return function(c){var l=u,_=!1,f;function i(d,m){if(m instanceof ft)return _=!0,d;if(m instanceof K){l=new K(m.value0,d),c=m.value1;return}throw new Error("Failed pattern match at Data.List.Types (line 107, column 7 - line 107, column 23): "+[d.constructor.name,m.constructor.name])}for(;!_;)f=i(l,c);return f}};return a(ft.value)}(),e=it(Me)(at(n))(t);return function(a){return e(r(a))}}},foldl:function(n){var t=function(r){return function(e){var a=r,u=!1,c;function l(_,f){if(f instanceof ft)return u=!0,_;if(f instanceof K){a=n(_)(f.value0),e=f.value1;return}throw new Error("Failed pattern match at Data.List.Types (line 111, column 12 - line 113, column 30): "+[f.constructor.name])}for(;!u;)c=l(a,e);return c}};return t},foldMap:function(n){return function(t){return it(Me)(function(r){var e=A(n.Semigroup0())(r);return function(a){return e(t(a))}})(En(n))}}};var Bo={append:function(n){return function(t){return ut(Me)(K.create)(t)(n)}}};var jf={append:function(n){return function(t){return new fe(n.value0,A(Bo)(n.value1)(Ay(t)))}}};var js={alt:A(Bo),Functor0:function(){return Jf}},Gf=function(){return{empty:ft.value,Alt0:function(){return js}}}();var Gs=function(n){return n()};var Xs=function(n){throw new Error(n)};var Qs=function(){return Xs};var Py=Gs,Xr=function(n){return Py(function(){return Qs()(n)})};function Ks(n){var t={};for(var r in n)({}).hasOwnProperty.call(n,r)&&(t[r]=n[r]);return t}function n_(n){return function(t){return function(r){return r[n]=t(r[n]),r}}}var Qf=function(n){return function(t){return function(r){return function(e){return n(t,r,e)}}}};var r_=fa;var e_=function(){return function(){return function(n){return function(t){return function(r){return function(e){return n_(St(n)(t))(r)(e)}}}}}};var a_=V,o_=function(n){return function(t){return n(Ks(t))}};var Qy=function(n){return n},Yy=function(n){return n.mappingWithIndex};var Zy=function(n){return n.mapping};var ei={mapRecordWithIndexBuilder:function(n){return function(t){return Q(a_)}}},u_=function(n){return n.mapRecordWithIndexBuilder},Qa=function(n){return function(t){return function(r){return function(){return function(){return{mapRecordWithIndexBuilder:function(e){return function(a){return We(r_)(e_()()(n)(x.value)(Yy(t)(a)(x.value)))(u_(r)(x.value)(a))}}}}}}}};var i_=function(){return function(n){return{hmap:function(){var t=u_(n)(x.value);return function(r){return o_(t(Qy(r)))}}()}}};var f_=function(n){return n.hmap},Ya=function(n){return{mappingWithIndex:function(t){return function(r){return Zy(n)(t)}}}};var Ky=function(){function n(){}return n.value=new n,n}(),Za=function(n){return{mapping:function(t){return s(Sr)(xo(n))}}},c_=function(n){return f_(n)(Ky.value)};var l_=C;var s_=function(n){return function(t){return function(){return n(t())}}},__=function(n){return function(){return n}},p_=function(n){return function(t){return function(){return t(n())()}}};function xt(n){return function(){return{value:n}}}var Dt=function(n){return function(){return n.value}},m_=function(n){return function(t){return function(){var r=n(t.value);return t.value=r.state,r.value}}},ar=function(n){return function(t){return function(){return t.value=n}}};var Ur=function(n){return function(t){return function(r){return b(n.Bind1())(t)(function(e){return b(n.Bind1())(r)(function(a){return y(n.Applicative0())(e(a))})})}}};var nc=function(n){return function(){return n}},v_=function(n){return function(t){return function(){return t(n())()}}};var d_=function(n,t,r){var e=0,a;return function(u){if(e===2)return a;if(e===1)throw new ReferenceError(n+" was needed before it finished initializing (module "+t+", line "+u+")",t,u);return e=1,a=r(),e=2,a}},Ka={Applicative0:function(){return Mr},Bind1:function(){return ya}},ya={bind:v_,Apply0:function(){return tc(0)}},Mr={pure:nc,Apply0:function(){return tc(0)}},D_=d_("functorEffect","Effect",function(){return{map:Io(Mr)}}),tc=d_("applyEffect","Effect",function(){return{apply:Ur(Ka),Functor0:function(){return D_(0)}}}),xn=D_(20),Nt=tc(23),y_=function(n){return{append:mr(Nt)(A(n))}},Yr=function(n){return{mempty:nc(En(n)),Semigroup0:function(){return y_(n.Semigroup0())}}};var g_=function(n){return function(){return{value:n}}};var no=function(n){return function(){return n.value}},b_=function(n){return function(t){return function(){var r=n(t.value);return t.value=r.state,r.value}}};var zo=g_,ag=b_,T_=function(n){return ag(function(t){var r=n(t);return{state:r,value:r}})};var cg=function(n,t,r){var e=0,a;return function(u){if(e===2)return a;if(e===1)throw new ReferenceError(n+" was needed before it finished initializing (module "+t+", line "+u+")",t,u);return e=1,a=r(),e=2,a}},lg=m_,Bt=function(n){return lg(function(t){var r=n(t);return{state:r,value:r}})},yt={map:s_},oi={Applicative0:function(){return or},Bind1:function(){return ui}},ui={bind:p_,Apply0:function(){return ec(0)}},or={pure:__,Apply0:function(){return ec(0)}},ec=cg("applyST","Control.Monad.ST.Internal",function(){return{apply:Ur(oi),Functor0:function(){return yt}}}),h_=ec(46);var E_={liftST:Q(V),Monad0:function(){return oi}},F_={liftST:l_,Monad0:function(){return Ka}},vn=function(n){return n.liftST};var sg=function(n){return function(t){if(n<1)return[];var r=new Array(n);return r.fill(t)}},_g=function(n){return function(t){for(var r=[],e=0,a=0;a<n;a++)r[e++]=t;return r}},ac=typeof Array.prototype.fill=="function"?sg:_g,pg=function(){function n(a,u){this.head=a,this.tail=u}var t={};function r(a){return function(u){return new n(a,u)}}function e(a){for(var u=[],c=0,l=a;l!==t;)u[c++]=l.head,l=l.tail;return u}return function(a){return function(u){return e(a(r)(t)(u))}}}();var M_=function(n){return function(t){return function(r){return function(e){return e<0||e>=r.length?t:n(r[e])}}}},x_=function(n){return function(t){return function(r){return function(e){for(var a=0;a<e.length;a++){var u=r(e[a]);if(t(u))return u}return n}}}},w_=function(n){return function(t){return function(r){return function(e){for(var a=0,u=e.length;a<u;a++)if(r(e[a]))return n(a);return t}}}};var A_=function(n){return function(t){return function(r){return function(e){if(r<0||r>=e.length)return t;var a=e.slice();return a.splice(r,1),n(a)}}}};var Jo=function(n){return function(t){return t.filter(n)}},fi=function(n){return function(t){for(var r=[],e=[],a=0;a<t.length;a++){var u=t[a];n(u)?r.push(u):e.push(u)}return{yes:r,no:e}}};var mg=function(){function n(t,r,e,a,u,c){var l,_,f,i,d,m,o;for(l=u+(c-u>>1),l-u>1&&n(t,r,a,e,u,l),c-l>1&&n(t,r,a,e,l,c),_=u,f=l,i=u;_<l&&f<c;)d=a[_],m=a[f],o=r(t(d)(m)),o>0?(e[i++]=m,++f):(e[i++]=d,++_);for(;_<l;)e[i++]=a[_++];for(;f<c;)e[i++]=a[f++]}return function(t){return function(r){return function(e){var a;return e.length<2?e:(a=e.slice(0),n(t,r,a,e.slice(0),0,e.length),a)}}}}();function ga(){return[]}var oc=function(n){return function(t){return function(){return t.push.apply(t,n)}}};var le=function(n){return function(){return n}};function dg(n){return function(){return n.slice()}}var uc=dg,Dg=function(){function n(t,r,e,a,u,c){var l,_,f,i,d,m,o;for(l=u+(c-u>>1),l-u>1&&n(t,r,a,e,u,l),c-l>1&&n(t,r,a,e,l,c),_=u,f=l,i=u;_<l&&f<c;)d=a[_],m=a[f],o=r(t(d)(m)),o>0?(e[i++]=m,++f):(e[i++]=d,++_);for(;_<l;)e[i++]=a[_++];for(;f<c;)e[i++]=a[f++]}return function(t){return function(r){return function(e){return function(){return e.length<2||n(t,r,e,e.slice(0),0,e.length),e}}}}}();var $_=function(n){return function(t){return function(){var e=uc(t)();return n(e)(),le(e)()}}};var xe=function(n){return oc([n])};var bg=function(){function n(t,r){this.value0=t,this.value1=r}return n.create=function(t){return function(r){return new n(t,r)}},n}();var Tg=function(n){return function(){var r=Dt(n.value1)();return Bt(function(e){return e+1|0})(n.value1)(),n.value0(r)}};var ci=function(n){return s(yt)(bg.create(n))(xt(0))},li=function(n){return function(t){return function(){for(var e=xt(!1)();s(yt)(Wr(Kt))(Dt(e))();)(function(){var u=Tg(n)();if(u instanceof v)return t(u.value0)();if(u instanceof D)return Z(yt)(ar(!0)(e))();throw new Error("Failed pattern match at Data.Array.ST.Iterator (line 42, column 5 - line 44, column 47): "+[u.constructor.name])})();return{}}}};var fc=function(n){return function(t){return $_(xe(t))(n)()}},W_=function(n){return[n]};var to=function(){return M_(v.create)(D.value)}();var si=function(){return x_(D.value)(ku)}();var U_=function(){return w_(v.create)(D.value)}();var H_=function(){return A_(v.create)(D.value)}(),cc=function(n){return function(t){return function(r){return r.length===0?[]:Zn(r)(function(e){return dr()(H_(e)(r))})(U_(n(t))(r))}}};var Xo=function(n){return function(t){return A(bt)([n])(t)}};var xg=at(b(Ou)),lc=function(n){return xg(function(){var t=Zn([])(W_);return function(r){return t(n(r))}}())};var nn=function(){function n(){}return n.value=new n,n}(),pn=function(){function n(t,r,e,a){this.value0=t,this.value1=r,this.value2=e,this.value3=a}return n.create=function(t){return function(r){return function(e){return function(a){return new n(t,r,e,a)}}}},n}(),Pn=function(){function n(t,r,e,a,u,c,l){this.value0=t,this.value1=r,this.value2=e,this.value3=a,this.value4=u,this.value5=c,this.value6=l}return n.create=function(t){return function(r){return function(e){return function(a){return function(u){return function(c){return function(l){return new n(t,r,e,a,u,c,l)}}}}}}},n}(),je=function(){function n(t,r,e){this.value0=t,this.value1=r,this.value2=e}return n.create=function(t){return function(r){return function(e){return new n(t,r,e)}}},n}(),we=function(){function n(t,r,e){this.value0=t,this.value1=r,this.value2=e}return n.create=function(t){return function(r){return function(e){return new n(t,r,e)}}},n}(),Ge=function(){function n(t,r,e,a,u,c){this.value0=t,this.value1=r,this.value2=e,this.value3=a,this.value4=u,this.value5=c}return n.create=function(t){return function(r){return function(e){return function(a){return function(u){return function(c){return new n(t,r,e,a,u,c)}}}}}},n}(),se=function(){function n(t,r,e,a,u,c){this.value0=t,this.value1=r,this.value2=e,this.value3=a,this.value4=u,this.value5=c}return n.create=function(t){return function(r){return function(e){return function(a){return function(u){return function(c){return new n(t,r,e,a,u,c)}}}}}},n}(),Xe=function(){function n(t,r,e,a,u,c){this.value0=t,this.value1=r,this.value2=e,this.value3=a,this.value4=u,this.value5=c}return n.create=function(t){return function(r){return function(e){return function(a){return function(u){return function(c){return new n(t,r,e,a,u,c)}}}}}},n}(),pi=function(){function n(t,r,e,a){this.value0=t,this.value1=r,this.value2=e,this.value3=a}return n.create=function(t){return function(r){return function(e){return function(a){return new n(t,r,e,a)}}}},n}();var mi=function(n){return function(t){var r=un(n),e=function(a){var u=!1,c;function l(_){if(_ instanceof nn)return u=!0,D.value;if(_ instanceof pn){var f=r(t)(_.value1);if(f instanceof fn)return u=!0,new v(_.value2);if(f instanceof rn){a=_.value0;return}a=_.value3;return}if(_ instanceof Pn){var i=r(t)(_.value1);if(i instanceof fn)return u=!0,new v(_.value2);var d=r(t)(_.value4);if(d instanceof fn)return u=!0,new v(_.value5);if(i instanceof rn){a=_.value0;return}if(d instanceof sn){a=_.value6;return}a=_.value3;return}throw new Error("Failed pattern match at Data.Map.Internal (line 241, column 5 - line 241, column 22): "+[_.constructor.name])}for(;!u;)c=l(a);return c};return e}};var Tt=function(n){return function(t){return function(r){var e=n,a=t,u=!1,c;function l(_,f,i){if(f instanceof ft)return u=!0,i;if(f instanceof K){if(f.value0 instanceof je){e=_,a=f.value1,r=new pn(i,f.value0.value0,f.value0.value1,f.value0.value2);return}if(f.value0 instanceof we){e=_,a=f.value1,r=new pn(f.value0.value0,f.value0.value1,f.value0.value2,i);return}if(f.value0 instanceof Ge){e=_,a=f.value1,r=new Pn(i,f.value0.value0,f.value0.value1,f.value0.value2,f.value0.value3,f.value0.value4,f.value0.value5);return}if(f.value0 instanceof se){e=_,a=f.value1,r=new Pn(f.value0.value0,f.value0.value1,f.value0.value2,i,f.value0.value3,f.value0.value4,f.value0.value5);return}if(f.value0 instanceof Xe){e=_,a=f.value1,r=new Pn(f.value0.value0,f.value0.value1,f.value0.value2,f.value0.value3,f.value0.value4,f.value0.value5,i);return}throw new Error("Failed pattern match at Data.Map.Internal (line 462, column 3 - line 467, column 88): "+[f.value0.constructor.name])}throw new Error("Failed pattern match at Data.Map.Internal (line 459, column 1 - line 459, column 80): "+[f.constructor.name,i.constructor.name])}for(;!u;)c=l(e,a,r);return c}}},vi=function(n){return function(t){return function(r){var e=function(c){return function(l){var _=c,f=!1,i;function d(m,o){if(m instanceof ft)return f=!0,new pn(o.value0,o.value1,o.value2,o.value3);if(m instanceof K){if(m.value0 instanceof je)return f=!0,Tt(n)(m.value1)(new Pn(o.value0,o.value1,o.value2,o.value3,m.value0.value0,m.value0.value1,m.value0.value2));if(m.value0 instanceof we)return f=!0,Tt(n)(m.value1)(new Pn(m.value0.value0,m.value0.value1,m.value0.value2,o.value0,o.value1,o.value2,o.value3));if(m.value0 instanceof Ge){_=m.value1,l=new pi(new pn(o.value0,o.value1,o.value2,o.value3),m.value0.value0,m.value0.value1,new pn(m.value0.value2,m.value0.value3,m.value0.value4,m.value0.value5));return}if(m.value0 instanceof se){_=m.value1,l=new pi(new pn(m.value0.value0,m.value0.value1,m.value0.value2,o.value0),o.value1,o.value2,new pn(o.value3,m.value0.value3,m.value0.value4,m.value0.value5));return}if(m.value0 instanceof Xe){_=m.value1,l=new pi(new pn(m.value0.value0,m.value0.value1,m.value0.value2,m.value0.value3),m.value0.value4,m.value0.value5,new pn(o.value0,o.value1,o.value2,o.value3));return}throw new Error("Failed pattern match at Data.Map.Internal (line 498, column 5 - line 503, column 108): "+[m.value0.constructor.name,o.constructor.name])}throw new Error("Failed pattern match at Data.Map.Internal (line 495, column 3 - line 495, column 56): "+[m.constructor.name,o.constructor.name])}for(;!f;)i=d(_,l);return i}},a=un(n),u=function(c){return function(l){var _=c,f=!1,i;function d(m,o){if(o instanceof nn)return f=!0,e(m)(new pi(nn.value,t,r,nn.value));if(o instanceof pn){var p=a(t)(o.value1);if(p instanceof fn)return f=!0,Tt(n)(m)(new pn(o.value0,t,r,o.value3));if(p instanceof rn){_=new K(new je(o.value1,o.value2,o.value3),m),l=o.value0;return}_=new K(new we(o.value0,o.value1,o.value2),m),l=o.value3;return}if(o instanceof Pn){var B=a(t)(o.value1);if(B instanceof fn)return f=!0,Tt(n)(m)(new Pn(o.value0,t,r,o.value3,o.value4,o.value5,o.value6));var Un=a(t)(o.value4);if(Un instanceof fn)return f=!0,Tt(n)(m)(new Pn(o.value0,o.value1,o.value2,o.value3,t,r,o.value6));if(B instanceof rn){_=new K(new Ge(o.value1,o.value2,o.value3,o.value4,o.value5,o.value6),m),l=o.value0;return}if(B instanceof sn&&Un instanceof rn){_=new K(new se(o.value0,o.value1,o.value2,o.value4,o.value5,o.value6),m),l=o.value3;return}_=new K(new Xe(o.value0,o.value1,o.value2,o.value3,o.value4,o.value5),m),l=o.value6;return}throw new Error("Failed pattern match at Data.Map.Internal (line 478, column 3 - line 478, column 55): "+[m.constructor.name,o.constructor.name])}for(;!f;)i=d(_,l);return i}};return u(ft.value)}}},jg=function(n){return function(t){var r=function(l){return function(_){var f=l,i=!1,d;function m(o,p){if(o instanceof ft)return i=!0,p;if(o instanceof K){if(o.value0 instanceof je&&o.value0.value2 instanceof nn&&p instanceof nn)return i=!0,Tt(n)(o.value1)(new pn(nn.value,o.value0.value0,o.value0.value1,nn.value));if(o.value0 instanceof we&&o.value0.value0 instanceof nn&&p instanceof nn)return i=!0,Tt(n)(o.value1)(new pn(nn.value,o.value0.value1,o.value0.value2,nn.value));if(o.value0 instanceof je&&o.value0.value2 instanceof pn){f=o.value1,_=new Pn(p,o.value0.value0,o.value0.value1,o.value0.value2.value0,o.value0.value2.value1,o.value0.value2.value2,o.value0.value2.value3);return}if(o.value0 instanceof we&&o.value0.value0 instanceof pn){f=o.value1,_=new Pn(o.value0.value0.value0,o.value0.value0.value1,o.value0.value0.value2,o.value0.value0.value3,o.value0.value1,o.value0.value2,p);return}return o.value0 instanceof je&&o.value0.value2 instanceof Pn?(i=!0,Tt(n)(o.value1)(new pn(new pn(p,o.value0.value0,o.value0.value1,o.value0.value2.value0),o.value0.value2.value1,o.value0.value2.value2,new pn(o.value0.value2.value3,o.value0.value2.value4,o.value0.value2.value5,o.value0.value2.value6)))):o.value0 instanceof we&&o.value0.value0 instanceof Pn?(i=!0,Tt(n)(o.value1)(new pn(new pn(o.value0.value0.value0,o.value0.value0.value1,o.value0.value0.value2,o.value0.value0.value3),o.value0.value0.value4,o.value0.value0.value5,new pn(o.value0.value0.value6,o.value0.value1,o.value0.value2,p)))):o.value0 instanceof Ge&&o.value0.value2 instanceof nn&&o.value0.value5 instanceof nn&&p instanceof nn?(i=!0,Tt(n)(o.value1)(new Pn(nn.value,o.value0.value0,o.value0.value1,nn.value,o.value0.value3,o.value0.value4,nn.value))):o.value0 instanceof se&&o.value0.value0 instanceof nn&&o.value0.value5 instanceof nn&&p instanceof nn?(i=!0,Tt(n)(o.value1)(new Pn(nn.value,o.value0.value1,o.value0.value2,nn.value,o.value0.value3,o.value0.value4,nn.value))):o.value0 instanceof Xe&&o.value0.value0 instanceof nn&&o.value0.value3 instanceof nn&&p instanceof nn?(i=!0,Tt(n)(o.value1)(new Pn(nn.value,o.value0.value1,o.value0.value2,nn.value,o.value0.value4,o.value0.value5,nn.value))):o.value0 instanceof Ge&&o.value0.value2 instanceof pn?(i=!0,Tt(n)(o.value1)(new pn(new Pn(p,o.value0.value0,o.value0.value1,o.value0.value2.value0,o.value0.value2.value1,o.value0.value2.value2,o.value0.value2.value3),o.value0.value3,o.value0.value4,o.value0.value5))):o.value0 instanceof se&&o.value0.value0 instanceof pn?(i=!0,Tt(n)(o.value1)(new pn(new Pn(o.value0.value0.value0,o.value0.value0.value1,o.value0.value0.value2,o.value0.value0.value3,o.value0.value1,o.value0.value2,p),o.value0.value3,o.value0.value4,o.value0.value5))):o.value0 instanceof se&&o.value0.value5 instanceof pn?(i=!0,Tt(n)(o.value1)(new pn(o.value0.value0,o.value0.value1,o.value0.value2,new Pn(p,o.value0.value3,o.value0.value4,o.value0.value5.value0,o.value0.value5.value1,o.value0.value5.value2,o.value0.value5.value3)))):o.value0 instanceof Xe&&o.value0.value3 instanceof pn?(i=!0,Tt(n)(o.value1)(new pn(o.value0.value0,o.value0.value1,o.value0.value2,new Pn(o.value0.value3.value0,o.value0.value3.value1,o.value0.value3.value2,o.value0.value3.value3,o.value0.value4,o.value0.value5,p)))):o.value0 instanceof Ge&&o.value0.value2 instanceof Pn?(i=!0,Tt(n)(o.value1)(new Pn(new pn(p,o.value0.value0,o.value0.value1,o.value0.value2.value0),o.value0.value2.value1,o.value0.value2.value2,new pn(o.value0.value2.value3,o.value0.value2.value4,o.value0.value2.value5,o.value0.value2.value6),o.value0.value3,o.value0.value4,o.value0.value5))):o.value0 instanceof se&&o.value0.value0 instanceof Pn?(i=!0,Tt(n)(o.value1)(new Pn(new pn(o.value0.value0.value0,o.value0.value0.value1,o.value0.value0.value2,o.value0.value0.value3),o.value0.value0.value4,o.value0.value0.value5,new pn(o.value0.value0.value6,o.value0.value1,o.value0.value2,p),o.value0.value3,o.value0.value4,o.value0.value5))):o.value0 instanceof se&&o.value0.value5 instanceof Pn?(i=!0,Tt(n)(o.value1)(new Pn(o.value0.value0,o.value0.value1,o.value0.value2,new pn(p,o.value0.value3,o.value0.value4,o.value0.value5.value0),o.value0.value5.value1,o.value0.value5.value2,new pn(o.value0.value5.value3,o.value0.value5.value4,o.value0.value5.value5,o.value0.value5.value6)))):o.value0 instanceof Xe&&o.value0.value3 instanceof Pn?(i=!0,Tt(n)(o.value1)(new Pn(o.value0.value0,o.value0.value1,o.value0.value2,new pn(o.value0.value3.value0,o.value0.value3.value1,o.value0.value3.value2,o.value0.value3.value3),o.value0.value3.value4,o.value0.value3.value5,new pn(o.value0.value3.value6,o.value0.value4,o.value0.value5,p)))):(i=!0,Xr("The impossible happened in partial function `up`."))}throw new Error("Failed pattern match at Data.Map.Internal (line 552, column 5 - line 573, column 86): "+[o.constructor.name])}for(;!i;)d=m(f,_);return d}},e=function(l){return function(_){var f=l,i=!1,d;function m(o,p){if(p instanceof pn&&p.value0 instanceof nn&&p.value3 instanceof nn)return i=!0,r(o)(nn.value);if(p instanceof pn){f=new K(new we(p.value0,p.value1,p.value2),o),_=p.value3;return}if(p instanceof Pn&&p.value0 instanceof nn&&p.value3 instanceof nn&&p.value6 instanceof nn)return i=!0,r(new K(new we(nn.value,p.value1,p.value2),o))(nn.value);if(p instanceof Pn){f=new K(new Xe(p.value0,p.value1,p.value2,p.value3,p.value4,p.value5),o),_=p.value6;return}return i=!0,Xr("The impossible happened in partial function `removeMaxNode`.")}for(;!i;)d=m(f,_);return d}},a=function(l){var _=!1,f;function i(d){if(d instanceof pn&&d.value3 instanceof nn)return _=!0,{key:d.value1,value:d.value2};if(d instanceof pn){l=d.value3;return}if(d instanceof Pn&&d.value6 instanceof nn)return _=!0,{key:d.value4,value:d.value5};if(d instanceof Pn){l=d.value6;return}return _=!0,Xr("The impossible happened in partial function `maxNode`.")}for(;!_;)f=i(l);return f},u=un(n),c=function(l){return function(_){var f=l,i=!1,d;function m(o,p){if(p instanceof nn)return i=!0,D.value;if(p instanceof pn){var B=u(t)(p.value1);if(p.value3 instanceof nn&&B instanceof fn)return i=!0,new v(new F(p.value2,r(o)(nn.value)));if(B instanceof fn){var Un=a(p.value0);return i=!0,new v(new F(p.value2,e(new K(new je(Un.key,Un.value,p.value3),o))(p.value0)))}if(B instanceof rn){f=new K(new je(p.value1,p.value2,p.value3),o),_=p.value0;return}f=new K(new we(p.value0,p.value1,p.value2),o),_=p.value3;return}if(p instanceof Pn){var Gt=function(){return p.value0 instanceof nn&&p.value3 instanceof nn&&p.value6 instanceof nn}(),B=u(t)(p.value4),Rn=u(t)(p.value1);if(Gt&&Rn instanceof fn)return i=!0,new v(new F(p.value2,Tt(n)(o)(new pn(nn.value,p.value4,p.value5,nn.value))));if(Gt&&B instanceof fn)return i=!0,new v(new F(p.value5,Tt(n)(o)(new pn(nn.value,p.value1,p.value2,nn.value))));if(Rn instanceof fn){var Un=a(p.value0);return i=!0,new v(new F(p.value2,e(new K(new Ge(Un.key,Un.value,p.value3,p.value4,p.value5,p.value6),o))(p.value0)))}if(B instanceof fn){var Un=a(p.value3);return i=!0,new v(new F(p.value5,e(new K(new se(p.value0,p.value1,p.value2,Un.key,Un.value,p.value6),o))(p.value3)))}if(Rn instanceof rn){f=new K(new Ge(p.value1,p.value2,p.value3,p.value4,p.value5,p.value6),o),_=p.value0;return}if(Rn instanceof sn&&B instanceof rn){f=new K(new se(p.value0,p.value1,p.value2,p.value4,p.value5,p.value6),o),_=p.value3;return}f=new K(new Xe(p.value0,p.value1,p.value2,p.value3,p.value4,p.value5),o),_=p.value6;return}throw new Error("Failed pattern match at Data.Map.Internal (line 525, column 16 - line 548, column 80): "+[p.constructor.name])}for(;!i;)d=m(f,_);return d}};return c(ft.value)}};var eo=function(){return nn.value}();var X_=function(n){return function(t){return function(r){return Zn(r)($t)(jg(n)(t)(r))}}};var ao=function(n){return function(t){return function(r){return function(e){var a=t(mi(n)(r)(e));if(a instanceof D)return X_(n)(r)(e);if(a instanceof v)return vi(n)(r)(a.value0)(e);throw new Error("Failed pattern match at Data.Map.Internal (line 596, column 15 - line 598, column 25): "+[a.constructor.name])}}}};var Q_={compact:function(n){return function(){var r=ga(),e=ci(function(a){return to(n)(a)})();return li(e)(function(){var a=Z(yt);return function(u){return a(function(c){if(c instanceof D)return y(or)(0);if(c instanceof v)return xe(c.value0)(r);throw new Error("Failed pattern match at Data.Compactable (line 111, column 34 - line 113, column 35): "+[c.constructor.name])}(u))}}())(),le(r)()}()},separate:function(n){return function(){var r=ga(),e=ga(),a=ci(function(u){return to(n)(u)})();return li(a)(function(){var u=Z(yt);return function(c){return u(function(l){if(l instanceof O)return xe(l.value0)(r);if(l instanceof P)return xe(l.value0)(e);throw new Error("Failed pattern match at Data.Compactable (line 122, column 34 - line 124, column 31): "+[l.constructor.name])}(c))}}())(),bn(h_)(s(yt)(function(u){return function(c){return{left:u,right:c}}})(le(r)))(le(e))()}()}};var Ta=function(n){return n.compact};var Y_={partitionMap:function(n){var t=function(r){return function(e){var a=n(e);if(a instanceof O)return{left:A(bt)(r.left)([a.value0]),right:r.right};if(a instanceof P)return{right:A(bt)(r.right)([a.value0]),left:r.left};throw new Error("Failed pattern match at Data.Filterable (line 149, column 16 - line 151, column 50): "+[a.constructor.name])}};return it($n)(t)({left:[],right:[]})},partition:fi,filterMap:lc,filter:Jo,Compactable0:function(){return Q_},Functor1:function(){return ot}};var ur=function(n){return n.filterMap};var Z_=function(n){return n.filter};var ir={dimap:function(n){return function(t){return function(r){return function(e){return t(r(n(e)))}}}}},K_=function(n){return n.dimap},gr=function(n){return function(t){return K_(n)(t)(Q(V))}};var uo=function(n){return n.keepLatest},Ye=function(n){return n.fold};var Ca=function(n){return function(t){return function(r){return function(e){return ur(n.Filterable1())($t)(Ye(n)(function(a){return function(u){return s(_a)(y(qe))(t(a)(u.value0))}})(r)(new F(e,D.value)))}}}};var Ze=function(n){return n.bang};function vc(n){return function(t){return n===t}}var tp=vc;var ib=function(n){return n};var qt=function(n){return function(t){return n(t)}},fb=function(n){return function(t){return function(r){return function(e){return function(a){return b(n.Monad0().Bind1())(vn(n)(xt(D.value)))(function(u){return b(n.Monad0().Bind1())(r(function(c){return vn(n)(Z(yt)(ar(new v(c))(u)))}))(function(c){return b(n.Monad0().Bind1())(e(function(l){return b(n.Monad0().Bind1())(vn(n)(Dt(u)))(jr(t)(It)(function(_){return a(l(_))}))}))(function(l){return y(t)(Tn(t.Apply0())(c)(l))})})})}}}}},fr=ib,cb=function(n){return function(t){return function(r){return b(n.Monad0().Bind1())(vn(n)(xt(D.value)))(function(e){return b(n.Monad0().Bind1())(t(function(a){return Vn(Jn)(n.Monad0().Bind1())(b(n.Monad0().Bind1())(vn(n)(Dt(e)))(Ju(n.Monad0().Applicative0())(It)))(function(){return b(n.Monad0().Bind1())(qt(a)(r))(function(u){return vn(n)(Z(yt)(ar(new v(u))(e)))})})}))(function(a){return y(n.Monad0().Applicative0())(Vn(Jn)(n.Monad0().Bind1())(b(n.Monad0().Bind1())(vn(n)(Dt(e)))(Ju(n.Monad0().Applicative0())(It)))(function(){return a}))})})}}},Xn={map:function(n){return function(t){return function(r){return t(function(e){return r(n(e))})}}}};var lb=function(n){return function(t){return function(r){return function(e){return function(a){return b(n.Monad0().Bind1())(vn(n)(xt(e)))(function(u){return r(function(c){return b(n.Monad0().Bind1())(vn(n)(Bt(t(c))(u)))(a)})})}}}}},Yo=function(n){return function(t){return function(r){return function(e){return r(function(a){var u=t(a);if(u instanceof v)return e(u.value0);if(u instanceof D)return y(n)(void 0);throw new Error("Failed pattern match at FRP.Event (line 126, column 13 - line 128, column 27): "+[u.constructor.name])})}}}},dc=function(n){return function(t){return Yo(n)(function(r){var e=t(r);if(e)return new v(r);if(!e)return D.value;throw new Error("Failed pattern match at FRP.Event (line 84, column 13 - line 86, column 25): "+[e.constructor.name])})}};var Dc=function(n){return function(t){return b(n.Monad0().Bind1())(vn(n)(xt([])))(function(r){return y(n.Monad0().Applicative0())({event:function(e){return b(t.Monad0().Bind1())(vn(t)(Bt(function(a){return A(bt)(a)([e])})(r)))(function(){return y(t.Monad0().Applicative0())(b(t.Monad0().Bind1())(vn(t)(Bt(cc(tp)(e))(r)))(function(){return y(t.Monad0().Applicative0())(void 0)}))})},push:function(e){return b(t.Monad0().Bind1())(vn(t)(Dt(r)))(jr(t.Monad0().Applicative0())($n)(function(a){return a(e)}))}})})}},sb=function(n){return function(t){return function(r){return function(e){return b(t.Bind1())(Dc(n)(n))(function(a){var u=r(a.event);return b(t.Bind1())(qt(u.input)(a.push))(function(c){return b(t.Bind1())(qt(u.output)(e))(function(l){return y(t.Applicative0())(Tn(t.Bind1().Apply0())(c)(l))})})})}}}},rp=function(n){return function(t){return function(r){return fr(function(e){return b(n.Monad0().Bind1())(Dc(n)(n))(function(a){return Vn(Jn)(n.Monad0().Bind1())(e(r(a.event)))(function(){return qt(t)(a.push)})})})}}},Zo=function(n){return{compact:Yo(n)(Q(V)),separate:function(t){return{left:Yo(n)(function(r){if(r instanceof O)return new v(r.value0);if(r instanceof P)return D.value;throw new Error("Failed pattern match at FRP.Event (line 67, column 13 - line 69, column 33): "+[r.constructor.name])})(t),right:Yo(n)(function(r){if(r instanceof P)return new v(r.value0);if(r instanceof O)return D.value;throw new Error("Failed pattern match at FRP.Event (line 74, column 13 - line 76, column 32): "+[r.constructor.name])})(t)}}}},re=function(n){return{filter:dc(n),filterMap:Yo(n),partition:function(t){return function(r){return{yes:dc(n)(t)(r),no:dc(n)(function(){var e=Wr(Kt);return function(a){return e(t(a))}}())(r)}}},partitionMap:function(t){return function(r){return{left:ur(re(n))(function(){var e=Or(v.create)(E(D.value));return function(a){return e(t(a))}}())(r),right:ur(re(n))(function(e){return Ff(t(e))})(r)}}},Compactable0:function(){return Zo(n)},Functor1:function(){return Xn}}},yc=function(n){return function(t){return fr(function(r){return b(n.Monad0().Bind1())(Dc(n)(n))(function(e){return Vn(Jn)(n.Monad0().Bind1())(r(t(e.push)(e.event)))(function(){return y(n.Monad0().Applicative0())(y(n.Monad0().Applicative0())(void 0))})})})}},$=function(n){return function(t){return function(r){return s(n.Apply0().Functor0())(function(e){return y(n)(void 0)})(r(t))}}},An=function(n){return{alt:function(t){return function(r){return function(e){return bn(n.Apply0())(s(n.Apply0().Functor0())(function(a){return function(u){return Tn(n.Apply0())(a)(u)}})(t(e)))(r(e))}}},Functor0:function(){return Xn}}},dn=function(n){return{empty:function(t){return y(n)(y(n)(void 0))},Alt0:function(){return An(n)}}},Ct=function(n){return{fold:lb(n),keepLatest:cb(n),sampleOn:fb(n)(n.Monad0().Applicative0()),fix:sb(n)(n.Monad0()),bang:$(n.Monad0().Applicative0()),Plus0:function(){return dn(n.Monad0().Applicative0())},Filterable1:function(){return re(n.Monad0().Applicative0())}}};var ep="_____$__$_$$_vbus";function gc(n){return()=>{for(let t in n)delete n[t]}}function bc(n){return()=>{let t=(u,c,l,_)=>{let f=Object.keys(_);for(var i=0;i<f.length;i++)if(_[f[i]]instanceof Object&&_[f[i]][ep]===ep){let d={},m={};t(u,d,m,_[f[i]]),c[f[i]]=d,l[f[i]]=m}else{let d=`${Math.random()}`;u[d]={},c[f[i]]=m=>()=>{let o=Object.keys(u[d]);for(var p=0;p<o.length;p++)u[d][o[p]](m)()},l[f[i]]=m=>()=>{let o=`${Math.random()}`;return u[d][o]=m,()=>{delete u[d][o]}}}},r={},e={},a={};return t(r,e,a,n),{p:e,e:a,s:r}}}var Tc=function(n){return function(){return function(){return function(t){return function(r){return function(e){return De(St(n)(t))(r)(e)}}}}}},Cc=function(n){return function(){return function(t){return function(r){return Cr(St(n)(t))(r)}}}};var yi={vb:function(n){return function(t){return function(r){return{}}}}},ap=function(n){return n.vb},Ec=function(){return function(n){return function(t){return function(r){return function(e){var a=ap(t)(x.value)(x.value)(x.value);return fr(function(u){return b(n.Monad0().Bind1())(bc(a))(function(c){return Vn(Jn)(n.Monad0().Bind1())(u(e(c.p)(c.e)))(function(){return y(n.Monad0().Applicative0())(gc(c.s))})})})}}}}};var io=function(n){return function(){return function(){return function(t){return function(){return function(){return function(){return function(){return{vb:function(r){return function(e){return function(a){return Tc(n)()()(x.value)(void 0)(ap(t)(x.value)(x.value)(x.value))}}}}}}}}}}}};var Ke=function(){function n(t){this.value0=t}return n.create=function(t){return new n(t)},n}(),Fc=function(){function n(){}return n.value=new n,n}();var Ko=function(){function n(t){this.value0=t}return n.create=function(t){return new n(t)},n}(),nu=function(){function n(){}return n.value=new n,n}(),bi=function(){function n(t){this.value0=t}return n.create=function(t){return new n(t)},n}(),Ti=function(){function n(t){this.value0=t}return n.create=function(t){return new n(t)},n}(),Ci=function(){function n(t){this.value0=t}return n.create=function(t){return new n(t)},n}(),fo=function(){function n(t){this.value0=t}return n.create=function(t){return new n(t)},n}(),yn=function(){function n(t){this.value0=t}return n.create=function(t){return new n(t)},n}();var ha={eq:function(n){return function(t){return n instanceof Ke&&t instanceof Ke?n.value0===t.value0:n instanceof Fc&&t instanceof Fc}}};var rt=function(n){return new Ci(n)};var Ea=function(n){return new Ti(n)};var hi={Always0:function(){return Na(Yr(Pr))},Always1:function(){return Na(Yr(Yr(Pr)))},Always2:function(){return Na(Yr(Pr))},Always3:function(){return Na(ma(V))},Always4:function(){return Na(ma(V))},MonadST5:function(){return E_}},Ei={Always0:function(){return Ra(Yr(Pr))},Always1:function(){return Ra(Yr(Yr(Pr)))},Always2:function(){return Ra(Yr(Pr))},Always3:function(){return Ra(ma(V))},Always4:function(){return Ra(ma(V))},MonadST5:function(){return F_}},Fi=function(){return function(n){return function(){return function(t){return function(r){return function(e){return function(a){return new fo(Ec()(n.MonadST5())(r)(e)(gr(ir)(c_(i_()(t)))(a)))}}}}}}},op=function(){return new bi(void 0)}(),up=function(){return nu.value}(),co=function(){return Ko.create}(),Fa=function(n){return function(t){return function(r){return yc(n.MonadST5())(gr(ir)(s(Sr)(xo(t)))(r))}}},lo=function(n){return function(t){return function(r){return new fo(Fa(n)(t)(r))}}};function ip(n){return()=>n.slice()}function fp(n){return t=>r=>()=>{r[n]=t}}function cp(n){return()=>n.slice()}var _e=function(n){return n.reflectType};var so={map:function(n){return function(t){return s(ot)(n)(t)}}};var gb=function(n){return _e(n)},Mi=function(){return function(n){return n}};var Mc=function(){return function(){return function(){return function(){return function(){return function(n){return function(t){return function(r){return r[gb(n)(t)]}}}}}}}};var sp=[];var xc=function(){return function(){return function(n){return function(t){return Xo(n)(t)}}}};function _p(n){return function(){var t={};for(var r in n)hasOwnProperty.call(n,r)&&(t[r]=n[r]);return t}}var na={};function Ac(n){return n()}function pp(n){return function(t){return function(r){return function(e){var a=r;function u(l){return function(_){return t(_)(l)(e[l])}}for(var c in e)hasOwnProperty.call(e,c)&&(a=n(a)(u(c)));return a}}}}function xi(n){return function(t){var r=[];for(var e in t)hasOwnProperty.call(t,e)&&r.push(n(e)(t[e]));return r}}var bb=Object.keys||xi(function(n){return function(){return n}});function Lc(n){return function(t){return function(r){return function(){return r[n]=t,r}}}}var Ic=function(n){return function(t){return function(){return delete t[n],t}}};var wb=xi(function(n){return function(t){return t}});var Ab=_p;var mp=function(n){return function(t){return Ac(function(){var e=Ab(t)();return n(e)(),e})}};var _o=function(n){return function(t){return mp(Lc(n)(t))}};var vp=pp(Df),Lb=function(n){return function(t){return vp(function(r){return function(e){return function(a){return A(n.Semigroup0())(r)(t(e)(a))}}})(En(n))}},dp={foldl:function(n){return vp(function(t){return function(r){return n(t)}})},foldr:function(n){return function(t){return function(r){return ut($n)(n)(t)(wb(r))}}},foldMap:function(n){return function(t){return Lb(n)(E(t))}}};var Sc=function(n){return mp(Ic(n))};var Dp=function(){function n(){}return n.value=new n,n}(),Pc=function(){function n(){}return n.value=new n,n}(),Ib=function(){function n(){}return n.value=new n,n}();var tu=function(n){return function(t){return function(r){var e=function(a){var u=function(c){return function(l){return new F(l+1|0,new F(c,l))}};return Ca(Ct(n))(u)(a)(0)};return new Ti(uo(Ct(n))(rp(n)(e(r))(function(a){return s(Xn)(function(u){return U(An(n.Monad0().Applicative0()))(Ze(Ct(n))(new Ko(t(u.value0))))(s(Xn)(E(nu.value))(Z_(re(n.Monad0().Applicative0()))(function(){var c=tn(Fo)(u.value1+1|0);return function(l){return c($t(l))}}())(a)))})(a)})))}}},pe=function(n){return function(t){return function(r){return function(e){return function(a){var u=function(c){return c(e)(a)};return function(c){if(c instanceof Ci)return oe($n)(dn(n))(pe(n)(t)(r)(e)(a))(c.value0);if(c instanceof fo)return uo(Ct(t))(s(Xn)(pe(n)(t)(r)(e)(a))(c.value0));if(c instanceof yn)return u(r.toElt(c.value0));if(c instanceof Ti)return fr(function(l){return b(t.Monad0().Bind1())(vn(t)(xt(na)))(function(_){return b(t.Monad0().Bind1())(qt(c.value0)(function(f){return b(t.Monad0().Bind1())(r.ids(a))(function(i){return b(t.Monad0().Bind1())(vn(t)(xt(y(n)(void 0))))(function(d){return b(t.Monad0().Bind1())(r.ids(a))(function(m){return b(t.Monad0().Bind1())(vn(t)(xt(y(n)(void 0))))(function(o){return b(t.Monad0().Bind1())(vn(t)(xt(D.value)))(function(p){return b(t.Monad0().Bind1())(vn(t)(xt(y(n)(void 0))))(function(B){return b(t.Monad0().Bind1())(s(n.Apply0().Functor0())(Ke.create)(r.ids(a)))(function(Un){return b(t.Monad0().Bind1())(vn(t)(xt(Dp.value)))(function(Gt){return b(t.Monad0().Bind1())(qt(f)(function(Rn){return b(t.Monad0().Bind1())(vn(t)(Dt(Gt)))(function(Br){return Rn instanceof bi&&Br instanceof Pc?b(t.Monad0().Bind1())(vn(t)(Dt(p)))(jr(n)(It)(function(){var sr=r.doLogic(Rn.value0)(a);return function(W){return l(sr(W))}}())):Rn instanceof nu&&Br instanceof Pc?Vn(Jn)(t.Monad0().Bind1())(Z(n.Apply0().Functor0())(vn(t)(ar(Ib.value)(Gt))))(function(){var sr=Tn(n.Apply0())(Tn(n.Apply0())(Tn(n.Apply0())(Tn(n.Apply0())(b(t.Monad0().Bind1())(vn(t)(Dt(p)))(jr(n)(It)(function(W){return nr(n)(It)(e.parent)(function(Xt){return l(r.disconnectElement(a)({id:W,parent:Xt,scope:Un}))})})))(sa(t.Monad0().Bind1())(vn(t)(Dt(d)))))(sa(t.Monad0().Bind1())(vn(t)(Dt(o)))))(Z(n.Apply0().Functor0())(vn(t)(Bt(Sc(i))(_)))))(Z(n.Apply0().Functor0())(vn(t)(Bt(Sc(m))(_))));return Tn(n.Apply0())(Z(n.Apply0().Functor0())(vn(t)(ar(sr)(B))))(sr)}):Rn instanceof Ko&&Br instanceof Dp?Vn(Jn)(t.Monad0().Bind1())(Z(n.Apply0().Functor0())(vn(t)(ar(Pc.value)(Gt))))(function(){return b(t.Monad0().Bind1())(qt(pe(n)(t)(r)({parent:e.parent,scope:Un,raiseId:function(sr){return Z(n.Apply0().Functor0())(vn(t)(ar(new v(sr))(p)))}})(a)(function(){return Rn.value0 instanceof yn?Rn.value0:r.wrapElt(Rn.value0)}()))(l))(function(sr){return Vn(Jn)(t.Monad0().Bind1())(Z(n.Apply0().Functor0())(vn(t)(Bt(_o(m)(sr))(_))))(function(){return Z(n.Apply0().Functor0())(vn(t)(ar(sr)(o)))})})}):y(n)(void 0)})}))(function(Rn){return Vn(Jn)(t.Monad0().Bind1())(Z(n.Apply0().Functor0())(vn(t)(ar(Rn)(d))))(function(){return Vn(Jn)(t.Monad0().Bind1())(Z(n.Apply0().Functor0())(vn(t)(Bt(_o(i)(Rn))(_))))(function(){return sa(t.Monad0().Bind1())(vn(t)(Dt(B)))})})})})})})})})})})})}))(function(f){return y(n)(Vn(Jn)(t.Monad0().Bind1())(b(t.Monad0().Bind1())(vn(t)(Dt(_)))(it(dp)(Tn(n.Apply0()))(y(n)(void 0))))(function(){return f}))})})});throw new Error("Failed pattern match at Bolson.Control (line 209, column 17 - line 294, column 20): "+[c.constructor.name])}}}}}};var Sb=C,$b=function(){return function(n){return function(t){return function(r){return function(e){return function(a){return function(u){return function(c){var l=function(_){return function(f){return fr(function(i){return b(n.Monad0().Bind1())(ip(s(ot)(E(""))(Mi()(u))))(function(d){var m=za($n)(dn(n.Monad0().Applicative0()))(Ee(Uo)(function(o){return xf(Es)(function(p){return function(B){return B instanceof yn?function(Un){return Un({parent:D.value,scope:r(_.scope),raiseId:function(Gt){return fp(o)(Gt)(d)}})(f)}(e.toElt(B.value0)):p(e.wrapElt(B))}})})(Mi()(u)));return b(n.Monad0().Bind1())(qt(m)(i))(function(o){return b(n.Monad0().Bind1())(vn(n)(xt(y(n.Monad0().Applicative0())(void 0))))(function(p){return b(n.Monad0().Bind1())(s(n.Monad0().Bind1().Apply0().Functor0())(C)(cp(d)))(function(B){var Un=s(so)(function(Rn){return function(Br){return new yn(a.fromElt(function(sr){return function(W){return fr(function(Xt){return Vn(Jn)(n.Monad0().Bind1())(sr.raiseId(Rn))(function(){return Vn(Jn)(n.Monad0().Bind1())(nr(n.Monad0().Applicative0())(It)(sr.parent)(function(To){return Xt(a.giveNewParent(W)({id:Rn,parent:To,scope:sr.scope})(Br))}))(function(){return y(n.Monad0().Applicative0())(y(n.Monad0().Applicative0())(void 0))})})})}}))}})(B),Gt=pe(n.Monad0().Applicative0())(n)(e)(_)(f)(Sb(c(Un)(C)));return b(n.Monad0().Bind1())(qt(Gt)(i))(function(Rn){return Vn(Jn)(n.Monad0().Bind1())(Z(n.Monad0().Bind1().Apply0().Functor0())(vn(n)(ar(Rn)(p))))(function(){return y(n.Monad0().Applicative0())(Vn(Jn)(n.Monad0().Bind1())(o)(function(){return Vn(Jn)(n.Monad0().Bind1())(be(n.Monad0().Applicative0())(!t)(nr(n.Monad0().Applicative0())($n)(Mi()(B))(function(Br){return i(a.deleteFromCache(f)({id:Br}))})))(function(){return sa(n.Monad0().Bind1())(vn(n)(Dt(p)))})}))})})})})})})})}};return new yn(a.fromElt(l))}}}}}}}};var yp=function(){return function(n){return function(t){return function(r){return function(e){return function(a){return $b()(n)(!1)(Q(V))(t)(r)(e)(a)}}}}}};var Pb=function(n){return n},eu=function(){function n(t){this.value0=t}return n.create=function(t){return new n(t)},n}(),au=function(){function n(t){this.value0=t}return n.create=function(t){return new n(t)},n}(),Nb=function(n){return n},wi=va(),ct=Nb;var zt=function(){return eu.create}();var Ma=function(){return au.create}(),Qn=function(){var n=s(Sr)(s(xn)(E(!0)));return function(t){return Pb(n(t))}}(),on=function(n){return n.attr};var Rb=function(n){return n.makeText},kb=function(n){return function(t){return function(r){return s(Xn)(function(e){return n.setText(function(a){return{id:t,text:a}}(e))})(r)}}},Ob=function(n){return function(t){return function(r){return s(Xn)(function(e){return function(a){if(a.value instanceof eu)return n.setProp({id:t,key:a.key,value:a.value.value0});if(a.value instanceof au)return n.setCb({id:t,key:a.key,value:a.value.value0});throw new Error("Failed pattern match at Deku.Control (line 68, column 26 - line 70, column 45): "+[a.value.constructor.name])}(wi(e))})(r)}}},Wb=function(n){return n.makeElement},wr=function(n){return function(t){var r=function(e){return function(a){return fr(function(u){return b(n.Bind1())(a.ids)(function(c){return Vn(Jn)(n.Bind1())(e.raiseId(c))(function(){return s(n.Bind1().Apply0().Functor0())(Tn(n.Bind1().Apply0())(u(a.deleteFromCache({id:c}))))(qt(za($n)(dn(n.Applicative0()))([$(n.Applicative0())(Rb(a)({id:c,parent:e.parent,scope:e.scope})),kb(a)(c)(t)]))(u))})})})}};return new yn(r)}},wn=function(n){return function(t){return wr(n)($(n.Applicative0())(t))}},Wn=function(n){return function(t){return function(r){return function(e){var a=function(u){return function(c){return fr(function(l){return b(n.MonadST5().Monad0().Bind1())(c.ids)(function(_){return Vn(Jn)(n.MonadST5().Monad0().Bind1())(u.raiseId(_))(function(){return s(n.MonadST5().Monad0().Bind1().Apply0().Functor0())(Tn(n.MonadST5().Monad0().Bind1().Apply0())(l(c.deleteFromCache({id:_}))))(qt(U(An(n.MonadST5().Monad0().Applicative0()))(za($n)(dn(n.MonadST5().Monad0().Applicative0()))([$(n.MonadST5().Monad0().Applicative0())(Wb(c)({id:_,parent:u.parent,scope:u.scope,tag:t})),Ob(c)(_)(r)]))(Ub(n)({parent:new v(_),scope:u.scope,raiseId:function(f){return y(n.MonadST5().Monad0().Applicative0())(void 0)}})(c)(e)))(l))})})})}};return a}}}},Ub=function(n){return pe(n.MonadST5().Monad0().Applicative0())(n.MonadST5())({doLogic:function(t){return function(r){return function(e){return r.sendToTop({id:e})}}},ids:function(){var t=pt();return function(r){return function(e){return e.ids}(t(r))}}(),disconnectElement:function(t){return function(r){return t.disconnectElement({id:r.id,scope:r.scope,parent:r.parent,scopeEq:tn(ha)})}},wrapElt:function(){var t=Wn(n)("div")(cn(dn(n.MonadST5().Monad0().Applicative0())));return function(r){return yn.create(t(r))}}(),toElt:function(t){return t}})};var gp=function(){return function(n){return function(t){return function(r){return yp()(n.MonadST5())({doLogic:function(e){return function(a){return function(u){return a.sendToTop({id:u})}}},ids:function(){var e=pt();return function(a){return function(u){return u.ids}(e(a))}}(),disconnectElement:function(e){return function(a){return e.disconnectElement({id:a.id,scope:a.scope,parent:a.parent,scopeEq:tn(ha)})}},wrapElt:function(){var e=Wn(n)("div")(cn(dn(n.MonadST5().Monad0().Applicative0())));return function(a){return yn.create(e(a))}}(),toElt:function(e){return e}})({fromElt:function(e){return e},giveNewParent:function(e){return function(a){return function(u){return pt()(e).giveNewParent(a)}}},deleteFromCache:function(){var e=pt();return function(a){return function(u){return u.deleteFromCache}(e(a))}}()})(t)(gr(ir)(s(so)(function(e){return e(void 0)}))(va()(r)))}}}};var Kn=function(){function n(){}return n.value=new n,n}(),po={attr:function(n){return function(t){return ct({key:"click",value:Ma(E(Ir(xn)(t)(!0)))})}}};var st={attr:function(n){return function(t){return ct({key:"click",value:Ma(t)})}}};var rr=function(){function n(){}return n.value=new n,n}();var mo={attr:function(n){return function(t){return ct({key:"style",value:zt(t)})}}};var bp={attr:function(n){return function(t){return ct({key:"style",value:zt(t)})}}};var Tp={attr:function(n){return function(t){return ct({key:"style",value:zt(t)})}}};var Nc={attr:function(n){return function(t){return ct({key:"style",value:zt(t)})}}};var Ai={attr:function(n){return function(t){return ct({key:"style",value:zt(t)})}}};var Cp={attr:function(n){return function(t){return ct({key:"style",value:zt(t)})}}};var Li=function(n){return function(t){return function(r){return new yn(Wn(n)("a")(t)(rt(r)))}}};var Rc=function(n){return function(t){return function(r){return new yn(Wn(n)("div")(t)(rt(r)))}}},Nn=function(n){return Rc(n)(cn(dn(n.MonadST5().Monad0().Applicative0())))};var xa=function(n){return function(t){return function(r){return new yn(Wn(n)("span")(t)(rt(r)))}}},uu=function(n){return xa(n)(cn(dn(n.MonadST5().Monad0().Applicative0())))};var Ep=function(){function n(){}return n.value=new n,n}();var Fp={attr:function(n){return function(t){return ct({key:"href",value:zt(t)})}}};var vo=function(){function n(){}return n.value=new n,n}();var Mp={attr:function(n){return function(t){return ct({key:"type",value:zt(t)})}}};var Si={attr:function(n){return function(t){return ct({key:"type",value:zt(t)})}}};var cr=function(n){return function(t){return function(r){return new yn(Wn(n)("button")(t)(rt(r)))}}},xp=function(n){return cr(n)(cn(dn(n.MonadST5().Monad0().Applicative0())))};var Bb=function(n){return function(t){return function(r){return new yn(Wn(n)("code")(t)(rt(r)))}}},Et=function(n){return Bb(n)(cn(dn(n.MonadST5().Monad0().Applicative0())))};var qb=function(n){return function(t){return function(r){return new yn(Wn(n)("i")(t)(rt(r)))}}},wp=function(n){return qb(n)(cn(dn(n.MonadST5().Monad0().Applicative0())))};var ra=function(n){return function(t){return function(r){return new yn(Wn(n)("input")(t)(rt(r)))}}};var Vb=function(n){return function(t){return function(r){return new yn(Wn(n)("li")(t)(rt(r)))}}},Ap=function(n){return Vb(n)(cn(dn(n.MonadST5().Monad0().Applicative0())))};var jb=function(n){return function(t){return function(r){return new yn(Wn(n)("pre")(t)(rt(r)))}}},Ft=function(n){return jb(n)(cn(dn(n.MonadST5().Monad0().Applicative0())))};var Gb=function(n){return function(t){return function(r){return new yn(Wn(n)("ul")(t)(rt(r)))}}},Lp=function(n){return Gb(n)(cn(dn(n.MonadST5().Monad0().Applicative0())))};var Pi=function(){function n(){}return n.value=new n,n}(),iu=function(){function n(){}return n.value=new n,n}(),fu=function(){function n(){}return n.value=new n,n}(),cu=function(){function n(){}return n.value=new n,n}(),lu=function(){function n(){}return n.value=new n,n}(),su=function(){function n(){}return n.value=new n,n}(),_u=function(){function n(){}return n.value=new n,n}(),pu=function(){function n(){}return n.value=new n,n}(),mu=function(){function n(){}return n.value=new n,n}(),vu=function(){function n(){}return n.value=new n,n}();function Oc(){window.scrollTo(0,0)}var Vt=Oc;var Yb=function(n){return n};var Mt=function(n){return{pursxToElement:function(t){return function(r){return function(e){return{cache:na,element:function(a){return function(u){return cn(dn(n))}}}}}}}},Wc=function(n){return n.pursxToElement},Rt=function(){return function(n){return function(t){return function(r){return function(e){return{pursxToElement:function(a){return function(u){return function(c){var l=Wc(n)(a)(x.value)(c);return{cache:_o(_e(t)(x.value))(!0)(l.cache),element:function(_){return function(f){return U(An(e.MonadST5().Monad0().Applicative0()))(s(Xn)(gr(ir)(wi)(function(i){if(i.value instanceof eu)return f.setProp({id:_e(t)(x.value)+a,key:i.key,value:i.value.value0});if(i.value instanceof au)return f.setCb({id:_e(t)(x.value)+a,key:i.key,value:i.value.value0});throw new Error("Failed pattern match at Deku.Pursx (line 4475, column 38 - line 4485, column 24): "+[i.value.constructor.name])}))(Cc(r)()(x.value)(c)))(l.element(_)(f))}}}}}}}}}}}};var qn=Yb,Uc=function(n){return function(t){return function(){return function(){return function(r){return function(e){return function(a){return function(u){return function(c){var l=function(_){return function(f){return fr(function(i){return b(r.MonadST5().Monad0().Bind1())(f.ids)(function(d){return b(r.MonadST5().Monad0().Bind1())(f.ids)(function(m){return Vn(Jn)(r.MonadST5().Monad0().Bind1())(_.raiseId(d))(function(){var o=Wc(e)(m)(x.value)(c);return s(r.MonadST5().Monad0().Bind1().Apply0().Functor0())(Tn(r.MonadST5().Monad0().Bind1().Apply0())(i(f.deleteFromCache({id:d}))))(qt(U(An(r.MonadST5().Monad0().Applicative0()))($(r.MonadST5().Monad0().Applicative0())(f.makePursx({id:d,parent:_.parent,cache:o.cache,pxScope:m,scope:_.scope,html:_e(n)(u),verb:_e(t)(a)})))(o.element(_)(f)))(i))})})})})}};return new yn(l)}}}}}}}}},At=function(n){return function(){return function(){return function(t){return function(r){return Uc(n)({reflectType:function(){return"~"}})()()(r)(t)(x.value)}}}}},Ip=function(n){return function(){return function(t){return function(r){return function(e){return At(n)()()(r)(t)(e)({})}}}}},Zb=function(n){return pe(n.MonadST5().Monad0().Applicative0())(n.MonadST5())({doLogic:function(t){return function(r){return function(e){return r.sendToTop({id:e})}}},ids:function(){var t=pt();return function(r){return function(e){return e.ids}(t(r))}}(),disconnectElement:function(t){return function(r){return t.disconnectElement({id:r.id,scope:r.scope,parent:r.parent,scopeEq:tn(ha)})}},wrapElt:function(){var t=Wn(n)("div")(cn(dn(n.MonadST5().Monad0().Applicative0())));return function(r){return yn.create(t(r))}}(),toElt:function(t){return t}})},zn=function(){return function(n){return function(t){return function(r){return function(e){return{pursxToElement:function(a){return function(u){return function(c){var l=Cc(r)()(x.value)(c),_=Wc(n)(a)(x.value)(c);return{cache:_o(_e(t)(x.value))(!1)(_.cache),element:function(f){return function(i){return U(An(e.MonadST5().Monad0().Applicative0()))(Zb(e)({parent:new v(_e(t)(x.value)+a),scope:f.scope,raiseId:function(d){return y(e.MonadST5().Monad0().Applicative0())(void 0)}})(i)(l))(_.element(f)(i))}}}}}}}}}}}};var Kb=function(){return x.value}(),Sp=function(n){return function(t){return At({reflectType:function(){return`<div>
  <h1>A Simple Component</h1>

  <h3>Slightly more bells and whistles</h3>
  <p>
    Let's look at an example with several different DOM tags.
  </p>

  ~code~

  <p>And here's what it produces:</p>

  <blockquote> ~result~ </blockquote>

  <h1>Creating an element</h1>
  <p>To create an element, like for example a <code>span</code> element, the pattern goes like this:</p>

  <pre><code>mySpanWithAttrs = D.span attrs children
mySpanWithNoAttrs = D.span_ children
myDivWithNoChildren = D.div attrs blank
</code></pre>

  <p><code>attrs</code> contains attributes of type <code>Event (Attribute element)</code>, where <code>element</code> is the current element you're assigning attributes to. You never have to specify this type: it is inferred automatically by the attribute creation operator, aka <code>:=</code>. If you use an attribute that's unsupported by an element, the compiler will complain.</p>

  <p>For now, children is an array of children, not unlike Halogen or React sans JSX. We'll see some other types of children later in this guide.</p>

  <h1>Attributes</h1>
  <p>Attributes like an element's style or id are specified as the first argument to an element. Attributes are just <a href="https://github.com/mikesol/purescript-event/blob/master/src/FRP/Event.purs"><code>Event</code>-s</a>, so you can <code>bang</code> them to make them happen <i>now</i>, combine two event streams with <code>alt</code> to compose events, etc.</p>

  <p>As an example, we made the input a range slider using <code>bang (Xtype := "range")</code>. Unlike Halogen, there are no checks to make sure you give a valid string. So if you want your range slider to have the value of true, you can. One day, I may build some validators, but passing strings works decently well here.</p>

  <h2>Next steps</h2>
  <p>In this section, we built a simple component. In the next section, we'll recreate the exact same element using a different input syntax called <a ~next~ style="cursor:pointer;">Pursx</a>.</p>
</div>`}})()()(zn()(Rt()(zn()(Mt(t.MonadST5().Monad0().Applicative0()))({reflectType:function(){return"result"}})({reflectSymbol:function(){return"result"}})(t))({reflectType:function(){return"next"}})({reflectSymbol:function(){return"next"}})(t))({reflectType:function(){return"code"}})({reflectSymbol:function(){return"code"}})(t))(t)(Kb)({code:qn(Ft(t)([Et(t)([wn(t.MonadST5().Monad0())(`module Main where

import Prelude

import Deku.Attribute ((:=))
import Deku.Control (text_)
import Deku.DOM as D
import Deku.Toplevel (runInBodyA)
import Effect (Effect)
import FRP.Event.Class (bang)

main :: Effect Unit
main = runInBodyA
  ( [ D.button_ [ text_ "I do nothing" ]
    , D.ul_ $ map (D.li_ <<< pure <<< text_) [ "A", "B", "C" ]
    , D.div_
        [ D.a (bang $ D.Href := "https://example.com")
            [ text_ "foo " ]
        , D.i_ [ text_ " bar " ]
        , D.span (bang $ D.Style := "font-weight: 800;")
            [ text_ " baz" ]
        ]
    , D.div_
        [ D.div_
            [ D.div_ [ D.input (bang $ D.Xtype := "range") [] ]
            ]
        ]
    ]
  )`)])])),result:qn(Nn(t)([xp(t)([wn(t.MonadST5().Monad0())("I do nothing")]),Lp(t)(s(ot)(function(){var r=Ap(t),e=y(So),a=wn(t.MonadST5().Monad0());return function(u){return r(e(a(u)))}}())(["A","B","C"])),Nn(t)([Li(t)($(t.MonadST5().Monad0().Applicative0())(on(Fp)(Ep.value)("https://example.com")))([wn(t.MonadST5().Monad0())("foo ")]),wp(t)([wn(t.MonadST5().Monad0())(" bar ")]),xa(t)($(t.MonadST5().Monad0().Applicative0())(on(mo)(rr.value)("font-weight: 800;")))([wn(t.MonadST5().Monad0())(" baz")])]),Nn(t)([Nn(t)([Nn(t)([ra(t)($(t.MonadST5().Monad0().Applicative0())(on(Si)(vo.value)("range")))([])])])])])),next:$(t.MonadST5().Monad0().Applicative0())(on(st)(Kn.value)(Qn(E(Tn(Nt)(n(cu.value))(Vt)))))})}};function $p(n,t,r,e,a){return function(u,c){var l=n.newXHR(),_=n.fixupUrl(a.url,l);if(l.open(a.method||"GET",_,!0,a.username,a.password),a.headers)try{for(var f=0,i;(i=a.headers[f])!=null;f++)l.setRequestHeader(i.field,i.value)}catch(m){u(m)}var d=function(m){return function(){u(new Error(m))}};return l.onerror=d(r),l.ontimeout=d(t),l.onload=function(){c({status:l.status,statusText:l.statusText,headers:l.getAllResponseHeaders().split(`\r
`).filter(function(m){return m.length>0}).map(function(m){var o=m.indexOf(":");return e(m.substring(0,o))(m.substring(o+2))}),body:l.response})},l.responseType=a.responseType,l.withCredentials=a.withCredentials,l.timeout=a.timeout,l.send(a.content),function(m,o,p){try{l.abort()}catch(B){return o(B)}return p()}}}var Ni="application/json",Pp="application/x-www-form-urlencoded";var Rp=function(){function n(t){this.value0=t}return n.create=function(t){return new n(t)},n}(),kp=function(){function n(t){this.value0=t}return n.create=function(t){return new n(t)},n}(),Op=function(){function n(t){this.value0=t}return n.create=function(t){return new n(t)},n}(),Wp=function(){function n(t){this.value0=t}return n.create=function(t){return new n(t)},n}(),Up=function(){function n(t){this.value0=t}return n.create=function(t){return new n(t)},n}(),Hc=function(){function n(t){this.value0=t}return n.create=function(t){return new n(t)},n}(),Bc=function(){function n(t){this.value0=t}return n.create=function(t){return new n(t)},n}(),Hp=function(n){return n instanceof Hc?new v(Pp):n instanceof Bc?new v(Ni):D.value};var Ri=function(){function n(t){this.value0=t}return n.create=function(t){return new n(t)},n}(),ki=function(){function n(t){this.value0=t}return n.create=function(t){return new n(t)},n}(),Bp=function(){function n(t,r){this.value0=t,this.value1=r}return n.create=function(t){return function(r){return new n(t,r)}},n}(),qp=function(n){if(n instanceof Ri)return pt()(n.value0);if(n instanceof ki)return pt()(n.value0);if(n instanceof Bp)return n.value1;throw new Error("Failed pattern match at Affjax.RequestHeader (line 26, column 1 - line 26, column 33): "+[n.constructor.name])};var qc=function(n){if(n instanceof Ri)return"Accept";if(n instanceof ki)return"Content-Type";if(n instanceof Bp)return n.value0;throw new Error("Failed pattern match at Affjax.RequestHeader (line 21, column 1 - line 21, column 32): "+[n.constructor.name])};var zc=function(){function n(t){this.value0=t}return n.create=function(t){return new n(t)},n}(),Vc=function(){function n(t){this.value0=t}return n.create=function(t){return new n(t)},n}(),Jc=function(){function n(t){this.value0=t}return n.create=function(t){return new n(t)},n}(),du=function(){function n(t){this.value0=t}return n.create=function(t){return new n(t)},n}(),jc=function(){function n(t){this.value0=t}return n.create=function(t){return new n(t)},n}(),Oi=function(){function n(t){this.value0=t}return n.create=function(t){return new n(t)},n}(),zp=function(n){if(n instanceof zc)return"arraybuffer";if(n instanceof Vc)return"blob";if(n instanceof Jc)return"document";if(n instanceof du||n instanceof jc)return"text";if(n instanceof Oi)return"";throw new Error("Failed pattern match at Affjax.ResponseFormat (line 44, column 3 - line 50, column 19): "+[n.constructor.name])},Vp=function(n){return n instanceof du?new v(Ni):D.value};var Jp=function(){return new du(Q(V))}(),jp=function(){return new Oi(Q(V))}();var Xp=function(){function n(t,r){this.value0=t,this.value1=r}return n.create=function(t){return function(r){return new n(t,r)}},n}();function Du(n){return n.message}var ee=function(n){return n.throwError};var Pe=function(n){return n.catchError};var Wi=function(n){return function(t){return Pe(n)(s(n.MonadThrow0().Monad0().Bind1().Apply0().Functor0())(P.create)(t))(function(){var r=y(n.MonadThrow0().Monad0().Applicative0());return function(e){return r(O.create(e))}}())}};var de=function(n){return n.state};var Do=function(n){return function(t){return de(n)(function(r){var e=t(r);return new F(e,e)})}};var ae=function(n){return n.liftEffect};var Qc=function(n){return n};var Yc=function(n){return n};var zi=function(n){return function(t){return n(t)}},Zp=function(n){return{map:function(t){return zi(s(n)(s(Oa)(t)))}}};var Zc=function(n){return{Applicative0:function(){return La(n)},Bind1:function(){return Kc(n)}}},Kc=function(n){return{bind:function(t){return function(r){return b(n.Bind1())(t)(Or(function(){var e=y(n.Applicative0());return function(a){return e(O.create(a))}}())(function(e){var a=r(e);return a}))}},Apply0:function(){return Kp(n)}}},Kp=function(n){return{apply:Ur(Zc(n)),Functor0:function(){return Zp(n.Bind1().Apply0().Functor0())}}},La=function(n){return{pure:function(){var t=y(n.Applicative0());return function(r){return Qc(t(P.create(r)))}}(),Apply0:function(){return Kp(n)}}};var nm=function(n){return{throwError:function(){var t=y(n.Applicative0());return function(r){return Qc(t(O.create(r)))}}(),Monad0:function(){return Zc(n)}}};var nl=function(n){return function(t){return{alt:function(r){return function(e){return b(t.Bind1())(r)(function(a){if(a instanceof P)return y(t.Applicative0())(new P(a.value0));if(a instanceof O)return b(t.Bind1())(e)(function(u){if(u instanceof P)return y(t.Applicative0())(new P(u.value0));if(u instanceof O)return y(t.Applicative0())(new O(A(n)(a.value0)(u.value0)));throw new Error("Failed pattern match at Control.Monad.Except.Trans (line 86, column 9 - line 88, column 49): "+[u.constructor.name])});throw new Error("Failed pattern match at Control.Monad.Except.Trans (line 82, column 5 - line 88, column 49): "+[a.constructor.name])})}},Functor0:function(){return Zp(t.Bind1().Apply0().Functor0())}}}};var tm=function(){var n=pt();return function(t){return n(Yc(t))}}();function tl(n){return JSON.stringify(n)}function rl(n){return function(t){return JSON.stringify(t,null,n)}}var rm=na;function am(n,t,r){try{return t(JSON.parse(r))}catch(e){return n(e.message)}}var om=function(n){return am(O.create,P.create,n)};var el=function(n){return function(t){return t.join(n)}};function DT(n){return n.replace(/[!'()*]/g,function(t){return"%"+t.charCodeAt(0).toString(16)})}var fm=function(t,r,e){try{return r(DT(encodeURIComponent(e)).replace(/%20/g,"+"))}catch(a){return t(a)}};var ji=function(){return Qf(fm)(E(D.value))(v.create)}();var bT=function(n){return n};var cm=function(){var n=function(e){if(e.value1 instanceof D)return ji(e.value0);if(e.value1 instanceof v)return bn(la)(s(et)(function(a){return function(u){return a+("="+u)}})(ji(e.value0)))(ji(e.value1.value0));throw new Error("Failed pattern match at Data.FormURLEncoded (line 37, column 16 - line 39, column 114): "+[e.constructor.name])},t=s(et)(el("&")),r=er(Ve)(qe)(n);return function(e){return t(r(bT(e)))}}();var CT=function(){function n(){}return n.value=new n,n}(),hu=function(){function n(){}return n.value=new n,n}(),hT=function(){function n(){}return n.value=new n,n}(),lm=function(){function n(){}return n.value=new n,n}(),sm=function(){function n(){}return n.value=new n,n}(),_m=function(){function n(){}return n.value=new n,n}(),ET=function(){function n(){}return n.value=new n,n}(),FT=function(){function n(){}return n.value=new n,n}(),MT=function(){function n(){}return n.value=new n,n}(),xT=function(){function n(){}return n.value=new n,n}(),wT=function(){function n(){}return n.value=new n,n}(),AT=function(){function n(){}return n.value=new n,n}(),LT=function(){function n(){}return n.value=new n,n}(),IT=function(){function n(){}return n.value=new n,n}(),ST=function(){function n(){}return n.value=new n,n}(),pm=function(){function n(){}return n.value=new n,n}();var $T=function(n){return n},PT={show:function(n){if(n instanceof CT)return"OPTIONS";if(n instanceof hu)return"GET";if(n instanceof hT)return"HEAD";if(n instanceof lm)return"POST";if(n instanceof sm)return"PUT";if(n instanceof _m)return"DELETE";if(n instanceof ET)return"TRACE";if(n instanceof FT)return"CONNECT";if(n instanceof MT)return"PROPFIND";if(n instanceof xT)return"PROPPATCH";if(n instanceof wT)return"MKCOL";if(n instanceof AT)return"COPY";if(n instanceof LT)return"MOVE";if(n instanceof IT)return"LOCK";if(n instanceof ST)return"UNLOCK";if(n instanceof pm)return"PATCH";throw new Error("Failed pattern match at Data.HTTP.Method (line 43, column 1 - line 59, column 23): "+[n.constructor.name])}};var mm=Or(k(PT))($T);var Dm=function(){var n=ti(Gf);return function(t){return ri(n(t))}}();var ym=function(n){return n.value0};function bm(n,t,r){return n==null?t:r(n)}function ol(n){return n}var go=Zn(null)(ol),kt=function(n){return bm(n,D.value,v.create)};var br=function(){var n={},t="Pure",r="Throw",e="Catch",a="Sync",u="Async",c="Bind",l="Bracket",_="Fork",f="Sequential",i="Map",d="Apply",m="Alt",o="Cons",p="Resume",B="Release",Un="Finalizer",Gt="Finalized",Rn="Forked",Br="Fiber",sr="Thunk";function W(S,Sn,mt,Hn){this.tag=S,this._1=Sn,this._2=mt,this._3=Hn}function Xt(S){var Sn=function(mt,Hn,q){return new W(S,mt,Hn,q)};return Sn.tag=S,Sn}function To(S){return new W(t,void 0)}function yd(S){try{S()}catch(Sn){setTimeout(function(){throw Sn},0)}}function gd(S,Sn,mt){try{return Sn(mt())}catch(Hn){return S(Hn)}}function bd(S,Sn,mt){try{return Sn(mt)()}catch(Hn){return mt(S(Hn))(),To}}var Lu=function(){var S=1024,Sn=0,mt=0,Hn=new Array(S),q=!1;function w(){var kn;for(q=!0;Sn!==0;)Sn--,kn=Hn[mt],Hn[mt]=void 0,mt=(mt+1)%S,kn();q=!1}return{isDraining:function(){return q},enqueue:function(kn){var Dn,_t;Sn===S&&(_t=q,w(),q=_t),Hn[(mt+Sn)%S]=kn,Sn++,q||w()}}}();function Td(S){var Sn={},mt=0,Hn=0;return{register:function(q){var w=mt++;q.onComplete({rethrow:!0,handler:function(kn){return function(){Hn--,delete Sn[w]}}})(),Sn[w]=q,Hn++},isEmpty:function(){return Hn===0},killAll:function(q,w){return function(){if(Hn===0)return w();var kn=0,Dn={};function _t(jn){Dn[jn]=Sn[jn].kill(q,function(gt){return function(){delete Dn[jn],kn--,S.isLeft(gt)&&S.fromLeft(gt)&&setTimeout(function(){throw S.fromLeft(gt)},0),kn===0&&w()}})()}for(var Wt in Sn)Sn.hasOwnProperty(Wt)&&(kn++,_t(Wt));return Sn={},mt=0,Hn=0,function(jn){return new W(a,function(){for(var gt in Dn)Dn.hasOwnProperty(gt)&&Dn[gt]()})}}}}}var Sa=0,_r=1,Iu=2,Su=3,$u=4,Tr=5,Co=6;function vf(S,Sn,mt){var Hn=0,q=Sa,w=mt,kn=null,Dn=null,_t=null,Wt=null,jn=null,gt=0,ia=0,Lr=null,ke=!0;function Oe(z){for(var J,Fn,Ln;;)switch(J=null,Fn=null,Ln=null,q){case Iu:q=_r;try{w=_t(w),Wt===null?_t=null:(_t=Wt._1,Wt=Wt._2)}catch(Jt){q=Tr,kn=S.left(Jt),w=null}break;case Su:S.isLeft(w)?(q=Tr,kn=w,w=null):_t===null?q=Tr:(q=Iu,w=S.fromRight(w));break;case _r:switch(w.tag){case c:_t&&(Wt=new W(o,_t,Wt)),_t=w._2,q=_r,w=w._1;break;case t:_t===null?(q=Tr,w=S.right(w._1)):(q=Iu,w=w._1);break;case a:q=Su,w=gd(S.left,S.right,w._1);break;case u:q=$u,w=bd(S.left,w._1,function(Jt){return function(){Hn===z&&(Hn++,Lu.enqueue(function(){Hn===z+1&&(q=Su,w=Jt,Oe(Hn))}))}});return;case r:q=Tr,kn=S.left(w._1),w=null;break;case e:_t===null?jn=new W(o,w,jn,Dn):jn=new W(o,w,new W(o,new W(p,_t,Wt),jn,Dn),Dn),_t=null,Wt=null,q=_r,w=w._1;break;case l:gt++,_t===null?jn=new W(o,w,jn,Dn):jn=new W(o,w,new W(o,new W(p,_t,Wt),jn,Dn),Dn),_t=null,Wt=null,q=_r,w=w._1;break;case _:q=Su,J=vf(S,Sn,w._2),Sn&&Sn.register(J),w._1&&J.run(),w=S.right(J);break;case f:q=_r,w=hd(S,Sn,w._1);break}break;case Tr:if(_t=null,Wt=null,jn===null)q=Co,w=Dn||kn||w;else switch(J=jn._3,Ln=jn._1,jn=jn._2,Ln.tag){case e:Dn&&Dn!==J&&gt===0?q=Tr:kn&&(q=_r,w=Ln._2(S.fromLeft(kn)),kn=null);break;case p:Dn&&Dn!==J&&gt===0||kn?q=Tr:(_t=Ln._1,Wt=Ln._2,q=Iu,w=S.fromRight(w));break;case l:gt--,kn===null&&(Fn=S.fromRight(w),jn=new W(o,new W(B,Ln._2,Fn),jn,J),(Dn===J||gt>0)&&(q=_r,w=Ln._3(Fn)));break;case B:jn=new W(o,new W(Gt,w,kn),jn,Dn),q=_r,Dn&&Dn!==J&&gt===0?w=Ln._1.killed(S.fromLeft(Dn))(Ln._2):kn?w=Ln._1.failed(S.fromLeft(kn))(Ln._2):w=Ln._1.completed(S.fromRight(w))(Ln._2),kn=null,gt++;break;case Un:gt++,jn=new W(o,new W(Gt,w,kn),jn,Dn),q=_r,w=Ln._1;break;case Gt:gt--,q=Tr,w=Ln._1,kn=Ln._2;break}break;case Co:for(var dt in Lr)Lr.hasOwnProperty(dt)&&(ke=ke&&Lr[dt].rethrow,yd(Lr[dt].handler(w)));Lr=null,Dn&&kn?setTimeout(function(){throw S.fromLeft(kn)},0):S.isLeft(w)&&ke&&setTimeout(function(){if(ke)throw S.fromLeft(w)},0);return;case Sa:q=_r;break;case $u:return}}function vt(z){return function(){if(q===Co)return ke=ke&&z.rethrow,z.handler(w)(),function(){};var J=ia++;return Lr=Lr||{},Lr[J]=z,function(){Lr!==null&&delete Lr[J]}}}function X(z,J){return function(){if(q===Co)return J(S.right(void 0))(),function(){};var Fn=vt({rethrow:!1,handler:function(){return J(S.right(void 0))}})();switch(q){case Sa:Dn=S.left(z),q=Co,w=Dn,Oe(Hn);break;case $u:Dn===null&&(Dn=S.left(z)),gt===0&&(q===$u&&(jn=new W(o,new W(Un,w(z)),jn,Dn)),q=Tr,w=null,kn=null,Oe(++Hn));break;default:Dn===null&&(Dn=S.left(z)),gt===0&&(q=Tr,w=null,kn=null)}return Fn}}function gn(z){return function(){var J=vt({rethrow:!1,handler:z})();return q===Sa&&Oe(Hn),J}}return{kill:X,join:gn,onComplete:vt,isSuspended:function(){return q===Sa},run:function(){q===Sa&&(Lu.isDraining()?Oe(Hn):Lu.enqueue(function(){Oe(Hn)}))}}}function Cd(S,Sn,mt,Hn){var q=0,w={},kn=0,Dn={},_t=new Error("[ParAff] Early exit"),Wt=null,jn=n;function gt(vt,X,gn){var z=X,J=null,Fn=null,Ln=0,dt={},Jt,ho;n:for(;;)switch(Jt=null,z.tag){case Rn:if(z._3===n&&(Jt=w[z._1],dt[Ln++]=Jt.kill(vt,function(Ed){return function(){Ln--,Ln===0&&gn(Ed)()}})),J===null)break n;z=J._2,Fn===null?J=null:(J=Fn._1,Fn=Fn._2);break;case i:z=z._2;break;case d:case m:J&&(Fn=new W(o,J,Fn)),J=z,z=z._1;break}if(Ln===0)gn(S.right(void 0))();else for(ho=0,Jt=Ln;ho<Jt;ho++)dt[ho]=dt[ho]();return dt}function ia(vt,X,gn){var z,J,Fn,Ln,dt,Jt;S.isLeft(vt)?(z=vt,J=null):(J=vt,z=null);n:for(;;){if(Fn=null,Ln=null,dt=null,Jt=null,Wt!==null)return;if(X===null){Hn(z||J)();return}if(X._3!==n)return;switch(X.tag){case i:z===null?(X._3=S.right(X._1(S.fromRight(J))),J=X._3):X._3=z;break;case d:if(Fn=X._1._3,Ln=X._2._3,z){if(X._3=z,dt=!0,Jt=kn++,Dn[Jt]=gt(_t,z===Fn?X._2:X._1,function(){return function(){delete Dn[Jt],dt?dt=!1:gn===null?ia(z,null,null):ia(z,gn._1,gn._2)}}),dt){dt=!1;return}}else{if(Fn===n||Ln===n)return;J=S.right(S.fromRight(Fn)(S.fromRight(Ln))),X._3=J}break;case m:if(Fn=X._1._3,Ln=X._2._3,Fn===n&&S.isLeft(Ln)||Ln===n&&S.isLeft(Fn))return;if(Fn!==n&&S.isLeft(Fn)&&Ln!==n&&S.isLeft(Ln))z=J===Fn?Ln:Fn,J=null,X._3=z;else if(X._3=J,dt=!0,Jt=kn++,Dn[Jt]=gt(_t,J===Fn?X._2:X._1,function(){return function(){delete Dn[Jt],dt?dt=!1:gn===null?ia(J,null,null):ia(J,gn._1,gn._2)}}),dt){dt=!1;return}break}gn===null?X=null:(X=gn._1,gn=gn._2)}}function Lr(vt){return function(X){return function(){delete w[vt._1],vt._3=X,ia(X,vt._2._1,vt._2._2)}}}function ke(){var vt=_r,X=mt,gn=null,z=null,J,Fn;n:for(;;)switch(J=null,Fn=null,vt){case _r:switch(X.tag){case i:gn&&(z=new W(o,gn,z)),gn=new W(i,X._1,n,n),X=X._2;break;case d:gn&&(z=new W(o,gn,z)),gn=new W(d,n,X._2,n),X=X._1;break;case m:gn&&(z=new W(o,gn,z)),gn=new W(m,n,X._2,n),X=X._1;break;default:Fn=q++,vt=Tr,J=X,X=new W(Rn,Fn,new W(o,gn,z),n),J=vf(S,Sn,J),J.onComplete({rethrow:!1,handler:Lr(X)})(),w[Fn]=J,Sn&&Sn.register(J)}break;case Tr:if(gn===null)break n;gn._1===n?(gn._1=X,vt=_r,X=gn._2,gn._2=n):(gn._2=X,X=gn,z===null?gn=null:(gn=z._1,z=z._2))}for(jn=X,Fn=0;Fn<q;Fn++)w[Fn].run()}function Oe(vt,X){Wt=S.left(vt);var gn;for(var z in Dn)if(Dn.hasOwnProperty(z)){gn=Dn[z];for(z in gn)gn.hasOwnProperty(z)&&gn[z]()}Dn=null;var J=gt(vt,jn,X);return function(Fn){return new W(u,function(Ln){return function(){for(var dt in J)J.hasOwnProperty(dt)&&J[dt]();return To}})}}return ke(),function(vt){return new W(u,function(X){return function(){return Oe(vt,X)}})}}function hd(S,Sn,mt){return new W(u,function(Hn){return function(){return Cd(S,Sn,mt,Hn)}})}return W.EMPTY=n,W.Pure=Xt(t),W.Throw=Xt(r),W.Catch=Xt(e),W.Sync=Xt(a),W.Async=Xt(u),W.Bind=Xt(c),W.Bracket=Xt(l),W.Fork=Xt(_),W.Seq=Xt(f),W.ParMap=Xt(i),W.ParApply=Xt(d),W.ParAlt=Xt(m),W.Fiber=vf,W.Supervisor=Td,W.Scheduler=Lu,W.nonCanceler=To,W}(),Cm=br.Pure,hm=br.Throw;function Em(n){return function(t){return br.Catch(n,t)}}function Fm(n){return function(t){return t.tag===br.Pure.tag?br.Pure(n(t._1)):br.Bind(t,function(r){return br.Pure(n(r))})}}function Mm(n){return function(t){return br.Bind(n,t)}}var xm=br.Sync;var Eu=br.Async;function wm(n,t){return function(){return br.Fiber(n,null,t)}}var RT=function(){function n(r,e){return r===0&&typeof setImmediate<"u"?setImmediate(e):setTimeout(e,r)}function t(r,e){return r===0&&typeof clearImmediate<"u"?clearImmediate(e):clearTimeout(e)}return function(r,e){return br.Async(function(a){return function(){var u=n(e,a(r()));return function(){return br.Sync(function(){return r(t(e,u))})}}})}}(),kT=br.Seq;var ZT=function(n,t,r){var e=0,a;return function(u){if(e===2)return a;if(e===1)throw new ReferenceError(n+" was needed before it finished initializing (module "+t+", line "+u+")",t,u);return e=1,a=r(),e=2,a}};var fl={map:Fm};var KT=function(){var n=function(e){if(e instanceof P)return e.value0;if(e instanceof O)return Xr("unsafeFromRight: Left");throw new Error("Failed pattern match at Effect.Aff (line 407, column 21 - line 409, column 54): "+[e.constructor.name])},t=function(e){if(e instanceof O)return e.value0;if(e instanceof P)return Xr("unsafeFromLeft: Right");throw new Error("Failed pattern match at Effect.Aff (line 402, column 20 - line 404, column 55): "+[e.constructor.name])},r=function(e){if(e instanceof O)return!0;if(e instanceof P)return!1;throw new Error("Failed pattern match at Effect.Aff (line 397, column 12 - line 399, column 21): "+[e.constructor.name])};return{isLeft:r,fromLeft:t,fromRight:n,left:O.create,right:P.create}}(),nC=function(n){return wm(KT,n)},tC=function(n){return function(){var r=nC(n)();return r.run(),r}},$m=function(){var n=Z(xn);return function(t){return n(tC(t))}}();var cl={Applicative0:function(){return Gi},Bind1:function(){return ll}},ll={bind:Mm,Apply0:function(){return Pm(0)}},Gi={pure:Cm,Apply0:function(){return Pm(0)}},Pm=ZT("applyAff","Effect.Aff",function(){return{apply:Ur(cl),Functor0:function(){return fl}}});var sl={liftEffect:xm,Monad0:function(){return cl}};var rC={throwError:hm,Monad0:function(){return cl}},Nm={catchError:Em,MonadThrow0:function(){return rC}};var Rm=E(y(Gi)(void 0));var Hm=function(n){return Eu(function(t){return function(){var e=n(function(a){return t(O.create(a))()},function(a){return t(P.create(a))()});return function(a){return Eu(function(u){return function(){return e(a,function(l){return u(O.create(l))()},function(l){return u(P.create(l))()}),Rm}})}}})};function Xi(n){return Object.prototype.toString.call(n).slice(8,-1)}var Bm=Array.isArray||function(n){return Object.prototype.toString.call(n)==="[object Array]"};var qm=function(n){return function(t){return function(r){return(r|0)===r?n(r):t}}},lr=function(n){return n};var Qi=isFinite;var vl=Math.floor;var Fu=function(n){return function(t){return n%t}};var Yi=function(){return qm(v.create)(D.value)}(),MC=function(n){if(!Qi(n))return 0;if(n>=lr(Nr(ca)))return Nr(ca);if(n<=lr(Vr(ca)))return Vr(ca);if(Qt)return Zt(0)(Yi(n));throw new Error("Failed pattern match at Data.Int (line 72, column 1 - line 72, column 29): "+[n.constructor.name])};var Dl=function(n){return MC(vl(n))};var yl=function(){function n(t){this.value0=t}return n.create=function(t){return new n(t)},n}(),Zm=function(){function n(t,r){this.value0=t,this.value1=r}return n.create=function(t){return function(r){return new n(t,r)}},n}(),$C=function(){function n(t,r){this.value0=t,this.value1=r}return n.create=function(t){return function(r){return new n(t,r)}},n}(),PC=function(){function n(t,r){this.value0=t,this.value1=r}return n.create=function(t){return function(r){return new n(t,r)}},n}(),aa=C,NC=C;var Ki=function(n){if(n instanceof yl)return n.value0;if(n instanceof $C)return"Error at array index "+(k(kr)(n.value0)+(": "+Ki(n.value1)));if(n instanceof PC)return"Error at property "+(k(Rr)(n.value0)+(": "+Ki(n.value1)));if(n instanceof Zm)return"Type mismatch: expected "+(n.value0+(", found "+n.value1));throw new Error("Failed pattern match at Foreign (line 78, column 1 - line 78, column 45): "+[n.constructor.name])};var gl=function(n){var t=ee(nm(n));return function(r){return t(Dm(r))}};var oa=function(n){return function(t){return function(r){if(Xi(r)===t)return y(La(n))(NC(r));if(Qt)return gl(n)(new Zm(t,Xi(r)));throw new Error("Failed pattern match at Foreign (line 123, column 1 - line 123, column 104): "+[t.constructor.name,r.constructor.name])}}};var bl=function(){function n(t){this.value0=t}return n.create=function(t){return new n(t)},n}(),Tl=function(){function n(t,r){this.value0=t,this.value1=r}return n.create=function(t){return function(r){return new n(t,r)}},n}(),Cl=function(){function n(){}return n.value=new n,n}(),hl=function(){function n(){}return n.value=new n,n}(),El=function(){function n(t){this.value0=t}return n.create=function(t){return new n(t)},n}(),Km=function(n){return function(t){var r=function(i){return i===""?y(La(tt))(rm):Or(function(){var d=gl(tt);return function(m){return d(yl.create(m))}}())(y(La(tt)))(om(i))},e=function(){if(t.responseFormat instanceof zc)return oa(tt)("ArrayBuffer");if(t.responseFormat instanceof Vc)return oa(tt)("Blob");if(t.responseFormat instanceof Jc)return function(i){return U(nl(jf)(tt))(oa(tt)("Document")(i))(U(nl(jf)(tt))(oa(tt)("XMLDocument")(i))(oa(tt)("HTMLDocument")(i)))};if(t.responseFormat instanceof du)return Wu(Kc(tt))(function(i){return t.responseFormat.value0(r(i))})(oa(tt)("String"));if(t.responseFormat instanceof jc)return oa(tt)("String");if(t.responseFormat instanceof Oi)return E(t.responseFormat.value0(y(La(tt))(void 0)));throw new Error("Failed pattern match at Affjax (line 274, column 18 - line 283, column 57): "+[t.responseFormat.constructor.name])}(),a=function(i){if(i instanceof Rp)return new P(i.value0(aa));if(i instanceof kp)return new P(aa(i.value0));if(i instanceof Op)return new P(aa(i.value0));if(i instanceof Wp)return new P(aa(i.value0));if(i instanceof Up)return new P(aa(i.value0));if(i instanceof Hc)return Ef("Body contains values that cannot be encoded as application/x-www-form-urlencoded")(s(et)(aa)(cm(i.value0)));if(i instanceof Bc)return new P(aa(tl(i.value0)));throw new Error("Failed pattern match at Affjax (line 235, column 20 - line 250, column 69): "+[i.constructor.name])},u=function(i){return function(d){return i instanceof v&&!ze($n)(Kt)(df(tn(He))(qc)(i.value0))(d)?fc(d)(i.value0):d}},c=function(i){return u(s(et)(ki.create)(Te(Dr)(Hp)(i)))(u(s(et)(Ri.create)(Vp(t.responseFormat)))(t.headers))},l=function(i){return{method:mm(t.method),url:t.url,headers:s(ot)(function(d){return{field:qc(d),value:qp(d)}})(c(t.content)),content:i,responseType:zp(t.responseFormat),username:go(t.username),password:go(t.password),withCredentials:t.withCredentials,timeout:Zt(0)(s(et)(function(d){return d})(t.timeout))}},_=function(i){return qr(fl)(Wi(Nm)(Hm($p(n,"AffjaxTimeoutErrorMessageIdent","AffjaxRequestFailedMessageIdent",Xp.create,l(i)))))(function(d){if(d instanceof P){var m=tm(e(d.value0.body));if(m instanceof O)return new O(new Tl(ym(m.value0),d.value0));if(m instanceof P)return new P({body:m.value0,headers:d.value0.headers,status:d.value0.status,statusText:d.value0.statusText});throw new Error("Failed pattern match at Affjax (line 209, column 9 - line 211, column 52): "+[m.constructor.name])}if(d instanceof O)return new O(function(){var o=Du(d.value0),p=o==="AffjaxTimeoutErrorMessageIdent";if(p)return Cl.value;var B=o==="AffjaxRequestFailedMessageIdent";return B?hl.value:new El(d.value0)}());throw new Error("Failed pattern match at Affjax (line 207, column 144 - line 219, column 28): "+[d.constructor.name])})};if(t.content instanceof D)return _(go(D.value));if(t.content instanceof v){var f=a(t.content.value0);if(f instanceof P)return _(go(new v(f.value0)));if(f instanceof O)return y(Gi)(new O(new bl(f.value0)));throw new Error("Failed pattern match at Affjax (line 199, column 7 - line 203, column 48): "+[f.constructor.name])}throw new Error("Failed pattern match at Affjax (line 195, column 3 - line 203, column 48): "+[t.content.constructor.name])}},Fl=function(n){if(n instanceof bl)return"There was a problem with the request content: "+n.value0;if(n instanceof Tl)return"There was a problem with the response body: "+Ki(n.value0);if(n instanceof Cl)return"There was a problem making the request: timeout";if(n instanceof hl)return"There was a problem making the request: request failed";if(n instanceof El)return"There was a problem making the request: "+Du(n.value0);throw new Error("Failed pattern match at Affjax (line 113, column 14 - line 123, column 66): "+[n.constructor.name])},ua=function(){return{method:new O(hu.value),url:"/",headers:[],content:D.value,username:D.value,password:D.value,withCredentials:!1,responseFormat:jp,timeout:D.value}}();var Ml={newXHR:function(){return new XMLHttpRequest},fixupUrl:function(n){return n||"/"}};var tv=Km(Ml);var ev=function(){function n(){}return n.value=new n,n}(),xl=function(){function n(t){this.value0=t}return n.create=function(t){return new n(t)},n}(),WC=function(){return x.value}(),rv="Click to get some random user data.",UC=function(n){return Qn(E(function(){return n(ev.value)(),$m(b(ll)(tv({method:new O(hu.value),url:"https://randomuser.me/api/",headers:ua.headers,content:ua.content,username:ua.username,password:ua.password,withCredentials:ua.withCredentials,responseFormat:Jp,timeout:ua.timeout}))(function(r){if(r instanceof O)return ae(sl)(n(new xl("GET /api response failed to decode: "+Fl(r.value0))));if(r instanceof P)return ae(sl)(n(new xl(rl(2)(r.value0.body))));throw new Error("Failed pattern match at Deku.Example.Docs.Effects (line 41, column 9 - line 48, column 48): "+[r.constructor.name])}))()}))},av=function(n){return function(t){return At({reflectType:function(){return`<div>
  <h1>Effects</h1>

  <h2>Let's make a network call</h2>
  <p>
    This example is similar to the previous one in its design: the looping function is called in response to an event. The difference is that the response isn't immediate. Instead, we wait for the result of a network call.
  </p>

  ~code~

  <p>And here's what it produces:</p>

  <blockquote> ~result~ </blockquote>

  <h2>Arbitrary effects</h2>
  <p>Because all event listeners execute in the <code>Effect</code> monad, you can do more or less whatever you want. Make a network call, run a monad transformer stack just for fun, play music using <a href="https://github.com/mikesol/purescript-wags">purescript-wags</a>. The sky's the limit!</p>

  <p>Another useful pattern when working with effects is to throttle input. For example, if we are making a network call, we may want to show a loading indicator and prevent additional network calls. This can be achieved by setting the callback to a no-op while the network call is executing, as shown in the example above.</p>

  <h2>Next steps</h2>
  <p>It is also possible to handle events (and by extension effectful actions in events, like network calls) in Pursx. Let's see how in the <a ~next~ style="cursor:pointer;">second Pursx section</a>.</p>
</div>`}})()()(zn()(Rt()(zn()(Mt(t.MonadST5().Monad0().Applicative0()))({reflectType:function(){return"result"}})({reflectSymbol:function(){return"result"}})(t))({reflectType:function(){return"next"}})({reflectSymbol:function(){return"next"}})(t))({reflectType:function(){return"code"}})({reflectSymbol:function(){return"code"}})(t))(t)(WC)({code:qn(Ft(t)([Et(t)([wn(t.MonadST5().Monad0())(`module Main where

import Prelude

import Affjax.ResponseFormat as ResponseFormat
import Affjax.Web as AX
import Control.Alt ((<|>))
import Data.Argonaut.Core (stringifyWithIndent)
import Data.Either (Either(..))
import Data.Filterable (compact, filterMap)
import Data.HTTP.Method (Method(..))
import Data.Maybe (Maybe(..))
import Data.Profunctor (lcmap)
import Data.Tuple.Nested ((/\\))
import Deku.Attribute (Cb, cb, (:=))
import Deku.Control (text)
import Deku.DOM as D
import Deku.Toplevel (runInBody1)
import Effect (Effect)
import Effect.Aff (launchAff_)
import Effect.Class (liftEffect)
import FRP.Event (bang, bus, mapAccum)

data UIAction = Initial | Loading | Result String

clickCb :: (UIAction -> Effect Unit) -> Cb
clickCb push = cb
  ( const do
      push Loading
      launchAff_ $ do
        result <- AX.request
          ( AX.defaultRequest
              { url = "https://randomuser.me/api/"
              , method = Left GET
              , responseFormat = ResponseFormat.json
              }
          )
        case result of
          Left err -> liftEffect $ push
            $ Result
              ( "GET /api response failed to decode: " <>
                  AX.printError err
              )
          Right response -> liftEffect $ push $ Result $
            stringifyWithIndent 2 response.body
  )

clickText = "Click to get some random user data." :: String

main :: Effect Unit
main = runInBody1
  ( bus \\push -> lcmap (bang Initial <|> _)
      \\event ->
        let
          loadingOrResult = filterMap
            ( case _ of
                Loading -> Just $ Left unit
                Result s -> Just $ Right s
                _ -> Nothing
            )
            event
          loading = filterMap
            ( case _ of
                Left _ -> Just unit
                _ -> Nothing
            )
            loadingOrResult
          result = filterMap
            ( case _ of
                Right s -> Just s
                _ -> Nothing
            )
            loadingOrResult
        in
          D.div_
            [ D.div_
                [ D.button (bang (D.OnClick := clickCb push))
                    [ text
                        ( bang clickText
                            <|> (loading $> "Loading...")
                            <|> (result $> clickText)
                        )
                    ]
                ]
            , D.div
                ( (bang (D.Style := "display: none;")) <|>
                    ( compact
                        ( mapAccum
                            ( \\_ b -> (b && false) /\\
                                if b then Just unit else Nothing
                            )
                            result
                            true
                        ) $> (D.Style := "display: block;")
                    )
                )
                [ D.pre_ [ D.code_ [ text (bang "" <|> result) ] ] ]
            ]
  )
`)])])),result:qn(lo(t)(t.Always2())(function(r){return function(e){var a=ur(re(t.MonadST5().Monad0().Applicative0()))(function(l){return l instanceof ev?new v(new O(void 0)):l instanceof xl?new v(new P(l.value0)):D.value})(e),u=ur(re(t.MonadST5().Monad0().Applicative0()))(function(l){return l instanceof P?new v(l.value0):D.value})(a),c=ur(re(t.MonadST5().Monad0().Applicative0()))(function(l){return l instanceof O?new v(void 0):D.value})(a);return Nn(t)([Nn(t)([cr(t)($(t.MonadST5().Monad0().Applicative0())(on(st)(Kn.value)(UC(r))))([wr(t.MonadST5().Monad0())(U(An(t.MonadST5().Monad0().Applicative0()))($(t.MonadST5().Monad0().Applicative0())(rv))(U(An(t.MonadST5().Monad0().Applicative0()))(Ir(Xn)(c)("Loading..."))(Ir(Xn)(u)(rv))))])]),Rc(t)(U(An(t.MonadST5().Monad0().Applicative0()))($(t.MonadST5().Monad0().Applicative0())(on(Nc)(rr.value)("display: none;")))(Ir(Xn)(Ta(Zo(t.MonadST5().Monad0().Applicative0()))(Ca(Ct(t.MonadST5()))(function(l){return function(_){return new F(_&&!1,function(){return _?new v(void 0):D.value}())}})(u)(!0)))(on(Nc)(rr.value)("display: block;"))))([Ft(t)([Et(t)([wr(t.MonadST5().Monad0())(U(An(t.MonadST5().Monad0().Applicative0()))($(t.MonadST5().Monad0().Applicative0())(""))(u))])])])])}})),next:$(t.MonadST5().Monad0().Applicative0())(on(st)(Kn.value)(Qn(E(Tn(Nt)(n(lu.value))(Vt)))))})}};var nf=function(){function n(){}return n.value=new n,n}();var tf={attr:function(n){return function(t){return ct({key:"input",value:Ma(t)})}}};function uv(n){return n.target}var af=function(n){return kt(uv(n))};function wl(n){return function(){return n.value}}function Al(n){return function(){return n.valueAsNumber}}function cv(n,t,r,e){if(typeof window<"u"){var a=window[r];if(a!=null&&e instanceof a)return t(e)}for(var u=e;u!=null;){var c=Object.getPrototypeOf(u),l=c.constructor.name;if(l===r)return t(e);if(l==="Object")return n;u=c}return n}var L=function(n){return function(t){return cv(D.value,v.create,n,t)}};var of=L("HTMLInputElement");var uf=function(n){var t=U(An(n))($(n)(on(Si)(vo.value)("range"))),r=s(Xn)(function(e){return on(tf)(nf.value)(Qn(function(a){return nr(Mr)(It)(b(Dr)(af(a))(of))(Uu(ya)(Al)(e))}))});return function(e){return t(r(e))}},ff=function(n){return function(t){return function(r){return s(n)(function(){var e=on(r)(Kn.value);return function(a){return e(function(u){return u(En(t))}(a))}}())}}};var jC=function(){return x.value}(),_v=function(n){return function(t){return At({reflectType:function(){return`<div>
  <h1>Events</h1>

  <h2>Listening to the DOM</h2>
  <p>
    We'll spice up the previous example by adding an event listener to our button. When we do, Deku will keep track of how many times we clicked it. The same goes for a range slider, whose current value is displayed underneath it.
  </p>

  ~code~

  <p>And here's what it produces:</p>

  <blockquote> ~result~ </blockquote>

  <h2>Event handling</h2>
  <p>All DOM event handlers, like <code>OnClick</code> and <code>OnInput</code>, can be set with a value of type <code>Cb</code>. This type is a <code>newtype</code> around <code>(Event -> Effect Boolean)</code>. To hook the event up to the Deku event bus, you can use the <code>push</code> function within the event handler. The push function has a signature of <code>(push -> Effect Unit)</code>. Here, the type one can push in to <code>push</code> is UIEvents. Whenever a push happens, our <code>Event</code> receives it and all attributes are updated accordingly.</p>

  <h2>Next steps</h2>
  <p>In this section, saw how to react to events. In the next section, we'll use a similar mechanism to deal with arbitrary <a ~next~ style="cursor:pointer;">effects</a>.</p>
</div>`}})()()(zn()(Rt()(zn()(Mt(t.MonadST5().Monad0().Applicative0()))({reflectType:function(){return"result"}})({reflectSymbol:function(){return"result"}})(t))({reflectType:function(){return"next"}})({reflectSymbol:function(){return"next"}})(t))({reflectType:function(){return"code"}})({reflectSymbol:function(){return"code"}})(t))(t)(jC)({code:qn(Ft(t)([Et(t)([wn(t.MonadST5().Monad0())(`module Main where

import Prelude

import Control.Alt ((<|>))
import Deku.Control (text, text_)
import Deku.DOM as D
import Deku.Listeners (click_, slider)
import Deku.Toplevel (runInBody1)
import Effect (Effect)
import FRP.Event (bang, fold)
import FRP.Event.VBus (V, vbus)
import Type.Proxy (Proxy(..))

type UIEvents = V
  ( buttonClicked :: Unit
  , sliderMoved :: Number
  )

main :: Effect Unit
main = runInBody1
  ( vbus (Proxy :: _ UIEvents) \\push event -> do
      D.div_
        [ D.button
            (click_ (bang push.buttonClicked))
            [ text_ "Click" ]
        , D.div_
            [ text
                ( bang "Val: 0" <|>
                    ( append "Val: " <<< show
                        <$> fold
                          (const (add 1))
                          (bang unit <|> event.buttonClicked)
                          (-1)
                    )
                )
            ]
        , D.div_
            [ D.input
                (slider (bang push.sliderMoved))
                []
            , D.div_
                [ text
                    ( bang "Val: 50" <|>
                        ( append "Val: " <<< show
                            <$> event.sliderMoved
                        )
                    )
                ]
            ]
        ]
  )
`)])])),result:qn(Fi()(t)()(Qa({reflectSymbol:function(){return"buttonClicked"}})(Ya(Za(t.Always2())))(Qa({reflectSymbol:function(){return"sliderMoved"}})(Ya(Za(t.Always2())))(ei)()())()())(io({reflectSymbol:function(){return"buttonClicked"}})()()(io({reflectSymbol:function(){return"sliderMoved"}})()()(yi)()()()())()()()())(x.value)(function(r){return function(e){return Nn(t)([cr(t)(ff(Xn)(Pr)(po)($(t.MonadST5().Monad0().Applicative0())(r.buttonClicked)))([wn(t.MonadST5().Monad0())("Click")]),Nn(t)([wr(t.MonadST5().Monad0())(U(An(t.MonadST5().Monad0().Applicative0()))($(t.MonadST5().Monad0().Applicative0())("Val: 0"))(s(Xn)(function(){var a=A(ge)("Val: "),u=k(kr);return function(c){return a(u(c))}}())(Ye(Ct(t.MonadST5()))(E(Lt(hr)(1)))(U(An(t.MonadST5().Monad0().Applicative0()))($(t.MonadST5().Monad0().Applicative0())(void 0))(e.buttonClicked))(-1))))]),Nn(t)([ra(t)(uf(t.MonadST5().Monad0().Applicative0())($(t.MonadST5().Monad0().Applicative0())(r.sliderMoved)))([]),Nn(t)([wr(t.MonadST5().Monad0())(U(An(t.MonadST5().Monad0().Applicative0()))($(t.MonadST5().Monad0().Applicative0())("Val: 50"))(s(Xn)(function(){var a=A(ge)("Val: "),u=k(Lo);return function(c){return a(u(c))}}())(e.sliderMoved)))])])])}})),next:$(t.MonadST5().Monad0().Applicative0())(on(st)(Kn.value)(Qn(E(Tn(Nt)(n(_u.value))(Vt)))))})}};var pv=function(){function n(){}return n.value=new n,n}();var mv={attr:function(n){return function(t){return ct({key:"keyup",value:Ma(t)})}}};function Ll(n){return n.code}var vv=L("KeyboardEvent");var KC=function(){function n(){}return n.value=new n,n}(),Il=function(){function n(){}return n.value=new n,n}(),dv=function(){function n(t){this.value0=t}return n.create=function(t){return new n(t)},n}(),nh=function(){return x.value}(),Dv=function(n){return function(t){return At({reflectType:function(){return`<div>
  <h1>Events 2</h1>

  <h2>Dynamic children</h2>
  <p>
    Up until now, our DOM has been static. This is OK in some cases, but in many cases, we need a dynamic DOM: one whose elements are inserted and removed based on user interaction. In Deku, we achieve this with <code>Event</code>-s.
  </p>

  <p>
    The code below creates a todo list that allows a user to add, prioritize, and remove elements.
  </p>

  ~code~

  <p>And here's what it produces:</p>

  <blockquote> ~result~ </blockquote>

  <h2>Events of events</h2>

  <p>In the previous sections, DOM element constructors like <code>div_</code> could only accept an <code>Array</code>. They <i>also</i> can accept an event of events. In this case, the outer event represents a dynamic element, and the inner event represents the <i>stage</i> of dynamism with a data type called <code>Child</code>. <code>Child</code> has three constructors:</p>

  <ul>
    <li><code>insert</code>, which takes an element.</li>
    <li><code>sendToTop</code>, which sends the current element to the top of its parent.</li>
    <li><code>remove</code>, which removes the element from its parent.</li>
  </ul>

  <p>The Deku engine listens for these in a specific order. <code>Insert</code> can be followed by 0 or more <code>SendToTop</code>-s. When a <code>Remove</code> is called, the stream is unsubscribed from the parent. Because we're in the land of <code>Event</code>-s, you can emit anything, but this is the how they will be listened to.</p>

  <h2>Next steps</h2>
  <p>In this section, we used nested events to insert and remove elements from a parent. In the next section, we'll see how we can use <a ~next~ style="cursor:pointer;">portals to move an element to a different place of the DOM</a>.</p>
</div>`}})()()(zn()(Rt()(zn()(Mt(t.MonadST5().Monad0().Applicative0()))({reflectType:function(){return"result"}})({reflectSymbol:function(){return"result"}})(t))({reflectType:function(){return"next"}})({reflectSymbol:function(){return"next"}})(t))({reflectType:function(){return"code"}})({reflectSymbol:function(){return"code"}})(t))(t)(nh)({code:qn(Ft(t)([Et(t)([wn(t.MonadST5().Monad0())(`module Main where

import Prelude

import Control.Alt ((<|>))
import Data.Filterable (filterMap)
import Data.Foldable (for_, oneOfMap)
import Data.Maybe (Maybe(..))
import Data.Profunctor (lcmap)
import Data.Tuple.Nested ((/\\))
import Deku.Attribute (cb, (:=))
import Deku.Control (text_)
import Deku.Core (Child(..), dyn)
import Deku.DOM as D
import Deku.Toplevel (runInBody1)
import Effect (Effect)
import FRP.Event (bang, bus, keepLatest, mapAccum)
import Web.Event.Event (target)
import Web.HTML.HTMLInputElement (fromEventTarget, value)
import Web.UIEvent.KeyboardEvent (code, fromEvent)

data MainUIAction
  = UIShown
  | AddTodo
  | ChangeText String

data TodoAction = Prioritize | Delete

main :: Effect Unit
main = runInBody1
  ( bus \\push -> lcmap (bang UIShown <|> _) \\event -> do
      let
        top =
          [ D.input
              ( oneOfMap bang
                  [ D.OnInput := cb \\e -> for_
                      ( target e
                          >>= fromEventTarget
                      )
                      ( value
                          >=> push <<< ChangeText
                      )
                  , D.OnKeyup := cb
                      \\e -> for_ (fromEvent e) \\evt -> do
                        when (code evt == "Enter") $ do
                          push AddTodo
                  ]
              )
              []
          , D.button
              (bang $ D.OnClick := push AddTodo)
              [ text_ "Add" ]
          ]
      D.div_
        [ D.div_ top
        , D.div_
            [ dyn $
                map
                  ( \\txt -> keepLatest $ bus \\p' e' ->
                      ( bang $ Insert $ D.div_
                          [ text_ txt
                          , D.button
                              ( bang
                                  $ D.OnClick := p' SendToTop
                              )
                              [ text_ "Prioritize" ]
                          , D.button
                              ( bang
                                  $ D.OnClick := p' Remove
                              )
                              [ text_ "Delete" ]
                          ]
                      ) <|> e'
                  )
                  ( filterMap
                      ( \\(tf /\\ s) ->
                          if tf then Just s else Nothing
                      )
                      ( mapAccum
                          ( \\a b -> case a of
                              ChangeText s -> s /\\ (false /\\ s)
                              AddTodo -> b /\\ (true /\\ b)
                              _ -> "" /\\ (false /\\ "")
                          )
                          event
                          ""
                      )
                  )
            ]
        ]
  )
`)])])),result:qn(lo(t)(t.Always2())(function(r){return gr(ir)(function(e){return U(An(t.MonadST5().Monad0().Applicative0()))($(t.MonadST5().Monad0().Applicative0())(KC.value))(e)})(function(e){return Nn(t)([Nn(t)([ra(t)(oe($n)(dn(t.MonadST5().Monad0().Applicative0()))($(t.MonadST5().Monad0().Applicative0()))([on(Tp)(rr.value)("border-style:solid;border-width: 1px;border-color: black;"),on(tf)(nf.value)(Qn(function(a){return nr(Mr)(It)(b(Dr)(af(a))(of))(Uu(ya)(wl)(function(u){return r(dv.create(u))}))})),on(mv)(pv.value)(Qn(function(a){return nr(Mr)(It)(vv(a))(function(u){return be(Mr)(Ll(u)==="Enter")(r(Il.value))})}))]))([]),cr(t)(U(An(t.MonadST5().Monad0().Applicative0()))($(t.MonadST5().Monad0().Applicative0())(on(Ai)(rr.value)("margin: 5px;")))($(t.MonadST5().Monad0().Applicative0())(on(st)(Kn.value)(Qn(E(r(Il.value)))))))([wn(t.MonadST5().Monad0())("Add")])]),Nn(t)([Ea(s(Xn)(function(a){return uo(Ct(t.MonadST5()))(Fa(t)(t.Always2())(function(u){return function(c){return U(An(t.MonadST5().Monad0().Applicative0()))($(t.MonadST5().Monad0().Applicative0())(co(Nn(t)([xa(t)($(t.MonadST5().Monad0().Applicative0())(on(mo)(rr.value)("margin: 5px;")))([wn(t.MonadST5().Monad0())(a)]),cr(t)(U(An(t.MonadST5().Monad0().Applicative0()))($(t.MonadST5().Monad0().Applicative0())(on(Ai)(rr.value)("margin: 5px;")))($(t.MonadST5().Monad0().Applicative0())(on(st)(Kn.value)(Qn(E(u(op)))))))([wn(t.MonadST5().Monad0())("Prioritize")]),cr(t)(U(An(t.MonadST5().Monad0().Applicative0()))($(t.MonadST5().Monad0().Applicative0())(on(Ai)(rr.value)("margin: 5px;")))($(t.MonadST5().Monad0().Applicative0())(on(st)(Kn.value)(Qn(E(u(up)))))))([wn(t.MonadST5().Monad0())("Delete")])]))))(c)}}))})(ur(re(t.MonadST5().Monad0().Applicative0()))(function(a){return a.value0?new v(a.value1):D.value})(Ca(Ct(t.MonadST5()))(function(a){return function(u){return a instanceof dv?new F(a.value0,new F(!1,a.value0)):a instanceof Il?new F(u,new F(!0,u)):new F("",new F(!1,""))}})(e)(""))))])])})})),next:$(t.MonadST5().Monad0().Applicative0())(on(st)(Kn.value)(Qn(E(Tn(Nt)(n(mu.value))(Vt)))))})}};var rh=function(){return x.value}(),yv=function(n){return function(t){return At({reflectType:function(){return`<div>
  <h1>Hello world</h1>

  <h3>A small example</h3>

  <p>Here is "hello world" in Deku. In this and all the following sections, we'll start with a full example, and we'll pick it apart afterwards.</p>

  ~code~

  <p>And here's what it produces:</p>

  <blockquote> ~result~ </blockquote>

  <p>You gotta start somewhere!</p>

  <h2>Our top-level component</h2>

  <p>Deku sets up shop in an arbitrary DOM component. In the main function above, we use \u{1F680} to automatically insert our Deku tree into the body.</p>

  <h2>Next steps</h2>
  <p>Now that we have our setup running, let's make a more interesting <a ~next~ style="cursor:pointer;">component</a>.</p>
</div>`}})()()(zn()(Rt()(zn()(Mt(t.MonadST5().Monad0().Applicative0()))({reflectType:function(){return"result"}})({reflectSymbol:function(){return"result"}})(t))({reflectType:function(){return"next"}})({reflectSymbol:function(){return"next"}})(t))({reflectType:function(){return"code"}})({reflectSymbol:function(){return"code"}})(t))(t)(rh)({code:qn(Ft(t)([Et(t)([wn(t.MonadST5().Monad0())(`module Main where

import Prelude

import Deku.Control (text_)
import Deku.Toplevel (runInBody)
import Effect (Effect)

main :: Effect Unit
main = runInBody (text_ "Hello world")
`)])])),result:qn(Nn(t)([wn(t.MonadST5().Monad0())("Hello world")])),next:Ze(Ct(t.MonadST5()))(on(st)(Kn.value)(Qn(E(Tn(Nt)(n(fu.value))(Vt)))))})}};var ah=function(){return x.value}(),gv=function(n){return function(t){return At({reflectType:function(){return`<div>
  <h1>Deku</h1>

  <h3>A web micro-framework written in PureScript</h3>

  <p>Hi! You've found <a href="https://github.com/mikesol/purescript-deku">Deku</a>.</p>

  <p>Deku is the coolest web micro-framework that no one knows about yet. Except you, of course, as you're here. So welcome!</p>

  <p>The main goal of Deku is speed. I made it for the purpose of creating interactive web-based musical instruments, but it's equally useful as a general-purpose web framework. Its standard event-handling patterns tend to outperform those of React and Vue by a factor of 1.5-2x.</p>

  <p>This documentation is written in Deku and can be found <a href="https://github.com/mikesol/purescript-deku/tree/main/examples/docs">here</a>. One good way to follow along is by using the Deku starter repo, which you can clone <a href="https://github.com/mikesol/purescript-deku-starter">here</a>.</p>

  <p>And now, without further ado, check out the <a ~next~ style="cursor:pointer;">hello world section</a>!</p>
</div>`}})()()(Rt()(Mt(t.MonadST5().Monad0().Applicative0()))({reflectType:function(){return"next"}})({reflectSymbol:function(){return"next"}})(t))(t)(ah)({next:Ze(Ct(t.MonadST5()))(on(st)(Kn.value)(Qn(E(Tn(Nt)(n(iu.value))(Vt)))))})}};var bv=function(){function n(){}return n.value=new n,n}(),Tv={attr:function(n){return function(t){return ct({key:"controls",value:zt(t)})}}};var Cv=function(){function n(){}return n.value=new n,n}();var hv={attr:function(n){return function(t){return ct({key:"src",value:zt(t)})}}};var Ev=function(){function n(){}return n.value=new n,n}(),Fv={attr:function(n){return function(t){return ct({key:"width",value:zt(t)})}}};var Mv=function(n){return function(t){return function(r){return new yn(Wn(n)("source")(t)(rt(r)))}}};var xv=function(n){return function(t){return function(r){return new yn(Wn(n)("video")(t)(rt(r)))}}};var sh=function(){return x.value}(),wv=function(n){return function(t){return At({reflectType:function(){return`<div>
  <h1>Portals</h1>

  <h2>Zapping from place to place</h2>
  <p>
    Sometimes, we have referentially opaque nodes like videos or audio that we can't destroy and recreate when they need to move around the DOM. In these cases, we can use portals to "zap" nodes from one part of the DOM to another.
  </p>

  <p>
    The code below uses portals to flip two videos across a boundary. If you press play on either video, you'll see that it keeps playing uninterrupted, event when it is removed and reinserted.
  </p>

  ~code~

  <p>And here's what it produces:</p>

  <blockquote> ~result~ </blockquote>

  <h2>Events of portals</h2>

  <p>Portals work by sending a referentially-opaque reference to a DOM element into a closure where it can be safely used. Whenever an event is emitted containing the element, the element will be rendered at that place in the DOM, as in the example above. Note that portals "hog the blanket", meaning that they end up in the last place in which they were called.</p>

  <p><code>switcher</code> is a <a href="https://github.com/mikesol/purescript-deku/blob/ff3e2d2dc89b39088c5d5d6ab3492fb8730dd9a4/src/Deku/Control.purs#L325">small function</a> included in Deku to switch between different elements in an enclosure. It's how the tabs in this documentation are implemented as well.</p>

  <h2>Next steps</h2>
  <p>In this section, we used portals to move an element to different areas of the DOM. In the next section, we'll learn how to do <a ~next~ style="cursor:pointer;">static site rendering</a>.</p>
</div>`}})()()(zn()(Rt()(zn()(Mt(t.MonadST5().Monad0().Applicative0()))({reflectType:function(){return"result"}})({reflectSymbol:function(){return"result"}})(t))({reflectType:function(){return"next"}})({reflectSymbol:function(){return"next"}})(t))({reflectType:function(){return"code"}})({reflectSymbol:function(){return"code"}})(t))(t)(sh)({code:qn(Ft(t)([Et(t)([wn(t.MonadST5().Monad0())(`module Main where

import Prelude

import Control.Alt ((<|>))
import Data.Foldable (oneOfMap)
import Data.Profunctor (lcmap)
import Data.Tuple.Nested ((/\\), type (/\\))
import Data.FastVect.FastVect (index, (:))
import Data.FastVect.FastVect as V
import Deku.Attribute ((:=))
import Deku.Control (portal, switcher, text_)
import Deku.DOM as D
import Deku.Toplevel (runInBody1)
import Effect (Effect)
import FRP.Event (Event, bang, bus, fold, mapAccum)
import Type.Prelude (Proxy(..))

counter :: forall a. Event a \u2192 Event (a /\\ Int)
counter event = mapAccum f event 0
  where
  f a b = (b + 1) /\\ (a /\\ b)

main :: Effect Unit
main = runInBody1
  ( bus \\push -> lcmap  (bang unit <|> _) \\event -> do
      portal
        ( map
            ( \\i -> D.video
                (oneOfMap bang [ D.Controls := "true", D.Width := "250" ])
                [D.source
                    (oneOfMap bang [ D.Src := i, D.Xtype := "video/mp4" ])
                    []
                ]
            )
            ( "https://interactive-examples.mdn.mozilla.net/media/cc0-videos/flower.mp4"
                : "https://www.w3schools.com/jsref/movie.mp4"
                : V.empty
            )
        )
        \\v _ -> do
          let
            p0 = index (Proxy :: _ 0) v
            p1 = index (Proxy :: _ 1) v
            ev = fold (const not) event
            flips = switcher (if _ then p0 else p1) <<< ev
          D.div_
            [ D.button (bang $ D.OnClick := push unit)
                [ text_ "Switch videos" ]
            , D.div_ [ D.span_ [flips true], D.span_ [flips false] ]
            ]
  )
`)])])),result:qn(Ea(Fa(t)(t.Always2())(function(r){return gr(ir)(U(An(t.MonadST5().Monad0().Applicative0()))($(t.MonadST5().Monad0().Applicative0())(void 0)))(function(e){return $(t.MonadST5().Monad0().Applicative0())(co(gp()(t)(s(so)(function(a){return xv(t)(oe($n)(dn(t.MonadST5().Monad0().Applicative0()))($(t.MonadST5().Monad0().Applicative0()))([on(Tv)(bv.value)("true"),on(Fv)(Ev.value)("250")]))([Mv(t)(oe($n)(dn(t.MonadST5().Monad0().Applicative0()))($(t.MonadST5().Monad0().Applicative0()))([on(hv)(Cv.value)(a),on(Mp)(vo.value)("video/mp4")]))([])])})(xc()()("https://interactive-examples.mdn.mozilla.net/media/cc0-videos/flower.mp4")(xc()()("https://www.w3schools.com/jsref/movie.mp4")(sp))))(function(a){return function(u){var c=Mc()()()()()({reflectType:function(){return 1}})(x.value)(a),l=Mc()()()()()({reflectType:function(){return 0}})(x.value)(a),_=Ye(Ct(t.MonadST5()))(E(Wr(Kt)))(e),f=function(){var i=tu(t.MonadST5())(function(d){return d?l:c});return function(d){return i(_(d))}}();return Nn(t)([cr(t)($(t.MonadST5().Monad0().Applicative0())(on(st)(Kn.value)(Qn(E(r(void 0))))))([wn(t.MonadST5().Monad0())("Switch videos")]),Nn(t)([uu(t)([f(!0)]),uu(t)([f(!1)])])])}})))})}))),next:$(t.MonadST5().Monad0().Applicative0())(on(st)(Kn.value)(Qn(E(Tn(Nt)(n(vu.value))(Vt)))))})}};var ph=function(){return x.value}(),mh=function(){return x.value}(),Av=function(n){return function(t){return At({reflectType:function(){return`<div>
  <h1>PursX 1</h1>

  <h2>Like JSX... but better!</h2>

  <p>Writing out PureScript code for the DOM only really makes sense if you're doing some sort of interesting manipulations on the JS layer. Otherwise, it's pretty tedious and longer than HTML. Thankfully, there's a solution: PursX.</p>

  <p>PursX takes its name from JSX and it accomplishes a similar goal: the ability to embed HTML in your document. In the example below, we create the same exact component from the previous article, but in PursX.</p>

  ~code~

  <p>Here's what it produces:</p>

  <blockquote> ~result~ </blockquote>

  <h2>Puurrrrrr ...sx</h2>

  <p>Static Pursx (meaning Pursx without any dynamic content) can be activated with the function <code>psx</code>.</p>

  <h2>Next steps</h2>
  <p>In this section, we used PursX to build the same component as the previous section. In the next section, we'll learn how to respond to <a ~next~ style="cursor:pointer;">events</a>.</p>
</div>`}})()()(zn()(Rt()(zn()(Mt(t.MonadST5().Monad0().Applicative0()))({reflectType:function(){return"result"}})({reflectSymbol:function(){return"result"}})(t))({reflectType:function(){return"next"}})({reflectSymbol:function(){return"next"}})(t))({reflectType:function(){return"code"}})({reflectSymbol:function(){return"code"}})(t))(t)(ph)({code:qn(Ft(t)([Et(t)([wn(t.MonadST5().Monad0())(`module Main where

import Prelude

import Deku.Pursx (psx)
import Deku.Toplevel (runInBody)
import Effect (Effect)
import FRP.Event (bang)
import Type.Proxy (Proxy(..))

myDom = Proxy :: Proxy """<div>
    <button>I do nothing</button>
    <ul>
        <li>A</li>
        <li>B</li>
        <li>C</li>
    </ul>
    <div>
        <a href="https://github.com/mikesol/purescript-deku"></a>
        <i>bar</i>
        <span style="font-weight:800;">baz</span>
    </div>
    <div><div></div><div><input type="range"/></div></div>
    </div>
"""

main :: Effect Unit
main = runInBody (psx myDom)
`)])])),result:qn(Ip({reflectType:function(){return`<div>
    <button>I do nothing</button>
    <ul>
        <li>A</li>
        <li>B</li>
        <li>C</li>
    </ul>
    <div>
        <a href="https://example.com">foo</a>
        <i>bar</i>
        <span style="font-weight:800;">baz</span>
    </div>
    <div><div></div><div><input type="range"/></div></div>
    </div>
`}})()(t)(Mt(t.MonadST5().Monad0().Applicative0()))(mh)),next:Ze(Ct(t.MonadST5()))(on(st)(Kn.value)(Qn(E(Tn(Nt)(n(su.value))(Vt)))))})}};var dh=function(){return x.value}(),Dh=function(){return x.value}(),Lv=function(n){return function(t){return Uc({reflectType:function(){return`<div>
  <h1>Pursx 2</h1>

  <h2>Working with events and effects</h2>
  <p>
    PursX would be of limited utility if it could only render static content. In this section, we'll see how to make it dynamic, both by modifying existing elements and inserting entirely new ones.
  </p>

  <p>The example below is the same one from the Pursx 1 section with two differences. The first is that the background color of the second list item is set dynamically. The second is that there is a new button that is dynamically inserted.
  </p>

  ?code?

  <p>And here's what it produces:</p>

  <blockquote> ?result? </blockquote>

  <h2>Dynamism in static content</h2>
  <p>Named slots for dynamic content are added to PursX with between two tildes, like <code>~foo~</code>. This separator doesn't have to be a tilde - it can be set programatically as well (see the Deku/Pursx.purs module for an example of how that is done). Also, we no longer use the <code>psx</code> command. Instead, we use the infix operator <code>~~</code> followed by arguments to our template. In the case of dynamic attributes, the argument is a stream of attributes. In the case of a dynamic section, the arguments are of type <code>Element</code>.</p>

  <h2>Next steps</h2>
  <p>In more complicated apps, like this documentation, we'll need dynamic logic that allows for components to replace each other, for example in a navigation bar. In the next section, we'll see one way to do this by using <a ?next? style="cursor:pointer;">events to control the presence and absence of elements</a>.</p>
</div>`}})({reflectType:function(){return"?"}})()()(t)(zn()(Rt()(zn()(Mt(t.MonadST5().Monad0().Applicative0()))({reflectType:function(){return"result"}})({reflectSymbol:function(){return"result"}})(t))({reflectType:function(){return"next"}})({reflectSymbol:function(){return"next"}})(t))({reflectType:function(){return"code"}})({reflectSymbol:function(){return"code"}})(t))(x.value)(dh)({code:qn(Ft(t)([Et(t)([wn(t.MonadST5().Monad0())(`module Main where

import Prelude

import Control.Alt ((<|>))
import Data.Compactable (compact)
import Data.Maybe (Maybe(..))
import Deku.Attribute (cb, (:=))
import Deku.Control (text)
import Deku.DOM as D
import Deku.Pursx (nut, (~~))
import Deku.Toplevel (runInBody1)
import Effect (Effect)
import FRP.Event (bus, bang)
import Type.Proxy (Proxy(..))

myDom =
  Proxy :: Proxy """<div>
        <button>I do nothing</button>
        <ul>
          <li>A</li>
          <li ~myli~>B</li>
          <li>C</li>
        </ul>
        <div>
          <a href="https://github.com/mikesol/purescript-deku"></a>
          <i>bar</i>
          ~somethingNew~
          <span style="font-weight:800;">baz</span>
        </div>
        <div><div></div><div><input type="range"/></div></div>
      </div>
"""

main :: Effect Unit
main = runInBody1
  ( bus \\push event -> myDom ~~
      { myli: bang (D.Style := "background-color:rgb(200,240,210);")
      , somethingNew: nut
          ( D.button (bang (D.OnClick := push (Just unit)))
              [ text
                  $ (compact event $> "Thanks for clicking me!") <|>
                    bang "I was dynamically inserted"
              ]
          )
      }
  )`)])])),result:qn(Ea(Fa(t)(t.Always2())(function(r){return function(e){return $(t.MonadST5().Monad0().Applicative0())(co(At({reflectType:function(){return`<div>
        <button>I do nothing</button>
        <ul>
          <li>A</li>
          <li ~myli~>B</li>
          <li>C</li>
        </ul>
        <div>
          <a href="https://github.com/mikesol/purescript-deku"></a>
          <i>bar</i>
          ~somethingNew~
          <span style="font-weight:800;">baz</span>
        </div>
        <div><div></div><div><input type="range"/></div></div>
      </div>
`}})()()(Rt()(zn()(Mt(t.MonadST5().Monad0().Applicative0()))({reflectType:function(){return"somethingNew"}})({reflectSymbol:function(){return"somethingNew"}})(t))({reflectType:function(){return"myli"}})({reflectSymbol:function(){return"myli"}})(t))(t)(Dh)({myli:$(t.MonadST5().Monad0().Applicative0())(on(bp)(rr.value)("background-color:rgb(200,240,210);")),somethingNew:qn(cr(t)($(t.MonadST5().Monad0().Applicative0())(on(po)(Kn.value)(r(new v(void 0)))))([wr(t.MonadST5().Monad0())(U(An(t.MonadST5().Monad0().Applicative0()))(Ir(Xn)(Ta(Zo(t.MonadST5().Monad0().Applicative0()))(e))("Thanks for clicking me!"))($(t.MonadST5().Monad0().Applicative0())("I was dynamically inserted")))]))})))}}))),next:$(t.MonadST5().Monad0().Applicative0())(on(st)(Kn.value)(Qn(E(Tn(Nt)(n(pu.value))(Vt)))))})}};var gh=function(n){return function(t){return function(r){return new yn(Wn(n)("p")(t)(rt(r)))}}},Iv=function(n){return gh(n)(cn(dn(n.MonadST5().Monad0().Applicative0())))};var Sl=(n,t,r,e)=>{n(a=>e.units[a].main.appendChild(e.units[t].main))(r)},Sv=n=>t=>r=>e=>()=>{var a,u=r.id;e.scopes[r.scope]||(e.scopes[r.scope]=[]),e.scopes[r.scope].push(u),n&&r.parent.value0&&(a=document.body.querySelectorAll("[data-deku-ssr-"+u+"]").item(0))?e.units[u]={listeners:{},parent:r.parent,scope:r.scope,main:a}:(e.units[u]={listeners:{},parent:r.parent,scope:r.scope,main:document.createElement(r.tag)},Sl(t,u,r.parent,e))},$v=n=>t=>r=>e=>()=>{var a=r.id,u;e.scopes[r.scope]||(e.scopes[r.scope]=[]),e.scopes[r.scope].push(a),n&&r.parent.value0&&(u=document.body.querySelectorAll("[data-deku-ssr-"+r.parent.value0+"]").item(0))?e.units[a]={main:u.childNodes[0],parent:r.parent,scope:r.scope}:(e.units[a]={main:document.createTextNode(""),parent:r.parent,scope:r.scope},Sl(t,a,r.parent,e))};function $l(){return{units:{},scopes:{}}}var Pv=n=>t=>r=>()=>{var e=t.id,a=t.value;n&&!r.units[e]&&(dom=document.body.querySelectorAll("[data-deku-ssr-"+e+"]").item(0))&&(r.units[e]={listeners:{},parent:t.parent,scope:t.scope,main:dom},r.scopes[t.scope]||(r.scopes[t.scope]=[]),r.scopes[t.scope].push(e)),r.units[e].main.tagName==="INPUT"&&t.key==="value"?r.units[e].main.value=a:r.units[e].main.tagName==="INPUT"&&t.key==="checked"?r.units[e].main.checked=a==="true":r.units[e].main.setAttribute(t.key,a)},Nv=n=>t=>r=>()=>{var e=t.id,a=t.value;if(n&&!r.units[e]&&(dom=document.body.querySelectorAll("[data-deku-ssr-"+e+"]").item(0))&&(r.units[e]={listeners:{},parent:t.parent,scope:t.scope,main:dom},r.scopes[t.scope]||(r.scopes[t.scope]=[]),r.scopes[t.scope].push(e)),t.key==="@self@")a(r.units[e].main)();else{r.units[e].listeners[t.key]&&r.units[e].main.removeEventListener(t.key,r.units[e].listeners[t.key]);var u=c=>a(c)();r.units[e].main.addEventListener(t.key,u),r.units[e].listeners[t.key]=u}},Rv=n=>t=>()=>{var r=n.id;t.units[r].main.nodeValue=n.text},kv=n=>t=>r=>e=>()=>{var a,u,c=r.id,l=r.html,_=r.verb,f=r.cache,i=r.parent,d=r.scope,m=r.pxScope;if(n&&r.parent.value0&&(a=document.body.querySelectorAll("[data-deku-ssr-"+c+"]").item(0)))e.units[c]={listeners:{},scope:d,parent:i,main:a};else{let p=Object.entries(f);for(var o=0;o<p.length;o++){let B=p[o][0];p[o][1]===!0?l=l.replace(_+B+_,'data-deku-attr-internal="'+B+'"'):l=l.replace(_+B+_,'<span style="display:contents;" data-deku-elt-internal="'+B+'"></span>')}u=document.createElement("div"),u.innerHTML=l.trim(),e.units[c]={listeners:{},scope:d,parent:i,main:u.firstChild}}e.scopes[d]||(e.scopes[d]=[]),e.scopes[d].push(c),u||(u=a),u.querySelectorAll("[data-deku-attr-internal]").forEach(function(p){var B=p.getAttribute("data-deku-attr-internal");let Un=B+m;e.units[Un]={listeners:{},main:p,scope:d},e.scopes[d].push(Un)}),u.querySelectorAll("[data-deku-elt-internal]").forEach(function(p){var B=p.getAttribute("data-deku-elt-internal");let Un=B+m;e.units[B+m]={listeners:{},main:p,scope:d},e.scopes[d].push(Un)}),a||Sl(t,c,i,e)},Ov=n=>t=>()=>{var r=n.id;t.units[r]={main:n.root}},Wv=n=>t=>()=>{var r=n.id,e=n.parent;t.units[r].containingScope=n.scope,t.units[e].main.prepend(t.units[r].main)},Uv=n=>t=>()=>{var r=n.id;t.units[r].noop||t.units[r].containingScope&&!n.scopeEq(t.units[r].containingScope)(n.scope)||t.units[r].main.remove()},Hv=n=>t=>()=>{delete t.units[n.id]},Bv=n=>t=>()=>{var r=n.id;t.units[r].main.parentNode.prepend(t.units[r].main)};var qv=function(n){return n};var Fh=1,Pl=2147483647,Mh=function(){return Pl-1|0}(),Nl=function(n){var t=function(r){return function(e){return function(a){var u=e-r|0,c=Pu(bf)(a)(u),l=c<r;return l?c+e|0:c}}};return t(Fh)(Mh)(n)};var xh=0,wh=48271,zv=function(n){return function(t){return dr()(Yi(Fu(lr(wh)*lr(t)+lr(n))(lr(Pl))))}},Vv=zv(xh);var Nh=function(){function n(c){this.fn=c}var t={},r=function(c,l){this.head=c,this.tail=l};function e(c){return new r(c,t)}function a(c){return function(l){return new r(c,l)}}function u(c){for(var l=[],_=c;_!==t;)l.push(_.head),_=_.tail;return l}return function(c){return function(l){return function(_){var f=function(d,m){return c(l(a)(_(d)))(m)},i=function(d,m,o){if(m===0)return d;var p=o[m-1];return new n(function(){var B=i(f(p,d),m-1,o);return B})};return function(d){for(var m=l(e)(_(d[d.length-1])),o=i(m,d.length-1,d);o instanceof n;)o=o.fn();return l(u)(o)}}}}}();var bo=function(n){return{map:function(t){return function(r){return function(e){return s(n)(function(a){return new F(t(a.value0),a.value1)})(r(e))}}}}};var Ol=function(n){return{Applicative0:function(){return Ia(n)},Bind1:function(){return cf(n)}}},cf=function(n){return{bind:function(t){return function(r){return function(e){return b(n.Bind1())(t(e))(function(a){var u=r(a.value0);return u(a.value1)})}}},Apply0:function(){return lf(n)}}},lf=function(n){return{apply:Ur(Ol(n)),Functor0:function(){return bo(n.Bind1().Apply0().Functor0())}}},Ia=function(n){return{pure:function(t){return function(r){return y(n.Applicative0())(new F(t,r))}},Apply0:function(){return lf(n)}}};var xu=function(n){return{state:function(t){var r=y(n.Applicative0());return function(e){return r(t(e))}},Monad0:function(){return Ol(n)}}};var Kv=function(n){return function(t){var r=n(t);return r.value1}},nd=function(n){return function(t){var r=n(t);return r.value0}};var Yh=function(n){return n};var Zh=function(){var n=function(t){return new F(qv(t.newSeed),function(){var r={};for(var e in t)({}).hasOwnProperty.call(t,e)&&(r[e]=t[e]);return r.newSeed=Vv(t.newSeed),r}())};return de(xu(tt))(n)}();var wu=bo(ie);var Ul=function(n){return nd(Yh(n))};var ed=lf(tt),rd=function(n){return function(t){var r=lr(t),e=lr(n),a=function(l){return e+Fu(l)(r-e+1)},u=s(wu)(lr)(Zh),c=bn(ed)(s(wu)(Lt(Eo))(u))(s(wu)(zr(Eo)(2))(u));return s(wu)(function(l){return Dl(a(l))})(c)}},ad=function(n){return function(t){var r=n<=t;return r?rd(n)(t):rd(t)(n)}};var Hl=function(n){return n.arbitrary};var Bl=function(){return{arbitrary:ad(-1e6)(1e6)}}();var sf=function(){function n(t){this.value0=t}return n.create=function(t){return new n(t)},n}(),_f=function(){function n(t){this.value0=t}return n.create=function(t){return new n(t)},n}(),pf=function(){function n(t){this.value0=t}return n.create=function(t){return new n(t)},n}(),mf=function(){function n(t){this.value0=t}return n.create=function(t){return new n(t)},n}(),Au=function(){function n(t){this.value0=t}return n.create=function(t){return new n(t)},n}(),n0=function(n){return function(t){return Z(yt)(Bt(function(r){return A(bt)(r)([new Au(n)])})(t))}},t0=function(n){return function(t){return Z(yt)(Bt(function(r){return A(bt)(r)([new mf(n)])})(t))}},r0=function(n){return function(t){return Z(yt)(Bt(function(r){return A(bt)(r)([new _f(n)])})(t))}},e0=function(n){return function(t){return Z(yt)(Bt(function(r){return A(bt)(r)([new pf(n)])})(t))}},a0=function(n){return function(t){return Z(yt)(Bt(function(r){return A(bt)(r)([new sf(n)])})(t))}},ud=function(n){return{ids:function(){var r=Dt(n)(),e=k(kr)(Ul(Hl(Bl))({newSeed:Nl(r),size:5}));return Z(yt)(Bt(Lt(hr)(1))(n))(),e},makeElement:a0,makeRoot:function(t){return function(r){return y(or)(void 0)}},makeText:r0,makePursx:e0,setProp:t0,setCb:function(t){return function(r){return y(or)(void 0)}},setText:n0,sendToTop:function(t){return function(r){return y(or)(void 0)}},deleteFromCache:function(t){return function(r){return y(or)(void 0)}},giveNewParent:function(t){return function(r){return y(or)(void 0)}},disconnectElement:function(t){return function(r){return y(or)(void 0)}}}},id=function(n){return{ids:function(){var r=no(n)(),e=k(kr)(Ul(Hl(Bl))({newSeed:Nl(r),size:5}));return Z(xn)(T_(Lt(hr)(1))(n))(),e},makeElement:Sv(!0)(Zn(void 0)),makeRoot:Ov,makeText:$v(!0)(Zn(void 0)),makePursx:kv(!0)(Zn(void 0)),setProp:Pv(!0),setCb:Nv(!0),setText:Rv,sendToTop:Bv,deleteFromCache:Hv,giveNewParent:Wv,disconnectElement:Uv}};var ql=({id:n,html:t,pxScope:r,cache:e,verb:a})=>{let u=t,c=Object.entries(e);for(var l=0;l<c.length;l++){let d=c[l][0];c[l][1]===!0?u=u.replace(a+d+a,'data-deku-attr-internal="'+d+'" data-deku-ssr-'+d+r+'="true"'):u=u.replace(a+d+a,'<span style="display:contents;" data-deku-elt-internal="'+d+'" data-deku-ssr-'+d+r+'="true"></span>')}let _=u.indexOf(">"),f=u.indexOf("/>"),i=f==_-1?f:_;return u.slice(0,i)+" data-deku-ssr-"+n+'="true" '+u.slice(i)};var cd=function(n){return function(t){var r=function(f){return function(i){return Z(bo(ie))(Do(xu(tt))(function(d){var m={};for(var o in d)({}).hasOwnProperty.call(d,o)&&(m[o]=d[o]);return m.idToActions=ao(Ht)(function(p){if(p instanceof v)return new v(A(bt)(p.value0)([i]));if(p instanceof D)return new v([i]);throw new Error("Failed pattern match at Deku.SSR (line 43, column 17 - line 45, column 45): "+[p.constructor.name])})(f)(d.idToActions),m}))}},e=function(f){return function(i){return function(d){return Vn(Jn)(cf(tt))(Z(bo(ie))(Do(xu(tt))(function(m){var o={};for(var p in m)({}).hasOwnProperty.call(m,p)&&(o[p]=m[p]);return o.parentToChild=ao(Ht)(function(B){if(B instanceof v)return new v(A(bt)(B.value0)([i]));if(B instanceof D)return new v([i]);throw new Error("Failed pattern match at Deku.SSR (line 30, column 17 - line 32, column 41): "+[B.constructor.name])})(f)(m.parentToChild),o})))(function(){return r(i)(d)})}}},a=Kv(er(Ve)(Ia(tt))(function(f){if(f instanceof sf)return nr(Ia(tt))(It)(f.value0.parent)(function(i){return e(i)(f.value0.id)(f)});if(f instanceof _f)return nr(Ia(tt))(It)(f.value0.parent)(function(i){return e(i)(f.value0.id)(f)});if(f instanceof pf)return nr(Ia(tt))(It)(f.value0.parent)(function(i){return e(i)(f.value0.id)(f)});if(f instanceof mf||f instanceof Au)return r(f.value0.id)(f);throw new Error("Failed pattern match at Deku.SSR (line 53, column 17 - line 60, column 43): "+[f.constructor.name])})(t))({parentToChild:eo,idToActions:eo}),u=function(f){return Zt("")(si(function(i){return i instanceof sf?new v(i.value0.tag):D.value})(f))},c=function(f){return Ce($n)(Mo)(" ")(ur(Y_)(function(i){return i instanceof mf?new v(i.value0.key+('="'+(i.value0.value+'"'))):D.value})(f))},l=function(f){return Zn("")(function(i){var d=function(p){return Zt("")(si(function(B){return B instanceof Au?new v(B.value0.text):D.value})(i))},m=function(p){var B=u(i),Un=c(i);return"<"+(B+(" "+(Un+(" data-deku-ssr-"+(f+('="true">'+(_(f)+("</"+(B+">")))))))))},o=to(i)(0);return o instanceof v&&o.value0 instanceof Au?d(void 0):o instanceof v&&o.value0 instanceof _f?d(void 0):o instanceof v&&o.value0 instanceof pf?ql(o.value0.value0):m(void 0)})(mi(Ht)(f)(a.idToActions))},_=function(f){var i=Zt([])(mi(Ht)(f)(a.parentToChild));return tr($n)(Mo)(l)(i)};return"<"+(n+(' data-deku-ssr-deku-root="true">'+(_("deku-root")+("</"+(n+">")))))}};var ld=function(n){return pe(n.MonadST5().Monad0().Applicative0())(n.MonadST5())({doLogic:function(t){return function(r){return function(e){return r.sendToTop({id:e})}}},ids:function(){var t=pt();return function(r){return function(e){return e.ids}(t(r))}}(),disconnectElement:function(t){return function(r){return t.disconnectElement({id:r.id,scope:r.scope,parent:r.parent,scopeEq:tn(ha)})}},wrapElt:function(){var t=Wn(n)("div")(cn(dn(n.MonadST5().Monad0().Applicative0())));return function(r){return yn.create(t(r))}}(),toElt:function(t){return t}})},B0=function(n){return function(){var r=$l(),e=qr(xn)(zo(0))(id)();return qt(ld(Ei)({parent:new v("deku-root"),scope:new Ke("rootScope"),raiseId:function(a){return y(Mr)(void 0)}})(e)(n))(function(a){return a(r)})()}},sd=function(n){return Z(xn)(B0(n))},q0=function(n){return function(t){return function(r){return function(e){return s(n.MonadST5().Monad0().Bind1().Apply0().Functor0())(function(){var a=cd(t);return function(u){return function(c){return r.head+c}(function(c){return c+r.tail}(a(u)))}}())(vn(n.MonadST5())(function(){var u=xt(0)(),c=xt([])(),l=ud(u);return Z(yt)(qt(ld(hi)({parent:new v("deku-root"),scope:new Ke("rootScope"),raiseId:function(_){return y(or)(void 0)}})(l)(e))(function(_){return _(c)}))(),Dt(c)()}))}}}},_d=function(n){return q0(n)("body")};var z0=function(){return x.value}(),md=function(n){return Fi()(n)()(Qa({reflectSymbol:function(){return"buttonClicked"}})(Ya(Za(n.Always2())))(Qa({reflectSymbol:function(){return"sliderMoved"}})(Ya(Za(n.Always2())))(ei)()())()())(io({reflectSymbol:function(){return"buttonClicked"}})()()(io({reflectSymbol:function(){return"sliderMoved"}})()()(yi)()()()())()()()())(x.value)(function(t){return function(r){return Nn(n)([Iv(n)([wn(n.MonadST5().Monad0())(`Here's an example of SSR in deku.
All of the static bits are rendered as HTML,
and all of the dynamic bits are hydrated on page load.`)]),cr(n)(ff(Xn)(Pr)(po)($(n.MonadST5().Monad0().Applicative0())(t.buttonClicked)))([wn(n.MonadST5().Monad0())("Click")]),Nn(n)([wr(n.MonadST5().Monad0())(U(An(n.MonadST5().Monad0().Applicative0()))($(n.MonadST5().Monad0().Applicative0())("Val: 0"))(s(Xn)(function(){var e=A(ge)("Val: "),a=k(kr);return function(u){return e(a(u))}}())(Ye(Ct(n.MonadST5()))(E(Lt(hr)(1)))(U(An(n.MonadST5().Monad0().Applicative0()))($(n.MonadST5().Monad0().Applicative0())(void 0))(r.buttonClicked))(-1))))]),Nn(n)([ra(n)(uf(n.MonadST5().Monad0().Applicative0())($(n.MonadST5().Monad0().Applicative0())(t.sliderMoved)))([]),Nn(n)([wr(n.MonadST5().Monad0())(U(An(n.MonadST5().Monad0().Applicative0()))($(n.MonadST5().Monad0().Applicative0())("Val: 50"))(s(Xn)(function(){var e=A(ge)("Val: "),a=k(Lo);return function(u){return e(a(u))}}())(r.sliderMoved)))])])])}})},vd=function(n){return function(t){return At({reflectType:function(){return`<div>
  <h1>Server-side rendering</h1>

  <h2>When performance matters!</h2>
  <p>
    In web development, it's good practice to send a plain-HTML version of your site over the wire before any JavaScript starts executing. This is called <i>server-side rendering</i>, or SSR, where the server renders HTML in an initial pass before rendering any JavaScript.
  </p>
  <p>
    The most performant form of SSR is pre-rendering HTML and serving them from memory or from a file system. This is Deku's strategy via the following two functions:
  </p>
  <ul>
    <li><code>runSSR</code> generates HTML; and</li>
    <li><code>hydrate</code> generates JavaScript that will hydrate your HTML with anything that's dynamic. Note that this is <i>partial</i> hydration, meaning it will only hydrate the bits that need hydrating. This means that, for example, you can do CSS animations on load without fear of jank when the JavaScript kicks in.</li>
  </ul>

  <p>
    This documentation is generated using SSR, and if you add <code>view-source:</code> before the URL, you'll see the intro page rendered as HTML. If you're reading this documentation on a computer screen, you won't see much of a difference, but if you're reading it on a 3G mobile network, you'll spot the difference immedaitely.
  </p>

  <h2>A motivating example</h2>

  <p>Here is a small application using SSR. We'll split it up into three files:</p>
  <ul>
    <li><code>App.purs</code> has our application logic.</li>
    <li><code>Build.purs</code> creates a <code>.js</code> file, for example <code>make.js</code>, that will render our HTML.</li>
    <li><code>Live.purs</code> uses hydration to add dynamic logic to the website.</li>
  </ul>

  <h3>App</h3>
  <p>Unlike the previous examples that used <code>runInBody</code>, our application code here has an explicit type annotation <code>Nut</code>. The definition of <code>Nut</code> is <code>type Nut = forall s m lock payload. Korok s m => Domable m lock payload</code>, and in larger projects, you may need to write this type out explicitly, for example if you are working with an <code>Array</code> of <code>Domable</code> and need <code>m</code> to be consistant over the <code>Array</code>.</p>
  ~code0~
  <h3>Build</h3>
  <p>This is the code we use to generate our HTML site. The example below creates a small script that logs our HTML to the command line,but we can also call <code>runSSR</code> from a NodeJS server, in which case we wouldn't <code>log</code> the HTML string but rather we would instead send it over the wire as the response to a request.</p>
  ~code1~
  <h3>Live</h3>
  <p><code>Live.purs</code> can be bundled to generate our dynamic JS. The JS will hydrate our elements instead of replacing them, and will only hydrate elements that potentially will interactive content.</p>
  ~code2~

  <h3>Result</h3>

  <p>Here is the resulting code from our static-site generation. It is rendered dynamically in your browser, but in production settings, we'd use NodeJS to render or pre-render this HTML.</p>

  ~codegen~

  <p>And here is what the result looks like after hydration.</p>

  <blockquote> ~result~ </blockquote>

  <h2>Parting shot</h2>
  <p>Thanks for checking out Deku! I had a blast writing it, and I hope you enjoy using it for your projects!</p>
</div>`}})()()(zn()(zn()(zn()(zn()(zn()(Mt(t.MonadST5().Monad0().Applicative0()))({reflectType:function(){return"result"}})({reflectSymbol:function(){return"result"}})(t))({reflectType:function(){return"codegen"}})({reflectSymbol:function(){return"codegen"}})(t))({reflectType:function(){return"code2"}})({reflectSymbol:function(){return"code2"}})(t))({reflectType:function(){return"code1"}})({reflectSymbol:function(){return"code1"}})(t))({reflectType:function(){return"code0"}})({reflectSymbol:function(){return"code0"}})(t))(t)(z0)({code2:qn(Ft(t)([Et(t)([wn(t.MonadST5().Monad0())(`module Live where

import Prelude

import App (app)
import Deku.Toplevel (hydrate)
import Effect (Effect)

main :: Effect Unit
main = hydrate app`)])])),code1:qn(Ft(t)([Et(t)([wn(t.MonadST5().Monad0())(`module Build where

import Prelude

import App (app)
import Deku.Toplevel (Template(..), runSSR)
import Effect (Effect)
import Effect.Console (log)

main :: Effect Unit
main =
  runSSR
    ( Template
        { head: "<!DOCTYPE html><html><head><script src=\\"bundle.js\\" defer><\/script></head>"
        , tail: "</html>"
        }
    )
    app >>= log`)])])),code0:qn(Ft(t)([Et(t)([wn(t.MonadST5().Monad0())(`module App where

import Prelude

import Control.Alt ((<|>))
import Deku.Control (text, text_)
import Deku.DOM as D
import Deku.Listeners (click_, slider)
import Deku.Core (Nut, vbussed)
import FRP.Event (bang, fold)
import FRP.Event.VBus (V)
import Type.Proxy (Proxy(..))

type UIEvents = V
  ( buttonClicked :: Unit
  , sliderMoved :: Number
  )

app :: Nut
app = vbussed (Proxy :: _ UIEvents) \\push event -> do
  D.div_
    [ D.p_
        [ text_
            """Here's an example of SSR in deku.
All of the static bits are rendered as HTML,
and all of the dynamic bits are hydrated on page load."""
        ]
    , D.button
        (click_ (bang push.buttonClicked))
        [ text_ "Click" ]
    , D.div_
        [ text
            ( bang "Val: 0" <|>
                ( append "Val: " <<< show
                    <$> fold
                      (const (add 1))
                      (bang unit <|> event.buttonClicked)
                      (-1)
                )
            )
        ]
    , D.div_
        [ D.input
            (slider (bang push.sliderMoved))
            []
        , D.div_
            [ text
                ( bang "Val: 50" <|>
                    ( map
                        (append "Val: " <<< show)
                        event.sliderMoved
                    )
                )
            ]
        ]
    ]
`)])])),result:qn(md(t)),codegen:qn(Ft(t)([Et(t)([wr(t.MonadST5().Monad0())(fr(function(r){return Tn(t.MonadST5().Monad0().Bind1().Apply0())(b(t.MonadST5().Monad0().Bind1())(_d(t)({head:'<!DOCTYPE html><html><head><script src="bundle.js" defer><\/script></head>',tail:"</html>"})(md(hi)))(r))(y(t.MonadST5().Monad0().Applicative0())(y(t.MonadST5().Monad0().Applicative0())(void 0)))}))])]))})}};var dd=function(n){var t=function(r){return function(e){if(e instanceof Pi)return gv(r)(n);if(e instanceof iu)return yv(r)(n);if(e instanceof fu)return Sp(r)(n);if(e instanceof cu)return Av(r)(n);if(e instanceof su)return _v(r)(n);if(e instanceof _u)return av(r)(n);if(e instanceof lu)return Lv(r)(n);if(e instanceof pu)return Dv(r)(n);if(e instanceof mu)return wv(r)(n);if(e instanceof vu)return vd(r)(n);throw new Error("Failed pattern match at Deku.Example.Docs.Scene (line 83, column 3 - line 83, column 39): "+[r.constructor.name,e.constructor.name])}};return lo(n)(n.Always2())(function(r){return gr(ir)(function(e){return U(An(n.MonadST5().Monad0().Applicative0()))($(n.MonadST5().Monad0().Applicative0())(Pi.value))(e)})(function(e){return Nn(n)([Nn(n)(s(ot)(function(a){return uu(n)([Li(n)(oe($n)(dn(n.MonadST5().Monad0().Applicative0()))($(n.MonadST5().Monad0().Applicative0()))([on(st)(Kn.value)(Qn(E(r(a.value0)))),on(Cp)(rr.value)("cursor:pointer;")]))([wn(n.MonadST5().Monad0())(a.value1.value0)]),xa(n)($(n.MonadST5().Monad0().Applicative0())(on(mo)(rr.value)(function(){return a.value1.value1?"":"display:none;"}())))([wn(n.MonadST5().Monad0())(" | ")])])})([new F(Pi.value,new F("Home",!0)),new F(iu.value,new F("Hello world",!0)),new F(fu.value,new F("Component",!0)),new F(cu.value,new F("Pursx 1",!0)),new F(su.value,new F("Events 1",!0)),new F(_u.value,new F("Effects",!0)),new F(lu.value,new F("Pursx 2",!0)),new F(pu.value,new F("Events 2",!0)),new F(mu.value,new F("Portals",!0)),new F(vu.value,new F("SSR",!1))])),Nn(n)([tu(n.MonadST5())(t(r))(e)])])})})};var Dd=sd(dd(Ei));Dd();
