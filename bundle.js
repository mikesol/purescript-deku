var ia={compose:function(n){return function(t){return function(r){return n(t(r))}}}},fa=function(n){return n.compose};var Q=function(n){return n.identity},Y={identity:function(n){return n},Semigroupoid0:function(){return ia}};var C=function(n){return n};var kl=C;var Pl=function(n){return function(t){return function(){return n(t())}}},Nl=function(n){return function(){return n}},Rl=function(n){return function(t){return function(){return t(n())()}}};function wt(n){return function(){return{value:n}}}var dt=function(n){return function(){return n.value}},Ol=function(n){return function(t){return function(){var r=n(t.value);return t.value=r.state,r.value}}},ar=function(n){return function(t){return function(){return t.value=n}}};var Wl=function(n){return function(t){for(var r=n.length,e=t.length,a=new Array(r*e),u=0,c=0;c<r;c++)for(var l=n[c],_=0;_<e;_++)a[u++]=l(t[_]);return a}};var Xt=!0;var cf=function(n){return function(t){return function(r){return function(e){return n(t(r))(t(e))}}}},tt=function(n){return function(t){return function(r){return n(r)(t)}}},T=function(n){return function(t){return n}};var lf=function(n){return function(t){return t(n)}};var Ul=function(n){return function(t){for(var r=t.length,e=new Array(r),a=0;a<r;a++)e[a]=n(t[a]);return e}};var M=function(){function n(){}return n.value=new n,n}();var s=function(n){return n.map},Hr=function(n){return function(t){return function(r){return s(n)(r)(t)}}},V=function(n){return s(n)(T(void 0))},$r=function(n){return function(t){return function(r){return s(n)(T(r))(t)}}};var At={map:fa(ia)},rt={map:Ul};var po={apply:Wl,Functor0:function(){return rt}},yn=function(n){return n.apply};var bn=function(n){return function(t){return function(r){return yn(n)(s(n.Functor0())(T(Q(Y)))(t))(r)}}},_r=function(n){return function(t){return function(r){return function(e){return yn(n)(s(n.Functor0())(t)(r))(e)}}}};var y=function(n){return n.pure};var de=function(n){return function(t){return function(r){if(t)return r;if(!t)return y(n)(void 0);throw new Error("Failed pattern match at Control.Applicative (line 63, column 1 - line 63, column 63): "+[t.constructor.name,r.constructor.name])}}},mo=function(n){return function(t){return function(r){return yn(n.Apply0())(y(n)(t))(r)}}};var vo={pure:function(n){return[n]},Apply0:function(){return po}};var ql=function(n){return function(t){for(var r=[],e=0,a=n.length;e<a;e++)Array.prototype.push.apply(r,t(n[e]));return r}};var Bn=function(n){return n.discard};var Eu={bind:ql,Apply0:function(){return po}},g=function(n){return n.bind},De=function(n){return tt(g(n))},Fu=function(n){return function(t){return function(r){return function(e){return De(n)(t)(r(e))}}}},xu=function(n){return function(t){return function(r){return function(e){return g(n)(t(e))(r)}}}};var zn={discard:function(n){return g(n)}};var ca=function(n){return function(t){return g(n)(t)(Q(Y))}};var Sr=function(n){return function(t){return function(r){return g(n.Bind1())(t)(function(e){return g(n.Bind1())(r)(function(a){return y(n.Applicative0())(e(a))})})}}};var Bl=function(n){return function(t){return n+t}},zl=function(n){return function(t){return n.length===0?t:t.length===0?n:n.concat(t)}};var kt=function(n){return n.reflectSymbol};var Tr=function(n){return function(t){return t[n]}},ye=function(n){return function(t){return function(r){var e={};for(var a in r)({}).hasOwnProperty.call(r,a)&&(e[a]=r[a]);return e[n]=t,e}}};var Jl={append:function(n){return function(t){return void 0}}},ge={append:Bl};var bt={append:zl};var A=function(n){return n.append};var U=function(n){return n.alt};var Td=String.fromCharCode(65535),Ed=String.fromCharCode(0),Fd=Number.POSITIVE_INFINITY,xd=Number.NEGATIVE_INFINITY;var jl=function(n){return function(t){return function(r){return function(e){return function(a){return e<a?n:e===a?t:r}}}}};var Gl=jl;var Xl=jl;var Ql=function(n){return function(t){return n===t}};var Kl=Ql;var Yl=Ql;var We={eq:Yl};var Do={eq:Kl};var pn=function(n){return n.eq};var nn=function(){function n(){}return n.value=new n,n}(),cn=function(){function n(){}return n.value=new n,n}(),fn=function(){function n(){}return n.value=new n,n}();var Zl=function(n){return function(t){return n-t|0}};var ns=function(n){return function(t){return n+t|0}},ts=function(n){return function(t){return n*t|0}},rs=function(n){return function(t){return n+t}},es=function(n){return function(t){return n*t}};var yo={add:rs,zero:0,mul:es,one:1},Er={add:ns,zero:0,mul:ts,one:1};var qr=function(n){return n.mul};var St=function(n){return n.add};var pf={sub:Zl,Semiring0:function(){return Er}};var Jt=function(){return{compare:Xl(nn.value)(fn.value)(cn.value),Eq0:function(){return We}}}();var pr=function(){return{compare:Gl(nn.value)(fn.value)(cn.value),Eq0:function(){return Do}}}();var on=function(n){return n.compare};var Pr=function(n){return n.top};var la={top:2147483647,bottom:-2147483648,Ord0:function(){return pr}};var Br=function(n){return n.bottom};var os=function(n){return n.toString()},us=function(n){var t=n.toString();return isNaN(t+".0")?t:t+".0"};var is=function(n){var t=n.length;return'"'+n.replace(/[\0-\x1F\x7F"\\]/g,function(r,e){switch(r){case'"':case"\\":return"\\"+r;case"\x07":return"\\a";case"\b":return"\\b";case"\f":return"\\f";case`
`:return"\\n";case"\r":return"\\r";case"	":return"\\t";case"\v":return"\\v"}var a=e+1,u=a<t&&n[a]>="0"&&n[a]<="9"?"\\&":"";return"\\"+r.charCodeAt(0).toString(10)+u})+'"'};var Nr={show:is};var bo={show:us},Rr={show:os};var N=function(n){return n.show};var D=function(){function n(){}return n.value=new n,n}(),v=function(){function n(t){this.value0=t}return n.create=function(t){return new n(t)},n}();var st=function(n){return function(t){return function(r){if(r instanceof D)return n;if(r instanceof v)return t(r.value0);throw new Error("Failed pattern match at Data.Maybe (line 237, column 1 - line 237, column 51): "+[n.constructor.name,t.constructor.name,r.constructor.name])}}};var Au=st(!1)(T(!0));var nt={map:function(n){return function(t){return t instanceof v?new v(n(t.value0)):D.value}}};var Kt=function(n){return st(n)(Q(Y))},mr=function(){return function(n){if(n instanceof v)return n.value0;throw new Error("Failed pattern match at Data.Maybe (line 288, column 1 - line 288, column 46): "+[n.constructor.name])}};var sa={apply:function(n){return function(t){if(n instanceof v)return s(nt)(n.value0)(t);if(n instanceof D)return D.value;throw new Error("Failed pattern match at Data.Maybe (line 67, column 1 - line 69, column 30): "+[n.constructor.name,t.constructor.name])}},Functor0:function(){return nt}},vr={bind:function(n){return function(t){if(n instanceof v)return t(n.value0);if(n instanceof D)return D.value;throw new Error("Failed pattern match at Data.Maybe (line 125, column 1 - line 127, column 28): "+[n.constructor.name,t.constructor.name])}},Apply0:function(){return sa}};var qe=function(){return{pure:v.create,Apply0:function(){return sa}}}();var R=function(){function n(t){this.value0=t}return n.create=function(t){return new n(t)},n}(),k=function(){function n(t){this.value0=t}return n.create=function(t){return new n(t)},n}();var vf=function(n){return st(new R(n))(k.create)};var La={map:function(n){return function(t){if(t instanceof R)return new R(t.value0);if(t instanceof k)return new k(n(t.value0));throw new Error("Failed pattern match at Data.Either (line 31, column 1 - line 31, column 52): "+[t.constructor.name])}}};var Or=function(n){return function(t){return function(r){if(r instanceof R)return n(r.value0);if(r instanceof k)return t(r.value0);throw new Error("Failed pattern match at Data.Either (line 208, column 1 - line 208, column 64): "+[n.constructor.name,t.constructor.name,r.constructor.name])}}},df=function(){return Or(T(D.value))(v.create)}();var ee=function(n){return n};var ae={map:function(n){return function(t){return n(t)}}};var ls={apply:function(n){return function(t){return n(t)}},Functor0:function(){return ae}},zd={bind:function(n){return function(t){return t(n)}},Apply0:function(){return ls}},Vd={pure:ee,Apply0:function(){return ls}},_t={Applicative0:function(){return Vd},Bind1:function(){return zd}};var ss=function(n){return Math.min(Math.abs(n),2147483647)},_s=function(n){return function(t){return t===0?0:t>0?Math.floor(n/t):-Math.floor(n/-t)}},ps=function(n){return function(t){if(t===0)return 0;var r=Math.abs(t);return(n%r+r)%r}};var ms={Ring0:function(){return pf}};var Lu=function(n){return n.mod};var Df={degree:ss,div:_s,mod:ps,CommutativeRing0:function(){return ms}};var Be={mempty:void 0,Semigroup0:function(){return Jl}},ho={mempty:"",Semigroup0:function(){return ge}};var hn=function(n){return n.mempty};var gf=function(n){return function(){return n}},ds=function(n){return function(t){return function(){return t(n())()}}};var Ds=function(n,t,r){var e=0,a;return function(u){if(e===2)return a;if(e===1)throw new ReferenceError(n+" was needed before it finished initializing (module "+t+", line "+u+")",t,u);return e=1,a=r(),e=2,a}},Ia={Applicative0:function(){return dr},Bind1:function(){return _a}},_a={bind:ds,Apply0:function(){return bf(0)}},dr={pure:gf,Apply0:function(){return bf(0)}},ys=Ds("functorEffect","Effect",function(){return{map:mo(dr)}}),bf=Ds("applyEffect","Effect",function(){return{apply:Sr(Ia),Functor0:function(){return ys(0)}}}),xn=ys(20),Pt=bf(23),gs=function(n){return{append:_r(Pt)(A(n))}},$a=function(n){return{mempty:gf(hn(n)),Semigroup0:function(){return gs(n.Semigroup0())}}};var bs=function(n){return function(){return{value:n}}};var Sa=function(n){return function(){return n.value}},hs=function(n){return function(t){return function(){var r=n(t.value);return t.value=r.state,r.value}}};var Co=bs,Yd=hs,Cs=function(n){return Yd(function(t){var r=n(t);return{state:r,value:r}})};var aD=function(n,t,r){var e=0,a;return function(u){if(e===2)return a;if(e===1)throw new ReferenceError(n+" was needed before it finished initializing (module "+t+", line "+u+")",t,u);return e=1,a=r(),e=2,a}},oD=Ol,qt=function(n){return oD(function(t){var r=n(t);return{state:r,value:r}})},Dt={map:Pl},Iu={Applicative0:function(){return Yt},Bind1:function(){return $u}},$u={bind:Rl,Apply0:function(){return Tf(0)}},Yt={pure:Nl,Apply0:function(){return Tf(0)}},Tf=aD("applyST","Control.Monad.ST.Internal",function(){return{apply:Sr(Iu),Functor0:function(){return Dt}}}),Es=Tf(46);var Su={liftST:Q(Y),Monad0:function(){return Iu}},ku={liftST:kl,Monad0:function(){return Ia}},mn=function(n){return n.liftST};var Fs=function(n){return{always:T(hn(n)),Monoid0:function(){return n}}},xs=function(n){return{always:Q(Y),Monoid0:function(){return n}}},Dr=function(n){return n.always};var Ms=function(n){return function(t){return function(r){for(var e=t,a=r.length,u=a-1;u>=0;u--)e=n(r[u])(e);return e}}},ws=function(n){return function(t){return function(r){for(var e=t,a=r.length,u=0;u<a;u++)e=n(e)(r[u]);return e}}};var _n=function(n){return n.empty};var lD=function(n,t,r){var e=0,a;return function(u){if(e===2)return a;if(e===1)throw new ReferenceError(n+" was needed before it finished initializing (module "+t+", line "+u+")",t,u);return e=1,a=r(),e=2,a}};var Is={defer:function(n){return function(t){return n(void 0)(t)}}},ka=function(n){return n.defer},Ef=function(n){return function(t){var r=lD("go","Control.Lazy",function(){return ka(n)(function(a){return t(r(25))})}),e=r(25);return e}};var $s=function(n){return function(t){return n&&t}},Ss=function(n){return function(t){return n||t}},ks=function(n){return!n};var Wr=function(n){return n.not};var Fo=function(n){return n.ff};var Na=function(n){return n.disj},Zt={ff:!1,tt:!0,implies:function(n){return function(t){return Na(Zt)(Wr(Zt)(n))(t)}},conj:$s,disj:Ss,not:ks};var E=function(){function n(t,r){this.value0=t,this.value1=r}return n.create=function(t){return function(r){return new n(t,r)}},n}();var Nt=function(n){return n.value1};var pa={map:function(n){return function(t){return new E(t.value0,n(t.value1))}}};var Ao=function(n){return n};var hD=function(n){return{append:function(t){return function(r){return Na(n)(t)(r)}}}};var wf=function(n){return{mempty:Fo(n),Semigroup0:function(){return hD(n)}}};var Io=function(){return C};var or=Io;var Ou=function(){return function(){return function(){return function(){return function(n){return Io()}}}}};var et=function(n){return n.foldr};var So=function(n){return function(t){return et(n)(U(t.Alt0()))(_n(t))}},oe=function(n){return function(t){return function(r){return et(n)(function(){var e=U(t.Alt0());return function(a){return e(r(a))}}())(_n(t))}}},Gr=function(n){return function(t){return function(r){return et(t)(function(){var e=bn(n.Apply0());return function(a){return e(r(a))}}())(y(n)(void 0))}}},ue=function(n){return function(t){return tt(Gr(n)(t))}},Wu=function(n){return function(t){return Gr(n)(t)(Q(Y))}},at=function(n){return n.foldl};var Ce=function(n){return function(t){return function(r){return function(e){var a=function(u){return function(c){return u.init?{init:!1,acc:c}:{init:!1,acc:A(t.Semigroup0())(u.acc)(A(t.Semigroup0())(r)(c))}}};return at(n)(a)({init:!0,acc:hn(t)})(e).acc}}}};var gr={foldr:function(n){return function(t){return function(r){if(r instanceof D)return t;if(r instanceof v)return n(r.value0)(t);throw new Error("Failed pattern match at Data.Foldable (line 138, column 1 - line 144, column 27): "+[n.constructor.name,t.constructor.name,r.constructor.name])}}},foldl:function(n){return function(t){return function(r){if(r instanceof D)return t;if(r instanceof v)return n(t)(r.value0);throw new Error("Failed pattern match at Data.Foldable (line 138, column 1 - line 144, column 27): "+[n.constructor.name,t.constructor.name,r.constructor.name])}}},foldMap:function(n){return function(t){return function(r){if(r instanceof D)return hn(n);if(r instanceof v)return t(r.value0);throw new Error("Failed pattern match at Data.Foldable (line 138, column 1 - line 144, column 27): "+[t.constructor.name,r.constructor.name])}}}};var Os=function(n){return function(t){return function(r){return et(n)(function(e){return function(a){return A(t.Semigroup0())(r(e))(a)}})(hn(t))}}},Sn={foldr:Ms,foldl:ws,foldMap:function(n){return Os(Sn)(n)}};var tr=function(n){return n.foldMap};var ze=function(n){return function(t){return Ou()()()()(Ao)(tr(n)(wf(t)))}};var ht={dimap:function(n){return function(t){return function(r){return function(e){return t(r(n(e)))}}}}},Ws=function(n){return n.dimap},Lt=function(n){return function(t){return Ws(n)(t)(Q(Y))}};var xD=function(n){return n},ko=function(){function n(t){this.value0=t}return n.create=function(t){return new n(t)},n}(),Po=function(){function n(t){this.value0=t}return n.create=function(t){return new n(t)},n}(),MD=function(n){return n},Uu=Io(),ot=MD;var Bt=function(){return ko.create}();var va=function(){return Po.create}(),Vn=function(){var n=s(At)(s(xn)(T(!0)));return function(t){return xD(n(t))}}(),rn=function(n){return n.attr};function Us(n){return()=>n.slice()}function Hs(n){return t=>r=>()=>{r[n]=t}}function qs(n){return()=>n.slice()}var AD=function(n){return function(t){if(n<1)return[];var r=new Array(n);return r.fill(t)}},LD=function(n){return function(t){for(var r=[],e=0,a=0;a<n;a++)r[e++]=t;return r}},$f=typeof Array.prototype.fill=="function"?AD:LD,ID=function(){function n(a,u){this.head=a,this.tail=u}var t={};function r(a){return function(u){return new n(a,u)}}function e(a){for(var u=[],c=0,l=a;l!==t;)u[c++]=l.head,l=l.tail;return u}return function(a){return function(u){return e(a(r)(t)(u))}}}();var Bs=function(n){return function(t){return function(r){return function(e){return e<0||e>=r.length?t:n(r[e])}}}},zs=function(n){return function(t){return function(r){return function(e){for(var a=0;a<e.length;a++){var u=r(e[a]);if(t(u))return u}return n}}}},Vs=function(n){return function(t){return function(r){return function(e){for(var a=0,u=e.length;a<u;a++)if(r(e[a]))return n(a);return t}}}};var Js=function(n){return function(t){return function(r){return function(e){if(r<0||r>=e.length)return t;var a=e.slice();return a.splice(r,1),n(a)}}}};var No=function(n){return function(t){return t.filter(n)}},Hu=function(n){return function(t){for(var r=[],e=[],a=0;a<t.length;a++){var u=t[a];n(u)?r.push(u):e.push(u)}return{yes:r,no:e}}};var $D=function(){function n(t,r,e,a,u,c){var l,_,i,f,d,m,o;for(l=u+(c-u>>1),l-u>1&&n(t,r,a,e,u,l),c-l>1&&n(t,r,a,e,l,c),_=u,i=l,f=u;_<l&&i<c;)d=a[_],m=a[i],o=r(t(d)(m)),o>0?(e[f++]=m,++i):(e[f++]=d,++_);for(;_<l;)e[f++]=a[_++];for(;i<c;)e[f++]=a[i++]}return function(t){return function(r){return function(e){var a;return e.length<2?e:(a=e.slice(0),n(t,r,a,e.slice(0),0,e.length),a)}}}}();function da(){return[]}var Sf=function(n){return function(t){return function(){return t.push.apply(t,n)}}};var fe=function(n){return function(){return n}};function kD(n){return function(){return n.slice()}}var kf=kD,PD=function(){function n(t,r,e,a,u,c){var l,_,i,f,d,m,o;for(l=u+(c-u>>1),l-u>1&&n(t,r,a,e,u,l),c-l>1&&n(t,r,a,e,l,c),_=u,i=l,f=u;_<l&&i<c;)d=a[_],m=a[i],o=r(t(d)(m)),o>0?(e[f++]=m,++i):(e[f++]=d,++_);for(;_<l;)e[f++]=a[_++];for(;i<c;)e[f++]=a[i++]}return function(t){return function(r){return function(e){return function(){return e.length<2||n(t,r,e,e.slice(0),0,e.length),e}}}}}();var Qs=function(n){return function(t){return function(){var e=kf(t)();return n(e)(),fe(e)()}}};var Te=function(n){return Sf([n])};var OD=function(){function n(t,r){this.value0=t,this.value1=r}return n.create=function(t){return function(r){return new n(t,r)}},n}();var WD=function(n){return function(){var r=dt(n.value1)();return qt(function(e){return e+1|0})(n.value1)(),n.value0(r)}};var Bu=function(n){return s(Dt)(OD.create(n))(wt(0))},zu=function(n){return function(t){return function(){for(var e=wt(!1)();s(Dt)(Wr(Zt))(dt(e))();)(function(){var u=WD(n)();if(u instanceof v)return t(u.value0)();if(u instanceof D)return V(Dt)(ar(!0)(e))();throw new Error("Failed pattern match at Data.Array.ST.Iterator (line 42, column 5 - line 44, column 47): "+[u.constructor.name])})();return{}}}};var Ys=function(){function n(a){return[a]}function t(a){return function(u){return[a,u]}}function r(a){return function(u){return function(c){return[a,u,c]}}}function e(a){return function(u){return a.concat(u)}}return function(a){return function(u){return function(c){return function(l){return function(_){function i(f,d){switch(d-f){case 0:return c([]);case 1:return u(n)(l(_[f]));case 2:return a(u(t)(l(_[f])))(l(_[f+1]));case 3:return a(a(u(r)(l(_[f])))(l(_[f+1])))(l(_[f+2]));default:var m=f+Math.floor((d-f)/4)*2;return a(u(e)(i(f,m)))(i(m,d))}}return i(0,_.length)}}}}}}();var ur=function(n){return n.traverse};var f_=function(n){return function(t){return ur(n)(t)(Q(Y))}},Ve={traverse:function(n){return Ys(yn(n.Apply0()))(s(n.Apply0().Functor0()))(y(n))},sequence:function(n){return f_(Ve)(n)},Functor0:function(){return rt},Foldable1:function(){return Sn}};var Bf=function(n){return function(t){return Qs(Te(t))(n)()}},m_=function(n){return[n]};var Ha=function(){return Bs(v.create)(D.value)}();var Ku=function(){return zs(D.value)(Au)}();var v_=function(){return Vs(v.create)(D.value)}();var d_=function(){return Js(v.create)(D.value)}(),zf=function(n){return function(t){return function(r){return r.length===0?[]:st(r)(function(e){return mr()(d_(e)(r))})(v_(n(t))(r))}}};var Uo=function(n){return function(t){return A(bt)([n])(t)}};var ky=tt(g(Eu)),Vf=function(n){return ky(function(){var t=st([])(m_);return function(r){return t(n(r))}}())};var ce=function(n){return n.reflectType};var Yu={map:function(n){return function(t){return s(rt)(n)(t)}}};var Wy=function(n){return ce(n)},Zu=function(){return function(n){return n}};var Jf=function(){return function(){return function(){return function(){return function(){return function(n){return function(t){return function(r){return r[Wy(n)(t)]}}}}}}}};var y_=[];var jf=function(){return function(){return function(n){return function(t){return Uo(n)(t)}}}};var b_=function(n){return function(t){for(var r=t.length,e=Array(r),a=0;a<r;a++)e[a]=n(a)(t[a]);return e}};var Fe=function(n){return n.mapWithIndex};var qo={mapWithIndex:b_,Functor0:function(){return rt}};var le=function(){function n(t,r){this.value0=t,this.value1=r}return n.create=function(t){return function(r){return new n(t,r)}},n}();var ti=function(n){return function(t){return new le(t,_n(n))}};var ut=function(){function n(){}return n.value=new n,n}(),j=function(){function n(t,r){this.value0=t,this.value1=r}return n.create=function(t){return function(r){return new n(t,r)}},n}(),ri=function(n){return n},ng=function(n){return new j(n.value0,n.value1)};var tg=function(n){var t=function(r){return function(e){var a=r,u=!1,c;function l(_,i){if(i instanceof j&&i.value1 instanceof j&&i.value1.value1 instanceof j){a=new j(i,_),e=i.value1.value1.value1;return}var f=function(m){return m instanceof j&&m.value1 instanceof j&&m.value1.value1 instanceof ut?new j(n(m.value0),new j(n(m.value1.value0),ut.value)):m instanceof j&&m.value1 instanceof ut?new j(n(m.value0),ut.value):ut.value},d=function(m){return function(o){var p=m,sn=!1,Jn;function ct(yt,er){if(yt instanceof j&&yt.value0 instanceof j&&yt.value0.value1 instanceof j&&yt.value0.value1.value1 instanceof j){p=yt.value1,o=new j(n(yt.value0.value0),new j(n(yt.value0.value1.value0),new j(n(yt.value0.value1.value1.value0),er)));return}return sn=!0,er}for(;!sn;)Jn=ct(p,o);return Jn}};return u=!0,d(_)(f(i))}for(;!u;)c=l(a,e);return c}};return t(ut.value)},Kf={map:tg};var Me={foldr:function(n){return function(t){var r=function(){var a=function(u){return function(c){var l=u,_=!1,i;function f(d,m){if(m instanceof ut)return _=!0,d;if(m instanceof j){l=new j(m.value0,d),c=m.value1;return}throw new Error("Failed pattern match at Data.List.Types (line 107, column 7 - line 107, column 23): "+[d.constructor.name,m.constructor.name])}for(;!_;)i=f(l,c);return i}};return a(ut.value)}(),e=at(Me)(tt(n))(t);return function(a){return e(r(a))}}},foldl:function(n){var t=function(r){return function(e){var a=r,u=!1,c;function l(_,i){if(i instanceof ut)return u=!0,_;if(i instanceof j){a=n(_)(i.value0),e=i.value1;return}throw new Error("Failed pattern match at Data.List.Types (line 111, column 12 - line 113, column 30): "+[i.constructor.name])}for(;!u;)c=l(a,e);return c}};return t},foldMap:function(n){return function(t){return at(Me)(function(r){var e=A(n.Semigroup0())(r);return function(a){return e(t(a))}})(hn(n))}}};var Bo={append:function(n){return function(t){return et(Me)(j.create)(t)(n)}}};var Yf={append:function(n){return function(t){return new le(n.value0,A(Bo)(n.value1)(ng(t)))}}};var T_={alt:A(Bo),Functor0:function(){return Kf}},Zf=function(){return{empty:ut.value,Alt0:function(){return T_}}}();var A_=function(n){return n()};var L_=function(n){throw new Error(n)};var I_=function(){return L_};var bg=A_,Kr=function(n){return bg(function(){return I_()(n)})};var G=function(){function n(){}return n.value=new n,n}(),ln=function(){function n(t,r,e,a){this.value0=t,this.value1=r,this.value2=e,this.value3=a}return n.create=function(t){return function(r){return function(e){return function(a){return new n(t,r,e,a)}}}},n}(),kn=function(){function n(t,r,e,a,u,c,l){this.value0=t,this.value1=r,this.value2=e,this.value3=a,this.value4=u,this.value5=c,this.value6=l}return n.create=function(t){return function(r){return function(e){return function(a){return function(u){return function(c){return function(l){return new n(t,r,e,a,u,c,l)}}}}}}},n}(),je=function(){function n(t,r,e){this.value0=t,this.value1=r,this.value2=e}return n.create=function(t){return function(r){return function(e){return new n(t,r,e)}}},n}(),we=function(){function n(t,r,e){this.value0=t,this.value1=r,this.value2=e}return n.create=function(t){return function(r){return function(e){return new n(t,r,e)}}},n}(),Ge=function(){function n(t,r,e,a,u,c){this.value0=t,this.value1=r,this.value2=e,this.value3=a,this.value4=u,this.value5=c}return n.create=function(t){return function(r){return function(e){return function(a){return function(u){return function(c){return new n(t,r,e,a,u,c)}}}}}},n}(),se=function(){function n(t,r,e,a,u,c){this.value0=t,this.value1=r,this.value2=e,this.value3=a,this.value4=u,this.value5=c}return n.create=function(t){return function(r){return function(e){return function(a){return function(u){return function(c){return new n(t,r,e,a,u,c)}}}}}},n}(),Xe=function(){function n(t,r,e,a,u,c){this.value0=t,this.value1=r,this.value2=e,this.value3=a,this.value4=u,this.value5=c}return n.create=function(t){return function(r){return function(e){return function(a){return function(u){return function(c){return new n(t,r,e,a,u,c)}}}}}},n}(),ai=function(){function n(t,r,e,a){this.value0=t,this.value1=r,this.value2=e,this.value3=a}return n.create=function(t){return function(r){return function(e){return function(a){return new n(t,r,e,a)}}}},n}();var oi=function(n){return function(t){var r=on(n),e=function(a){var u=!1,c;function l(_){if(_ instanceof G)return u=!0,D.value;if(_ instanceof ln){var i=r(t)(_.value1);if(i instanceof fn)return u=!0,new v(_.value2);if(i instanceof nn){a=_.value0;return}a=_.value3;return}if(_ instanceof kn){var f=r(t)(_.value1);if(f instanceof fn)return u=!0,new v(_.value2);var d=r(t)(_.value4);if(d instanceof fn)return u=!0,new v(_.value5);if(f instanceof nn){a=_.value0;return}if(d instanceof cn){a=_.value6;return}a=_.value3;return}throw new Error("Failed pattern match at Data.Map.Internal (line 241, column 5 - line 241, column 22): "+[_.constructor.name])}for(;!u;)c=l(a);return c};return e}};var Tt=function(n){return function(t){return function(r){var e=n,a=t,u=!1,c;function l(_,i,f){if(i instanceof ut)return u=!0,f;if(i instanceof j){if(i.value0 instanceof je){e=_,a=i.value1,r=new ln(f,i.value0.value0,i.value0.value1,i.value0.value2);return}if(i.value0 instanceof we){e=_,a=i.value1,r=new ln(i.value0.value0,i.value0.value1,i.value0.value2,f);return}if(i.value0 instanceof Ge){e=_,a=i.value1,r=new kn(f,i.value0.value0,i.value0.value1,i.value0.value2,i.value0.value3,i.value0.value4,i.value0.value5);return}if(i.value0 instanceof se){e=_,a=i.value1,r=new kn(i.value0.value0,i.value0.value1,i.value0.value2,f,i.value0.value3,i.value0.value4,i.value0.value5);return}if(i.value0 instanceof Xe){e=_,a=i.value1,r=new kn(i.value0.value0,i.value0.value1,i.value0.value2,i.value0.value3,i.value0.value4,i.value0.value5,f);return}throw new Error("Failed pattern match at Data.Map.Internal (line 462, column 3 - line 467, column 88): "+[i.value0.constructor.name])}throw new Error("Failed pattern match at Data.Map.Internal (line 459, column 1 - line 459, column 80): "+[i.constructor.name,f.constructor.name])}for(;!u;)c=l(e,a,r);return c}}},ui=function(n){return function(t){return function(r){var e=function(c){return function(l){var _=c,i=!1,f;function d(m,o){if(m instanceof ut)return i=!0,new ln(o.value0,o.value1,o.value2,o.value3);if(m instanceof j){if(m.value0 instanceof je)return i=!0,Tt(n)(m.value1)(new kn(o.value0,o.value1,o.value2,o.value3,m.value0.value0,m.value0.value1,m.value0.value2));if(m.value0 instanceof we)return i=!0,Tt(n)(m.value1)(new kn(m.value0.value0,m.value0.value1,m.value0.value2,o.value0,o.value1,o.value2,o.value3));if(m.value0 instanceof Ge){_=m.value1,l=new ai(new ln(o.value0,o.value1,o.value2,o.value3),m.value0.value0,m.value0.value1,new ln(m.value0.value2,m.value0.value3,m.value0.value4,m.value0.value5));return}if(m.value0 instanceof se){_=m.value1,l=new ai(new ln(m.value0.value0,m.value0.value1,m.value0.value2,o.value0),o.value1,o.value2,new ln(o.value3,m.value0.value3,m.value0.value4,m.value0.value5));return}if(m.value0 instanceof Xe){_=m.value1,l=new ai(new ln(m.value0.value0,m.value0.value1,m.value0.value2,m.value0.value3),m.value0.value4,m.value0.value5,new ln(o.value0,o.value1,o.value2,o.value3));return}throw new Error("Failed pattern match at Data.Map.Internal (line 498, column 5 - line 503, column 108): "+[m.value0.constructor.name,o.constructor.name])}throw new Error("Failed pattern match at Data.Map.Internal (line 495, column 3 - line 495, column 56): "+[m.constructor.name,o.constructor.name])}for(;!i;)f=d(_,l);return f}},a=on(n),u=function(c){return function(l){var _=c,i=!1,f;function d(m,o){if(o instanceof G)return i=!0,e(m)(new ai(G.value,t,r,G.value));if(o instanceof ln){var p=a(t)(o.value1);if(p instanceof fn)return i=!0,Tt(n)(m)(new ln(o.value0,t,r,o.value3));if(p instanceof nn){_=new j(new je(o.value1,o.value2,o.value3),m),l=o.value0;return}_=new j(new we(o.value0,o.value1,o.value2),m),l=o.value3;return}if(o instanceof kn){var sn=a(t)(o.value1);if(sn instanceof fn)return i=!0,Tt(n)(m)(new kn(o.value0,t,r,o.value3,o.value4,o.value5,o.value6));var Jn=a(t)(o.value4);if(Jn instanceof fn)return i=!0,Tt(n)(m)(new kn(o.value0,o.value1,o.value2,o.value3,t,r,o.value6));if(sn instanceof nn){_=new j(new Ge(o.value1,o.value2,o.value3,o.value4,o.value5,o.value6),m),l=o.value0;return}if(sn instanceof cn&&Jn instanceof nn){_=new j(new se(o.value0,o.value1,o.value2,o.value4,o.value5,o.value6),m),l=o.value3;return}_=new j(new Xe(o.value0,o.value1,o.value2,o.value3,o.value4,o.value5),m),l=o.value6;return}throw new Error("Failed pattern match at Data.Map.Internal (line 478, column 3 - line 478, column 55): "+[m.constructor.name,o.constructor.name])}for(;!i;)f=d(_,l);return f}};return u(ut.value)}}},Mg=function(n){return function(t){var r=function(l){return function(_){var i=l,f=!1,d;function m(o,p){if(o instanceof ut)return f=!0,p;if(o instanceof j){if(o.value0 instanceof je&&o.value0.value2 instanceof G&&p instanceof G)return f=!0,Tt(n)(o.value1)(new ln(G.value,o.value0.value0,o.value0.value1,G.value));if(o.value0 instanceof we&&o.value0.value0 instanceof G&&p instanceof G)return f=!0,Tt(n)(o.value1)(new ln(G.value,o.value0.value1,o.value0.value2,G.value));if(o.value0 instanceof je&&o.value0.value2 instanceof ln){i=o.value1,_=new kn(p,o.value0.value0,o.value0.value1,o.value0.value2.value0,o.value0.value2.value1,o.value0.value2.value2,o.value0.value2.value3);return}if(o.value0 instanceof we&&o.value0.value0 instanceof ln){i=o.value1,_=new kn(o.value0.value0.value0,o.value0.value0.value1,o.value0.value0.value2,o.value0.value0.value3,o.value0.value1,o.value0.value2,p);return}return o.value0 instanceof je&&o.value0.value2 instanceof kn?(f=!0,Tt(n)(o.value1)(new ln(new ln(p,o.value0.value0,o.value0.value1,o.value0.value2.value0),o.value0.value2.value1,o.value0.value2.value2,new ln(o.value0.value2.value3,o.value0.value2.value4,o.value0.value2.value5,o.value0.value2.value6)))):o.value0 instanceof we&&o.value0.value0 instanceof kn?(f=!0,Tt(n)(o.value1)(new ln(new ln(o.value0.value0.value0,o.value0.value0.value1,o.value0.value0.value2,o.value0.value0.value3),o.value0.value0.value4,o.value0.value0.value5,new ln(o.value0.value0.value6,o.value0.value1,o.value0.value2,p)))):o.value0 instanceof Ge&&o.value0.value2 instanceof G&&o.value0.value5 instanceof G&&p instanceof G?(f=!0,Tt(n)(o.value1)(new kn(G.value,o.value0.value0,o.value0.value1,G.value,o.value0.value3,o.value0.value4,G.value))):o.value0 instanceof se&&o.value0.value0 instanceof G&&o.value0.value5 instanceof G&&p instanceof G?(f=!0,Tt(n)(o.value1)(new kn(G.value,o.value0.value1,o.value0.value2,G.value,o.value0.value3,o.value0.value4,G.value))):o.value0 instanceof Xe&&o.value0.value0 instanceof G&&o.value0.value3 instanceof G&&p instanceof G?(f=!0,Tt(n)(o.value1)(new kn(G.value,o.value0.value1,o.value0.value2,G.value,o.value0.value4,o.value0.value5,G.value))):o.value0 instanceof Ge&&o.value0.value2 instanceof ln?(f=!0,Tt(n)(o.value1)(new ln(new kn(p,o.value0.value0,o.value0.value1,o.value0.value2.value0,o.value0.value2.value1,o.value0.value2.value2,o.value0.value2.value3),o.value0.value3,o.value0.value4,o.value0.value5))):o.value0 instanceof se&&o.value0.value0 instanceof ln?(f=!0,Tt(n)(o.value1)(new ln(new kn(o.value0.value0.value0,o.value0.value0.value1,o.value0.value0.value2,o.value0.value0.value3,o.value0.value1,o.value0.value2,p),o.value0.value3,o.value0.value4,o.value0.value5))):o.value0 instanceof se&&o.value0.value5 instanceof ln?(f=!0,Tt(n)(o.value1)(new ln(o.value0.value0,o.value0.value1,o.value0.value2,new kn(p,o.value0.value3,o.value0.value4,o.value0.value5.value0,o.value0.value5.value1,o.value0.value5.value2,o.value0.value5.value3)))):o.value0 instanceof Xe&&o.value0.value3 instanceof ln?(f=!0,Tt(n)(o.value1)(new ln(o.value0.value0,o.value0.value1,o.value0.value2,new kn(o.value0.value3.value0,o.value0.value3.value1,o.value0.value3.value2,o.value0.value3.value3,o.value0.value4,o.value0.value5,p)))):o.value0 instanceof Ge&&o.value0.value2 instanceof kn?(f=!0,Tt(n)(o.value1)(new kn(new ln(p,o.value0.value0,o.value0.value1,o.value0.value2.value0),o.value0.value2.value1,o.value0.value2.value2,new ln(o.value0.value2.value3,o.value0.value2.value4,o.value0.value2.value5,o.value0.value2.value6),o.value0.value3,o.value0.value4,o.value0.value5))):o.value0 instanceof se&&o.value0.value0 instanceof kn?(f=!0,Tt(n)(o.value1)(new kn(new ln(o.value0.value0.value0,o.value0.value0.value1,o.value0.value0.value2,o.value0.value0.value3),o.value0.value0.value4,o.value0.value0.value5,new ln(o.value0.value0.value6,o.value0.value1,o.value0.value2,p),o.value0.value3,o.value0.value4,o.value0.value5))):o.value0 instanceof se&&o.value0.value5 instanceof kn?(f=!0,Tt(n)(o.value1)(new kn(o.value0.value0,o.value0.value1,o.value0.value2,new ln(p,o.value0.value3,o.value0.value4,o.value0.value5.value0),o.value0.value5.value1,o.value0.value5.value2,new ln(o.value0.value5.value3,o.value0.value5.value4,o.value0.value5.value5,o.value0.value5.value6)))):o.value0 instanceof Xe&&o.value0.value3 instanceof kn?(f=!0,Tt(n)(o.value1)(new kn(o.value0.value0,o.value0.value1,o.value0.value2,new ln(o.value0.value3.value0,o.value0.value3.value1,o.value0.value3.value2,o.value0.value3.value3),o.value0.value3.value4,o.value0.value3.value5,new ln(o.value0.value3.value6,o.value0.value4,o.value0.value5,p)))):(f=!0,Kr("The impossible happened in partial function `up`."))}throw new Error("Failed pattern match at Data.Map.Internal (line 552, column 5 - line 573, column 86): "+[o.constructor.name])}for(;!f;)d=m(i,_);return d}},e=function(l){return function(_){var i=l,f=!1,d;function m(o,p){if(p instanceof ln&&p.value0 instanceof G&&p.value3 instanceof G)return f=!0,r(o)(G.value);if(p instanceof ln){i=new j(new we(p.value0,p.value1,p.value2),o),_=p.value3;return}if(p instanceof kn&&p.value0 instanceof G&&p.value3 instanceof G&&p.value6 instanceof G)return f=!0,r(new j(new we(G.value,p.value1,p.value2),o))(G.value);if(p instanceof kn){i=new j(new Xe(p.value0,p.value1,p.value2,p.value3,p.value4,p.value5),o),_=p.value6;return}return f=!0,Kr("The impossible happened in partial function `removeMaxNode`.")}for(;!f;)d=m(i,_);return d}},a=function(l){var _=!1,i;function f(d){if(d instanceof ln&&d.value3 instanceof G)return _=!0,{key:d.value1,value:d.value2};if(d instanceof ln){l=d.value3;return}if(d instanceof kn&&d.value6 instanceof G)return _=!0,{key:d.value4,value:d.value5};if(d instanceof kn){l=d.value6;return}return _=!0,Kr("The impossible happened in partial function `maxNode`.")}for(;!_;)i=f(l);return i},u=on(n),c=function(l){return function(_){var i=l,f=!1,d;function m(o,p){if(p instanceof G)return f=!0,D.value;if(p instanceof ln){var sn=u(t)(p.value1);if(p.value3 instanceof G&&sn instanceof fn)return f=!0,new v(new E(p.value2,r(o)(G.value)));if(sn instanceof fn){var Jn=a(p.value0);return f=!0,new v(new E(p.value2,e(new j(new je(Jn.key,Jn.value,p.value3),o))(p.value0)))}if(sn instanceof nn){i=new j(new je(p.value1,p.value2,p.value3),o),_=p.value0;return}i=new j(new we(p.value0,p.value1,p.value2),o),_=p.value3;return}if(p instanceof kn){var ct=function(){return p.value0 instanceof G&&p.value3 instanceof G&&p.value6 instanceof G}(),sn=u(t)(p.value4),yt=u(t)(p.value1);if(ct&&yt instanceof fn)return f=!0,new v(new E(p.value2,Tt(n)(o)(new ln(G.value,p.value4,p.value5,G.value))));if(ct&&sn instanceof fn)return f=!0,new v(new E(p.value5,Tt(n)(o)(new ln(G.value,p.value1,p.value2,G.value))));if(yt instanceof fn){var Jn=a(p.value0);return f=!0,new v(new E(p.value2,e(new j(new Ge(Jn.key,Jn.value,p.value3,p.value4,p.value5,p.value6),o))(p.value0)))}if(sn instanceof fn){var Jn=a(p.value3);return f=!0,new v(new E(p.value5,e(new j(new se(p.value0,p.value1,p.value2,Jn.key,Jn.value,p.value6),o))(p.value3)))}if(yt instanceof nn){i=new j(new Ge(p.value1,p.value2,p.value3,p.value4,p.value5,p.value6),o),_=p.value0;return}if(yt instanceof cn&&sn instanceof nn){i=new j(new se(p.value0,p.value1,p.value2,p.value4,p.value5,p.value6),o),_=p.value3;return}i=new j(new Xe(p.value0,p.value1,p.value2,p.value3,p.value4,p.value5),o),_=p.value6;return}throw new Error("Failed pattern match at Data.Map.Internal (line 525, column 16 - line 548, column 80): "+[p.constructor.name])}for(;!f;)d=m(i,_);return d}};return c(ut.value)}};var Ja=function(){return G.value}();var k_=function(n){return function(t){return function(r){return st(r)(Nt)(Mg(n)(t)(r))}}};var ja=function(n){return function(t){return function(r){return function(e){var a=t(oi(n)(r)(e));if(a instanceof D)return k_(n)(r)(e);if(a instanceof v)return ui(n)(r)(a.value0)(e);throw new Error("Failed pattern match at Data.Map.Internal (line 596, column 15 - line 598, column 25): "+[a.constructor.name])}}}};var P_={compact:function(n){return function(){var r=da(),e=Bu(function(a){return Ha(n)(a)})();return zu(e)(function(){var a=V(Dt);return function(u){return a(function(c){if(c instanceof D)return y(Yt)(0);if(c instanceof v)return Te(c.value0)(r);throw new Error("Failed pattern match at Data.Compactable (line 111, column 34 - line 113, column 35): "+[c.constructor.name])}(u))}}())(),fe(r)()}()},separate:function(n){return function(){var r=da(),e=da(),a=Bu(function(u){return Ha(n)(u)})();return zu(a)(function(){var u=V(Dt);return function(c){return u(function(l){if(l instanceof R)return Te(l.value0)(r);if(l instanceof k)return Te(l.value0)(e);throw new Error("Failed pattern match at Data.Compactable (line 122, column 34 - line 124, column 31): "+[l.constructor.name])}(c))}}())(),yn(Es)(s(Dt)(function(u){return function(c){return{left:u,right:c}}})(fe(r)))(fe(e))()}()}};var ba=function(n){return n.compact};var N_={partitionMap:function(n){var t=function(r){return function(e){var a=n(e);if(a instanceof R)return{left:A(bt)(r.left)([a.value0]),right:r.right};if(a instanceof k)return{right:A(bt)(r.right)([a.value0]),left:r.left};throw new Error("Failed pattern match at Data.Filterable (line 149, column 16 - line 151, column 50): "+[a.constructor.name])}};return at(Sn)(t)({left:[],right:[]})},partition:Hu,filterMap:Vf,filter:No,Compactable0:function(){return P_},Functor1:function(){return rt}};var ir=function(n){return n.filterMap};var R_=function(n){return n.filter};var Xa=function(n){return n.keepLatest},Qe=function(n){return n.fold};var ha=function(n){return function(t){return function(r){return function(e){return ir(n.Filterable1())(Nt)(Qe(n)(function(a){return function(u){return s(pa)(y(qe))(t(a)(u.value0))}})(r)(new E(e,D.value)))}}}};var Qa=function(n){return n.bang};function oc(n){return function(t){return n===t}}var W_=oc;var Ug=function(n){return n};var Gt=function(n){return function(t){return n(t)}},Hg=function(n){return function(t){return function(r){return function(e){return function(a){return g(n.Monad0().Bind1())(mn(n)(wt(D.value)))(function(u){return g(n.Monad0().Bind1())(r(function(c){return mn(n)(V(Dt)(ar(new v(c))(u)))}))(function(c){return g(n.Monad0().Bind1())(e(function(l){return g(n.Monad0().Bind1())(mn(n)(dt(u)))(Gr(t)(gr)(function(_){return a(l(_))}))}))(function(l){return y(t)(bn(t.Apply0())(c)(l))})})})}}}}},br=Ug,qg=function(n){return function(t){return function(r){return g(n.Monad0().Bind1())(mn(n)(wt(D.value)))(function(e){return g(n.Monad0().Bind1())(t(function(a){return Bn(zn)(n.Monad0().Bind1())(g(n.Monad0().Bind1())(mn(n)(dt(e)))(Wu(n.Monad0().Applicative0())(gr)))(function(){return g(n.Monad0().Bind1())(Gt(a)(r))(function(u){return mn(n)(V(Dt)(ar(new v(u))(e)))})})}))(function(a){return y(n.Monad0().Applicative0())(Bn(zn)(n.Monad0().Bind1())(g(n.Monad0().Bind1())(mn(n)(dt(e)))(Wu(n.Monad0().Applicative0())(gr)))(function(){return a}))})})}}},Gn={map:function(n){return function(t){return function(r){return t(function(e){return r(n(e))})}}}};var Bg=function(n){return function(t){return function(r){return function(e){return function(a){return g(n.Monad0().Bind1())(mn(n)(wt(e)))(function(u){return r(function(c){return g(n.Monad0().Bind1())(mn(n)(qt(t(c))(u)))(a)})})}}}}},zo=function(n){return function(t){return function(r){return function(e){return r(function(a){var u=t(a);if(u instanceof v)return e(u.value0);if(u instanceof D)return y(n)(void 0);throw new Error("Failed pattern match at FRP.Event (line 126, column 13 - line 128, column 27): "+[u.constructor.name])})}}}},uc=function(n){return function(t){return zo(n)(function(r){var e=t(r);if(e)return new v(r);if(!e)return D.value;throw new Error("Failed pattern match at FRP.Event (line 84, column 13 - line 86, column 25): "+[e.constructor.name])})}};var ic=function(n){return function(t){return g(n.Monad0().Bind1())(mn(n)(wt([])))(function(r){return y(n.Monad0().Applicative0())({event:function(e){return g(t.Monad0().Bind1())(mn(t)(qt(function(a){return A(bt)(a)([e])})(r)))(function(){return y(t.Monad0().Applicative0())(g(t.Monad0().Bind1())(mn(t)(qt(zf(W_)(e))(r)))(function(){return y(t.Monad0().Applicative0())(void 0)}))})},push:function(e){return g(t.Monad0().Bind1())(mn(t)(dt(r)))(Gr(t.Monad0().Applicative0())(Sn)(function(a){return a(e)}))}})})}},zg=function(n){return function(t){return function(r){return function(e){return g(t.Bind1())(ic(n)(n))(function(a){var u=r(a.event);return g(t.Bind1())(Gt(u.input)(a.push))(function(c){return g(t.Bind1())(Gt(u.output)(e))(function(l){return y(t.Applicative0())(bn(t.Bind1().Apply0())(c)(l))})})})}}}},U_=function(n){return function(t){return function(r){return br(function(e){return g(n.Monad0().Bind1())(ic(n)(n))(function(a){return Bn(zn)(n.Monad0().Bind1())(e(r(a.event)))(function(){return Gt(t)(a.push)})})})}}},Vo=function(n){return{compact:zo(n)(Q(Y)),separate:function(t){return{left:zo(n)(function(r){if(r instanceof R)return new v(r.value0);if(r instanceof k)return D.value;throw new Error("Failed pattern match at FRP.Event (line 67, column 13 - line 69, column 33): "+[r.constructor.name])})(t),right:zo(n)(function(r){if(r instanceof k)return new v(r.value0);if(r instanceof R)return D.value;throw new Error("Failed pattern match at FRP.Event (line 74, column 13 - line 76, column 32): "+[r.constructor.name])})(t)}}}},Yr=function(n){return{filter:uc(n),filterMap:zo(n),partition:function(t){return function(r){return{yes:uc(n)(t)(r),no:uc(n)(function(){var e=Wr(Zt);return function(a){return e(t(a))}}())(r)}}},partitionMap:function(t){return function(r){return{left:ir(Yr(n))(function(){var e=Or(v.create)(T(D.value));return function(a){return e(t(a))}}())(r),right:ir(Yr(n))(function(e){return df(t(e))})(r)}}},Compactable0:function(){return Vo(n)},Functor1:function(){return Gn}}},Ke=function(n){return function(t){return br(function(r){return g(n.Monad0().Bind1())(ic(n)(n))(function(e){return Bn(zn)(n.Monad0().Bind1())(r(t(e.push)(e.event)))(function(){return y(n.Monad0().Applicative0())(y(n.Monad0().Applicative0())(void 0))})})})}},$=function(n){return function(t){return function(r){return s(n.Apply0().Functor0())(function(e){return y(n)(void 0)})(r(t))}}},In=function(n){return{alt:function(t){return function(r){return function(e){return yn(n.Apply0())(s(n.Apply0().Functor0())(function(a){return function(u){return bn(n.Apply0())(a)(u)}})(t(e)))(r(e))}}},Functor0:function(){return Gn}}},Cn=function(n){return{empty:function(t){return y(n)(y(n)(void 0))},Alt0:function(){return In(n)}}},It=function(n){return{fold:Bg(n),keepLatest:qg(n),sampleOn:Hg(n)(n.Monad0().Applicative0()),fix:zg(n)(n.Monad0()),bang:$(n.Monad0().Applicative0()),Plus0:function(){return Cn(n.Monad0().Applicative0())},Filterable1:function(){return Yr(n.Monad0().Applicative0())}}};var H_="_____$__$_$$_vbus";function fc(n){return()=>{for(let t in n)delete n[t]}}function cc(n){return()=>{let t=(u,c,l,_)=>{let i=Object.keys(_);for(var f=0;f<i.length;f++)if(_[i[f]]instanceof Object&&_[i[f]][H_]===H_){let d={},m={};t(u,d,m,_[i[f]]),c[i[f]]=d,l[i[f]]=m}else{let d=`${Math.random()}`;u[d]={},c[i[f]]=m=>()=>{let o=Object.keys(u[d]);for(var p=0;p<o.length;p++)u[d][o[p]](m)()},l[i[f]]=m=>()=>{let o=`${Math.random()}`;return u[d][o]=m,()=>{delete u[d][o]}}}},r={},e={},a={};return t(r,e,a,n),{p:e,e:a,s:r}}}var lc=function(n){return function(t){return function(r){return function(e){return n(t,r,e)}}}};var pc=function(n){return function(){return function(){return function(t){return function(r){return function(e){return ye(kt(n)(t))(r)(e)}}}}}},mc=function(n){return function(){return function(t){return function(r){return Tr(kt(n)(t))(r)}}}};var ci={vb:function(n){return function(t){return function(r){return{}}}}},B_=function(n){return n.vb},z_=function(){return function(n){return function(t){return function(r){return function(e){var a=B_(t)(M.value)(M.value)(M.value);return br(function(u){return g(n.Monad0().Bind1())(cc(a))(function(c){return Bn(zn)(n.Monad0().Bind1())(u(e(c.p)(c.e)))(function(){return y(n.Monad0().Applicative0())(fc(c.s))})})})}}}}};var Ka=function(n){return function(){return function(){return function(t){return function(){return function(){return function(){return function(){return{vb:function(r){return function(e){return function(a){return pc(n)()()(M.value)(void 0)(B_(t)(M.value)(M.value)(M.value))}}}}}}}}}}}};var Le=function(){function n(t){this.value0=t}return n.create=function(t){return new n(t)},n}(),li=function(){function n(){}return n.value=new n,n}(),Jo=function(){function n(){}return n.value=new n,n}(),si=function(){function n(t){this.value0=t}return n.create=function(t){return new n(t)},n}(),Xn=function(){function n(t){this.value0=t}return n.create=function(t){return new n(t)},n}(),_i=function(){function n(t){this.value0=t}return n.create=function(t){return new n(t)},n}(),Mn=function(){function n(t){this.value0=t}return n.create=function(t){return new n(t)},n}();var pi=function(){return function(n){return function(t){return function(r){return function(e){return new _i(z_()(n)(t)(r)(e))}}}}};var Ya=function(n){return new si(n)},Za=function(n){return function(t){return new _i(Ke(n)(t))}};function V_(n){return function(){var t={};for(var r in n)hasOwnProperty.call(n,r)&&(t[r]=n[r]);return t}}var Ye={};function Dc(n){return n()}function J_(n){return function(t){return function(r){return function(e){var a=r;function u(l){return function(_){return t(_)(l)(e[l])}}for(var c in e)hasOwnProperty.call(e,c)&&(a=n(a)(u(c)));return a}}}}function mi(n){return function(t){var r=[];for(var e in t)hasOwnProperty.call(t,e)&&r.push(n(e)(t[e]));return r}}var Qg=Object.keys||mi(function(n){return function(){return n}});function yc(n){return function(t){return function(r){return function(){return r[n]=t,r}}}}var gc=function(n){return function(t){return function(){return delete t[n],t}}};var ab=mi(function(n){return function(t){return t}});var ob=V_;var j_=function(n){return function(t){return Dc(function(){var e=ob(t)();return n(e)(),e})}};var no=function(n){return function(t){return j_(yc(n)(t))}};var G_=J_(lf),ub=function(n){return function(t){return G_(function(r){return function(e){return function(a){return A(n.Semigroup0())(r)(t(e)(a))}}})(hn(n))}},X_={foldl:function(n){return G_(function(t){return function(r){return n(t)}})},foldr:function(n){return function(t){return function(r){return et(Sn)(n)(t)(ab(r))}}},foldMap:function(n){return function(t){return ub(n)(T(t))}}};var bc=function(n){return j_(gc(n))};var Ze={proof:function(n){return n},Coercible0:function(){}};var Q_=function(){function n(){}return n.value=new n,n}(),Tc=function(){function n(){}return n.value=new n,n}(),ib=function(){function n(){}return n.value=new n,n}();var fb=function(n){return n.makeText},cb=function(n){return function(t){return function(r){return s(Gn)(function(e){return n.setText(function(a){return{id:t,text:a}}(e))})(r)}}},lb=function(n){return function(t){return function(r){return s(Gn)(function(e){return function(a){if(a.value instanceof ko)return n.setProp({id:t,key:a.key,value:a.value.value0});if(a.value instanceof Po)return n.setCb({id:t,key:a.key,value:a.value.value0});throw new Error("Failed pattern match at Deku.Control (line 73, column 26 - line 75, column 45): "+[a.value.constructor.name])}(Uu(e))})(r)}}},sb=function(n){return n.makeElement},wr=function(n){return function(t){var r=function(e){return function(a){return br(function(u){return g(n.Bind1())(a.ids)(function(c){return Bn(zn)(n.Bind1())(e.raiseId(c))(function(){return s(n.Bind1().Apply0().Functor0())(bn(n.Bind1().Apply0())(u(a.deleteFromCache({id:c}))))(Gt(So(Sn)(Cn(n.Applicative0()))([$(n.Applicative0())(fb(a)({id:c,parent:e.parent,scope:e.scope})),cb(a)(c)(t)]))(u))})})})}};return new Mn(r)}},wn=function(n){return function(t){return wr(n)($(n.Applicative0())(t))}},vi=function(n){return function(t){return function(r){var e=function(a){var u=function(c){return function(l){return new E(l+1|0,new E(c,l))}};return ha(It(n))(u)(a)(0)};return new si(Xa(It(n))(U_(n)(e(r))(function(a){return s(Gn)(function(u){return U(In(n.Monad0().Applicative0()))($(n.Monad0().Applicative0())(new Le(t(u.value0))))(s(Gn)(T(Jo.value))(R_(Yr(n.Monad0().Applicative0()))(function(){var c=pn(Do)(u.value1+1|0);return function(l){return c(Nt(l))}}())(a)))})(a)})))}}},di=function(n){return function(t){return C}},Qn=function(n){return function(t){return function(r){return function(e){var a=function(u){return function(c){return br(function(l){return g(n.Monad0().Bind1())(c.ids)(function(_){return Bn(zn)(n.Monad0().Bind1())(u.raiseId(_))(function(){return s(n.Monad0().Bind1().Apply0().Functor0())(bn(n.Monad0().Bind1().Apply0())(l(c.deleteFromCache({id:_}))))(Gt(U(In(n.Monad0().Applicative0()))(So(Sn)(Cn(n.Monad0().Applicative0()))([$(n.Monad0().Applicative0())(sb(c)({id:_,parent:u.parent,scope:u.scope,tag:t})),lb(c)(_)(r)]))(_e(n.Monad0().Applicative0())(n)({parent:_,scope:u.scope,raiseId:function(i){return y(n.Monad0().Applicative0())(void 0)}})(c)(e)))(l))})})})}};return a}}}},_e=function(n){return function(t){return function(r){return function(e){var a=function(u){return u(r)(e)};return function(u){if(u instanceof Xn)return oe(Sn)(Cn(n))(_e(n)(t)(r)(e))(u.value0);if(u instanceof _i)return Xa(It(t))(s(Gn)(_e(n)(t)(r)(e))(u.value0));if(u instanceof Mn)return a(u.value0);if(u instanceof si)return br(function(c){return g(t.Monad0().Bind1())(mn(t)(wt(Ye)))(function(l){return g(t.Monad0().Bind1())(Gt(u.value0)(function(_){return g(t.Monad0().Bind1())(e.ids)(function(i){return g(t.Monad0().Bind1())(mn(t)(wt(y(n)(void 0))))(function(f){return g(t.Monad0().Bind1())(e.ids)(function(d){return g(t.Monad0().Bind1())(mn(t)(wt(y(n)(void 0))))(function(m){return g(t.Monad0().Bind1())(mn(t)(wt(D.value)))(function(o){return g(t.Monad0().Bind1())(mn(t)(wt(y(n)(void 0))))(function(p){return g(t.Monad0().Bind1())(e.ids)(function(sn){return g(t.Monad0().Bind1())(mn(t)(wt(Q_.value)))(function(Jn){return g(t.Monad0().Bind1())(Gt(_)(function(ct){return g(t.Monad0().Bind1())(mn(t)(dt(Jn)))(function(yt){return ct instanceof li&&yt instanceof Tc?g(t.Monad0().Bind1())(mn(t)(dt(o)))(Gr(n)(gr)(function(er){return c(e.sendToTop(function(gu){return{id:gu}}(er)))})):ct instanceof Jo&&yt instanceof Tc?Bn(zn)(t.Monad0().Bind1())(V(n.Apply0().Functor0())(mn(t)(ar(ib.value)(Jn))))(function(){var er=bn(n.Apply0())(bn(n.Apply0())(bn(n.Apply0())(bn(n.Apply0())(g(t.Monad0().Bind1())(mn(t)(dt(o)))(Gr(n)(gr)(function(gu){return c(e.disconnectElement({id:gu,parent:r.parent,scope:sn}))})))(ca(t.Monad0().Bind1())(mn(t)(dt(f)))))(ca(t.Monad0().Bind1())(mn(t)(dt(m)))))(V(n.Apply0().Functor0())(mn(t)(qt(bc(i))(l)))))(V(n.Apply0().Functor0())(mn(t)(qt(bc(d))(l))));return bn(n.Apply0())(V(n.Apply0().Functor0())(mn(t)(ar(er)(p))))(er)}):ct instanceof Le&&yt instanceof Q_?Bn(zn)(t.Monad0().Bind1())(V(n.Apply0().Functor0())(mn(t)(ar(Tc.value)(Jn))))(function(){return g(t.Monad0().Bind1())(Gt(_e(n)(t)({parent:r.parent,scope:sn,raiseId:function(er){return V(n.Apply0().Functor0())(mn(t)(ar(new v(er))(o)))}})(e)(function(){return ct.value0 instanceof Mn?ct.value0:new Mn(Qn(t)("div")(_n(Cn(n)))(ct.value0))}()))(c))(function(er){return Bn(zn)(t.Monad0().Bind1())(V(n.Apply0().Functor0())(mn(t)(qt(no(d)(er))(l))))(function(){return V(n.Apply0().Functor0())(mn(t)(ar(er)(m)))})})}):y(n)(void 0)})}))(function(ct){return Bn(zn)(t.Monad0().Bind1())(V(n.Apply0().Functor0())(mn(t)(ar(ct)(f))))(function(){return Bn(zn)(t.Monad0().Bind1())(V(n.Apply0().Functor0())(mn(t)(qt(no(i)(ct))(l))))(function(){return ca(t.Monad0().Bind1())(mn(t)(dt(p)))})})})})})})})})})})})}))(function(_){return y(n)(Bn(zn)(t.Monad0().Bind1())(g(t.Monad0().Bind1())(mn(t)(dt(l)))(at(X_)(bn(n.Apply0()))(y(n)(void 0))))(function(){return _}))})})});throw new Error("Failed pattern match at Deku.Control (line 304, column 61 - line 381, column 20): "+[u.constructor.name])}}}}};var _b=function(){return function(n){return function(t){return function(r){return function(e){return function(a){var u=function(c){return function(l){return br(function(_){return g(n.Monad0().Bind1())(Us(s(rt)(T(""))(Zu()(e))))(function(i){var f=So(Sn)(Cn(n.Monad0().Applicative0()))(Fe(qo)(function(d){return Ef(Is)(function(m){return function(o){return o instanceof Mn?o.value0({parent:"@portal@",scope:r(c.scope),raiseId:function(p){return Hs(d)(p)(i)}})(l):m(new Mn(Qn(n)("div")(_n(Cn(n.Monad0().Applicative0())))(o)))}})})(Zu()(e)));return g(n.Monad0().Bind1())(Gt(f)(_))(function(d){return g(n.Monad0().Bind1())(mn(n)(wt(y(n.Monad0().Applicative0())(void 0))))(function(m){return g(n.Monad0().Bind1())(s(n.Monad0().Bind1().Apply0().Functor0())(C)(qs(i)))(function(o){var p=s(Yu)(function(Jn){return new Mn(function(ct){return function(yt){return br(function(er){return Bn(zn)(n.Monad0().Bind1())(ct.raiseId(Jn))(function(){return Bn(zn)(n.Monad0().Bind1())(er(yt.giveNewParent({id:Jn,parent:ct.parent,scope:ct.scope})))(function(){return y(n.Monad0().Applicative0())(y(n.Monad0().Applicative0())(void 0))})})})}})})(o),sn=_e(n.Monad0().Applicative0())(n)(c)(l)(di(Ze)(Ze)(a(p)(C)));return g(n.Monad0().Bind1())(Gt(sn)(_))(function(Jn){return Bn(zn)(n.Monad0().Bind1())(V(n.Monad0().Bind1().Apply0().Functor0())(mn(n)(ar(Jn)(m))))(function(){return y(n.Monad0().Applicative0())(Bn(zn)(n.Monad0().Bind1())(d)(function(){return Bn(zn)(n.Monad0().Bind1())(de(n.Monad0().Applicative0())(!t)(ue(n.Monad0().Applicative0())(Sn)(Zu()(o))(function(ct){return _(l.deleteFromCache({id:ct}))})))(function(){return ca(n.Monad0().Bind1())(mn(n)(dt(m)))})}))})})})})})})})}};return new Mn(u)}}}}}};var K_=function(){return function(n){return function(t){return _b()(n)(!1)(Q(Y))(t)}}};var Kn=function(){function n(){}return n.value=new n,n}(),to={attr:function(n){return function(t){return ot({key:"click",value:va(T($r(xn)(t)(!0)))})}}};var ft={attr:function(n){return function(t){return ot({key:"click",value:va(t)})}}};var rr=function(){function n(){}return n.value=new n,n}();var ro={attr:function(n){return function(t){return ot({key:"style",value:Bt(t)})}}};var Y_={attr:function(n){return function(t){return ot({key:"style",value:Bt(t)})}}};var Z_={attr:function(n){return function(t){return ot({key:"style",value:Bt(t)})}}};var Ec={attr:function(n){return function(t){return ot({key:"style",value:Bt(t)})}}};var Di={attr:function(n){return function(t){return ot({key:"style",value:Bt(t)})}}};var np={attr:function(n){return function(t){return ot({key:"style",value:Bt(t)})}}};var yi=function(n){return function(t){return function(r){return new Mn(Qn(n)("a")(t)(new Xn(r)))}}};var Fc=function(n){return function(t){return function(r){return new Mn(Qn(n)("div")(t)(new Xn(r)))}}},Pn=function(n){return Fc(n)(_n(Cn(n.Monad0().Applicative0())))};var Ca=function(n){return function(t){return function(r){return new Mn(Qn(n)("span")(t)(new Xn(r)))}}},Go=function(n){return Ca(n)(_n(Cn(n.Monad0().Applicative0())))};var rp=function(){function n(){}return n.value=new n,n}();var ep={attr:function(n){return function(t){return ot({key:"href",value:Bt(t)})}}};var eo=function(){function n(){}return n.value=new n,n}();var ap={attr:function(n){return function(t){return ot({key:"type",value:Bt(t)})}}};var bi={attr:function(n){return function(t){return ot({key:"type",value:Bt(t)})}}};var fr=function(n){return function(t){return function(r){return new Mn(Qn(n)("button")(t)(new Xn(r)))}}},op=function(n){return fr(n)(_n(Cn(n.Monad0().Applicative0())))};var mb=function(n){return function(t){return function(r){return new Mn(Qn(n)("code")(t)(new Xn(r)))}}},Ft=function(n){return mb(n)(_n(Cn(n.Monad0().Applicative0())))};var vb=function(n){return function(t){return function(r){return new Mn(Qn(n)("i")(t)(new Xn(r)))}}},up=function(n){return vb(n)(_n(Cn(n.Monad0().Applicative0())))};var ta=function(n){return function(t){return function(r){return new Mn(Qn(n)("input")(t)(new Xn(r)))}}};var Db=function(n){return function(t){return function(r){return new Mn(Qn(n)("li")(t)(new Xn(r)))}}},ip=function(n){return Db(n)(_n(Cn(n.Monad0().Applicative0())))};var gb=function(n){return function(t){return function(r){return new Mn(Qn(n)("pre")(t)(new Xn(r)))}}},xt=function(n){return gb(n)(_n(Cn(n.Monad0().Applicative0())))};var bb=function(n){return function(t){return function(r){return new Mn(Qn(n)("ul")(t)(new Xn(r)))}}},fp=function(n){return bb(n)(_n(Cn(n.Monad0().Applicative0())))};var Ci=function(){function n(){}return n.value=new n,n}(),Xo=function(){function n(){}return n.value=new n,n}(),Qo=function(){function n(){}return n.value=new n,n}(),Ko=function(){function n(){}return n.value=new n,n}(),Yo=function(){function n(){}return n.value=new n,n}(),Zo=function(){function n(){}return n.value=new n,n}(),nu=function(){function n(){}return n.value=new n,n}(),tu=function(){function n(){}return n.value=new n,n}(),ru=function(){function n(){}return n.value=new n,n}(),eu=function(){function n(){}return n.value=new n,n}();function Mc(){window.scrollTo(0,0)}var zt=Mc;var Tb=function(n){return n};var Mt=function(n){return{pursxToElement:function(t){return function(r){return function(e){return{cache:Ye,element:function(a){return function(u){return _n(Cn(n))}}}}}}}},wc=function(n){return n.pursxToElement},Rt=function(){return function(n){return function(t){return function(r){return function(e){return{pursxToElement:function(a){return function(u){return function(c){var l=wc(n)(a)(M.value)(c);return{cache:no(ce(t)(M.value))(!0)(l.cache),element:function(_){return function(i){return U(In(e.Monad0().Applicative0()))(s(Gn)(Lt(ht)(Uu)(function(f){if(f.value instanceof ko)return i.setProp({id:ce(t)(M.value)+a,key:f.key,value:f.value.value0});if(f.value instanceof Po)return i.setCb({id:ce(t)(M.value)+a,key:f.key,value:f.value.value0});throw new Error("Failed pattern match at Deku.Pursx (line 4472, column 38 - line 4482, column 24): "+[f.value.constructor.name])}))(mc(r)()(M.value)(c)))(l.element(_)(i))}}}}}}}}}}}},On=function(){return function(n){return function(t){return function(r){return function(e){return{pursxToElement:function(a){return function(u){return function(c){var l=mc(r)()(M.value)(c),_=wc(n)(a)(M.value)(c);return{cache:no(ce(t)(M.value))(!1)(_.cache),element:function(i){return function(f){return U(In(e.Monad0().Applicative0()))(_e(e.Monad0().Applicative0())(e)({parent:ce(t)(M.value)+a,scope:i.scope,raiseId:function(d){return y(e.Monad0().Applicative0())(void 0)}})(f)(l))(_.element(i)(f))}}}}}}}}}}}};var Wn=Tb,Ac=function(n){return function(t){return function(){return function(){return function(r){return function(e){return function(a){return function(u){return function(c){var l=function(_){return function(i){return br(function(f){return g(r.Monad0().Bind1())(i.ids)(function(d){return g(r.Monad0().Bind1())(i.ids)(function(m){return Bn(zn)(r.Monad0().Bind1())(_.raiseId(d))(function(){var o=wc(e)(m)(M.value)(c);return s(r.Monad0().Bind1().Apply0().Functor0())(bn(r.Monad0().Bind1().Apply0())(f(i.deleteFromCache({id:d}))))(Gt(U(In(r.Monad0().Applicative0()))($(r.Monad0().Applicative0())(i.makePursx({id:d,parent:_.parent,cache:o.cache,pxScope:m,scope:_.scope,html:ce(n)(u),verb:ce(t)(a)})))(o.element(_)(i)))(f))})})})})}};return new Mn(l)}}}}}}}}},$t=function(n){return function(){return function(){return function(t){return function(r){return Ac(n)({reflectType:function(){return"~"}})()()(r)(t)(M.value)}}}}},cp=function(n){return function(){return function(t){return function(r){return function(e){return $t(n)()()(r)(t)(e)({})}}}}};var Eb=function(){return M.value}(),lp=function(n){return function(t){return $t({reflectType:function(){return`<div>
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
</div>`}})()()(On()(Rt()(On()(Mt(n.Monad0().Applicative0()))({reflectType:function(){return"result"}})({reflectSymbol:function(){return"result"}})(n))({reflectType:function(){return"next"}})({reflectSymbol:function(){return"next"}})(n))({reflectType:function(){return"code"}})({reflectSymbol:function(){return"code"}})(n))(n)(Eb)({code:Wn(xt(n)([Ft(n)([wn(n.Monad0())(`module Main where

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
  )`)])])),result:Wn(Pn(n)([op(n)([wn(n.Monad0())("I do nothing")]),fp(n)(s(rt)(function(){var r=ip(n),e=y(vo),a=wn(n.Monad0());return function(u){return r(e(a(u)))}}())(["A","B","C"])),Pn(n)([yi(n)($(n.Monad0().Applicative0())(rn(ep)(rp.value)("https://example.com")))([wn(n.Monad0())("foo ")]),up(n)([wn(n.Monad0())(" bar ")]),Ca(n)($(n.Monad0().Applicative0())(rn(ro)(rr.value)("font-weight: 800;")))([wn(n.Monad0())(" baz")])]),Pn(n)([Pn(n)([Pn(n)([ta(n)($(n.Monad0().Applicative0())(rn(bi)(eo.value)("range")))([])])])])])),next:$(n.Monad0().Applicative0())(rn(ft)(Kn.value)(Vn(T(bn(Pt)(t(Ko.value))(zt)))))})}};function sp(n,t,r,e,a){return function(u,c){var l=n.newXHR(),_=n.fixupUrl(a.url,l);if(l.open(a.method||"GET",_,!0,a.username,a.password),a.headers)try{for(var i=0,f;(f=a.headers[i])!=null;i++)l.setRequestHeader(f.field,f.value)}catch(m){u(m)}var d=function(m){return function(){u(new Error(m))}};return l.onerror=d(r),l.ontimeout=d(t),l.onload=function(){c({status:l.status,statusText:l.statusText,headers:l.getAllResponseHeaders().split(`\r
`).filter(function(m){return m.length>0}).map(function(m){var o=m.indexOf(":");return e(m.substring(0,o))(m.substring(o+2))}),body:l.response})},l.responseType=a.responseType,l.withCredentials=a.withCredentials,l.timeout=a.timeout,l.send(a.content),function(m,o,p){try{l.abort()}catch(sn){return o(sn)}return p()}}}var Ti="application/json",_p="application/x-www-form-urlencoded";var mp=function(){function n(t){this.value0=t}return n.create=function(t){return new n(t)},n}(),vp=function(){function n(t){this.value0=t}return n.create=function(t){return new n(t)},n}(),dp=function(){function n(t){this.value0=t}return n.create=function(t){return new n(t)},n}(),Dp=function(){function n(t){this.value0=t}return n.create=function(t){return new n(t)},n}(),yp=function(){function n(t){this.value0=t}return n.create=function(t){return new n(t)},n}(),Lc=function(){function n(t){this.value0=t}return n.create=function(t){return new n(t)},n}(),Ic=function(){function n(t){this.value0=t}return n.create=function(t){return new n(t)},n}(),gp=function(n){return n instanceof Lc?new v(_p):n instanceof Ic?new v(Ti):D.value};var Ei=function(){function n(t){this.value0=t}return n.create=function(t){return new n(t)},n}(),Fi=function(){function n(t){this.value0=t}return n.create=function(t){return new n(t)},n}(),bp=function(){function n(t,r){this.value0=t,this.value1=r}return n.create=function(t){return function(r){return new n(t,r)}},n}(),hp=function(n){if(n instanceof Ei)return or()(n.value0);if(n instanceof Fi)return or()(n.value0);if(n instanceof bp)return n.value1;throw new Error("Failed pattern match at Affjax.RequestHeader (line 26, column 1 - line 26, column 33): "+[n.constructor.name])};var $c=function(n){if(n instanceof Ei)return"Accept";if(n instanceof Fi)return"Content-Type";if(n instanceof bp)return n.value0;throw new Error("Failed pattern match at Affjax.RequestHeader (line 21, column 1 - line 21, column 32): "+[n.constructor.name])};var Sc=function(){function n(t){this.value0=t}return n.create=function(t){return new n(t)},n}(),kc=function(){function n(t){this.value0=t}return n.create=function(t){return new n(t)},n}(),Pc=function(){function n(t){this.value0=t}return n.create=function(t){return new n(t)},n}(),au=function(){function n(t){this.value0=t}return n.create=function(t){return new n(t)},n}(),Nc=function(){function n(t){this.value0=t}return n.create=function(t){return new n(t)},n}(),xi=function(){function n(t){this.value0=t}return n.create=function(t){return new n(t)},n}(),Cp=function(n){if(n instanceof Sc)return"arraybuffer";if(n instanceof kc)return"blob";if(n instanceof Pc)return"document";if(n instanceof au||n instanceof Nc)return"text";if(n instanceof xi)return"";throw new Error("Failed pattern match at Affjax.ResponseFormat (line 44, column 3 - line 50, column 19): "+[n.constructor.name])},Tp=function(n){return n instanceof au?new v(Ti):D.value};var Ep=function(){return new au(Q(Y))}(),Fp=function(){return new xi(Q(Y))}();var Mp=function(){function n(t,r){this.value0=t,this.value1=r}return n.create=function(t){return function(r){return new n(t,r)}},n}();function ou(n){return n.message}var Zr=function(n){return n.throwError};var ke=function(n){return n.catchError};var Mi=function(n){return function(t){return ke(n)(s(n.MonadThrow0().Monad0().Bind1().Apply0().Functor0())(k.create)(t))(function(){var r=y(n.MonadThrow0().Monad0().Applicative0());return function(e){return r(R.create(e))}}())}};var ve=function(n){return n.state};var ao=function(n){return function(t){return ve(n)(function(r){var e=t(r);return new E(e,e)})}};var ne=function(n){return n.liftEffect};var Wc=function(n){return n};var Uc=function(n){return n};var $i=function(n){return function(t){return n(t)}},Lp=function(n){return{map:function(t){return $i(s(n)(s(La)(t)))}}};var Hc=function(n){return{Applicative0:function(){return Fa(n)},Bind1:function(){return qc(n)}}},qc=function(n){return{bind:function(t){return function(r){return g(n.Bind1())(t)(Or(function(){var e=y(n.Applicative0());return function(a){return e(R.create(a))}}())(function(e){var a=r(e);return a}))}},Apply0:function(){return Ip(n)}}},Ip=function(n){return{apply:Sr(Hc(n)),Functor0:function(){return Lp(n.Bind1().Apply0().Functor0())}}},Fa=function(n){return{pure:function(){var t=y(n.Applicative0());return function(r){return Wc(t(k.create(r)))}}(),Apply0:function(){return Ip(n)}}};var $p=function(n){return{throwError:function(){var t=y(n.Applicative0());return function(r){return Wc(t(R.create(r)))}}(),Monad0:function(){return Hc(n)}}};var Bc=function(n){return function(t){return{alt:function(r){return function(e){return g(t.Bind1())(r)(function(a){if(a instanceof k)return y(t.Applicative0())(new k(a.value0));if(a instanceof R)return g(t.Bind1())(e)(function(u){if(u instanceof k)return y(t.Applicative0())(new k(u.value0));if(u instanceof R)return y(t.Applicative0())(new R(A(n)(a.value0)(u.value0)));throw new Error("Failed pattern match at Control.Monad.Except.Trans (line 86, column 9 - line 88, column 49): "+[u.constructor.name])});throw new Error("Failed pattern match at Control.Monad.Except.Trans (line 82, column 5 - line 88, column 49): "+[a.constructor.name])})}},Functor0:function(){return Lp(t.Bind1().Apply0().Functor0())}}}};var Sp=function(){var n=or();return function(t){return n(Uc(t))}}();function zc(n){return JSON.stringify(n)}function Vc(n){return function(t){return JSON.stringify(t,null,n)}}var kp=Ye;function Np(n,t,r){try{return t(JSON.parse(r))}catch(e){return n(e.message)}}var Rp=function(n){return Np(R.create,k.create,n)};var Jc=function(n){return function(t){return t.join(n)}};function qb(n){return n.replace(/[!'()*]/g,function(t){return"%"+t.charCodeAt(0).toString(16)})}var Up=function(t,r,e){try{return r(qb(encodeURIComponent(e)).replace(/%20/g,"+"))}catch(a){return t(a)}};var Pi=function(){return lc(Up)(T(D.value))(v.create)}();var Vb=function(n){return n};var Hp=function(){var n=function(e){if(e.value1 instanceof D)return Pi(e.value0);if(e.value1 instanceof v)return yn(sa)(s(nt)(function(a){return function(u){return a+("="+u)}})(Pi(e.value0)))(Pi(e.value1.value0));throw new Error("Failed pattern match at Data.FormURLEncoded (line 37, column 16 - line 39, column 114): "+[e.constructor.name])},t=s(nt)(Jc("&")),r=ur(Ve)(qe)(n);return function(e){return t(r(Vb(e)))}}();var jb=function(){function n(){}return n.value=new n,n}(),su=function(){function n(){}return n.value=new n,n}(),Gb=function(){function n(){}return n.value=new n,n}(),qp=function(){function n(){}return n.value=new n,n}(),Bp=function(){function n(){}return n.value=new n,n}(),zp=function(){function n(){}return n.value=new n,n}(),Xb=function(){function n(){}return n.value=new n,n}(),Qb=function(){function n(){}return n.value=new n,n}(),Kb=function(){function n(){}return n.value=new n,n}(),Yb=function(){function n(){}return n.value=new n,n}(),Zb=function(){function n(){}return n.value=new n,n}(),nh=function(){function n(){}return n.value=new n,n}(),th=function(){function n(){}return n.value=new n,n}(),rh=function(){function n(){}return n.value=new n,n}(),eh=function(){function n(){}return n.value=new n,n}(),Vp=function(){function n(){}return n.value=new n,n}();var ah=function(n){return n},oh={show:function(n){if(n instanceof jb)return"OPTIONS";if(n instanceof su)return"GET";if(n instanceof Gb)return"HEAD";if(n instanceof qp)return"POST";if(n instanceof Bp)return"PUT";if(n instanceof zp)return"DELETE";if(n instanceof Xb)return"TRACE";if(n instanceof Qb)return"CONNECT";if(n instanceof Kb)return"PROPFIND";if(n instanceof Yb)return"PROPPATCH";if(n instanceof Zb)return"MKCOL";if(n instanceof nh)return"COPY";if(n instanceof th)return"MOVE";if(n instanceof rh)return"LOCK";if(n instanceof eh)return"UNLOCK";if(n instanceof Vp)return"PATCH";throw new Error("Failed pattern match at Data.HTTP.Method (line 43, column 1 - line 59, column 23): "+[n.constructor.name])}};var Jp=Or(N(oh))(ah);var Xp=function(){var n=ti(Zf);return function(t){return ri(n(t))}}();var Qp=function(n){return n.value0};function Yp(n,t,r){return n==null?t:r(n)}function Gc(n){return n}var uo=st(null)(Gc),Ot=function(n){return Yp(n,D.value,v.create)};var hr=function(){var n={},t="Pure",r="Throw",e="Catch",a="Sync",u="Async",c="Bind",l="Bracket",_="Fork",i="Sequential",f="Map",d="Apply",m="Alt",o="Cons",p="Resume",sn="Release",Jn="Finalizer",ct="Finalized",yt="Forked",er="Fiber",gu="Thunk";function X(S,$n,pt,Rn){this.tag=S,this._1=$n,this._2=pt,this._3=Rn}function Lr(S){var $n=function(pt,Rn,H){return new X(S,pt,Rn,H)};return $n.tag=S,$n}function uf(S){return new X(t,void 0)}function ud(S){try{S()}catch($n){setTimeout(function(){throw $n},0)}}function id(S,$n,pt){try{return $n(pt())}catch(Rn){return S(Rn)}}function fd(S,$n,pt){try{return $n(pt)()}catch(Rn){return pt(S(Rn))(),uf}}var bu=function(){var S=1024,$n=0,pt=0,Rn=new Array(S),H=!1;function w(){var Nn;for(H=!0;$n!==0;)$n--,Nn=Rn[pt],Rn[pt]=void 0,pt=(pt+1)%S,Nn();H=!1}return{isDraining:function(){return H},enqueue:function(Nn){var dn,lt;$n===S&&(lt=H,w(),H=lt),Rn[(pt+$n)%S]=Nn,$n++,H||w()}}}();function cd(S){var $n={},pt=0,Rn=0;return{register:function(H){var w=pt++;H.onComplete({rethrow:!0,handler:function(Nn){return function(){Rn--,delete $n[w]}}})(),$n[w]=H,Rn++},isEmpty:function(){return Rn===0},killAll:function(H,w){return function(){if(Rn===0)return w();var Nn=0,dn={};function lt(qn){dn[qn]=$n[qn].kill(H,function(gt){return function(){delete dn[qn],Nn--,S.isLeft(gt)&&S.fromLeft(gt)&&setTimeout(function(){throw S.fromLeft(gt)},0),Nn===0&&w()}})()}for(var Ut in $n)$n.hasOwnProperty(Ut)&&(Nn++,lt(Ut));return $n={},pt=0,Rn=0,function(qn){return new X(a,function(){for(var gt in dn)dn.hasOwnProperty(gt)&&dn[gt]()})}}}}}var xa=0,lr=1,hu=2,Cu=3,Tu=4,Cr=5,so=6;function ff(S,$n,pt){var Rn=0,H=xa,w=pt,Nn=null,dn=null,lt=null,Ut=null,qn=null,gt=0,ua=0,Ir=null,Re=!0;function Oe(q){for(var B,En,An;;)switch(B=null,En=null,An=null,H){case hu:H=lr;try{w=lt(w),Ut===null?lt=null:(lt=Ut._1,Ut=Ut._2)}catch(Vt){H=Cr,Nn=S.left(Vt),w=null}break;case Cu:S.isLeft(w)?(H=Cr,Nn=w,w=null):lt===null?H=Cr:(H=hu,w=S.fromRight(w));break;case lr:switch(w.tag){case c:lt&&(Ut=new X(o,lt,Ut)),lt=w._2,H=lr,w=w._1;break;case t:lt===null?(H=Cr,w=S.right(w._1)):(H=hu,w=w._1);break;case a:H=Cu,w=id(S.left,S.right,w._1);break;case u:H=Tu,w=fd(S.left,w._1,function(Vt){return function(){Rn===q&&(Rn++,bu.enqueue(function(){Rn===q+1&&(H=Cu,w=Vt,Oe(Rn))}))}});return;case r:H=Cr,Nn=S.left(w._1),w=null;break;case e:lt===null?qn=new X(o,w,qn,dn):qn=new X(o,w,new X(o,new X(p,lt,Ut),qn,dn),dn),lt=null,Ut=null,H=lr,w=w._1;break;case l:gt++,lt===null?qn=new X(o,w,qn,dn):qn=new X(o,w,new X(o,new X(p,lt,Ut),qn,dn),dn),lt=null,Ut=null,H=lr,w=w._1;break;case _:H=Cu,B=ff(S,$n,w._2),$n&&$n.register(B),w._1&&B.run(),w=S.right(B);break;case i:H=lr,w=sd(S,$n,w._1);break}break;case Cr:if(lt=null,Ut=null,qn===null)H=so,w=dn||Nn||w;else switch(B=qn._3,An=qn._1,qn=qn._2,An.tag){case e:dn&&dn!==B&&gt===0?H=Cr:Nn&&(H=lr,w=An._2(S.fromLeft(Nn)),Nn=null);break;case p:dn&&dn!==B&&gt===0||Nn?H=Cr:(lt=An._1,Ut=An._2,H=hu,w=S.fromRight(w));break;case l:gt--,Nn===null&&(En=S.fromRight(w),qn=new X(o,new X(sn,An._2,En),qn,B),(dn===B||gt>0)&&(H=lr,w=An._3(En)));break;case sn:qn=new X(o,new X(ct,w,Nn),qn,dn),H=lr,dn&&dn!==B&&gt===0?w=An._1.killed(S.fromLeft(dn))(An._2):Nn?w=An._1.failed(S.fromLeft(Nn))(An._2):w=An._1.completed(S.fromRight(w))(An._2),Nn=null,gt++;break;case Jn:gt++,qn=new X(o,new X(ct,w,Nn),qn,dn),H=lr,w=An._1;break;case ct:gt--,H=Cr,w=An._1,Nn=An._2;break}break;case so:for(var vt in Ir)Ir.hasOwnProperty(vt)&&(Re=Re&&Ir[vt].rethrow,ud(Ir[vt].handler(w)));Ir=null,dn&&Nn?setTimeout(function(){throw S.fromLeft(Nn)},0):S.isLeft(w)&&Re&&setTimeout(function(){if(Re)throw S.fromLeft(w)},0);return;case xa:H=lr;break;case Tu:return}}function mt(q){return function(){if(H===so)return Re=Re&&q.rethrow,q.handler(w)(),function(){};var B=ua++;return Ir=Ir||{},Ir[B]=q,function(){Ir!==null&&delete Ir[B]}}}function z(q,B){return function(){if(H===so)return B(S.right(void 0))(),function(){};var En=mt({rethrow:!1,handler:function(){return B(S.right(void 0))}})();switch(H){case xa:dn=S.left(q),H=so,w=dn,Oe(Rn);break;case Tu:dn===null&&(dn=S.left(q)),gt===0&&(H===Tu&&(qn=new X(o,new X(Jn,w(q)),qn,dn)),H=Cr,w=null,Nn=null,Oe(++Rn));break;default:dn===null&&(dn=S.left(q)),gt===0&&(H=Cr,w=null,Nn=null)}return En}}function Dn(q){return function(){var B=mt({rethrow:!1,handler:q})();return H===xa&&Oe(Rn),B}}return{kill:z,join:Dn,onComplete:mt,isSuspended:function(){return H===xa},run:function(){H===xa&&(bu.isDraining()?Oe(Rn):bu.enqueue(function(){Oe(Rn)}))}}}function ld(S,$n,pt,Rn){var H=0,w={},Nn=0,dn={},lt=new Error("[ParAff] Early exit"),Ut=null,qn=n;function gt(mt,z,Dn){var q=z,B=null,En=null,An=0,vt={},Vt,_o;n:for(;;)switch(Vt=null,q.tag){case yt:if(q._3===n&&(Vt=w[q._1],vt[An++]=Vt.kill(mt,function(_d){return function(){An--,An===0&&Dn(_d)()}})),B===null)break n;q=B._2,En===null?B=null:(B=En._1,En=En._2);break;case f:q=q._2;break;case d:case m:B&&(En=new X(o,B,En)),B=q,q=q._1;break}if(An===0)Dn(S.right(void 0))();else for(_o=0,Vt=An;_o<Vt;_o++)vt[_o]=vt[_o]();return vt}function ua(mt,z,Dn){var q,B,En,An,vt,Vt;S.isLeft(mt)?(q=mt,B=null):(B=mt,q=null);n:for(;;){if(En=null,An=null,vt=null,Vt=null,Ut!==null)return;if(z===null){Rn(q||B)();return}if(z._3!==n)return;switch(z.tag){case f:q===null?(z._3=S.right(z._1(S.fromRight(B))),B=z._3):z._3=q;break;case d:if(En=z._1._3,An=z._2._3,q){if(z._3=q,vt=!0,Vt=Nn++,dn[Vt]=gt(lt,q===En?z._2:z._1,function(){return function(){delete dn[Vt],vt?vt=!1:Dn===null?ua(q,null,null):ua(q,Dn._1,Dn._2)}}),vt){vt=!1;return}}else{if(En===n||An===n)return;B=S.right(S.fromRight(En)(S.fromRight(An))),z._3=B}break;case m:if(En=z._1._3,An=z._2._3,En===n&&S.isLeft(An)||An===n&&S.isLeft(En))return;if(En!==n&&S.isLeft(En)&&An!==n&&S.isLeft(An))q=B===En?An:En,B=null,z._3=q;else if(z._3=B,vt=!0,Vt=Nn++,dn[Vt]=gt(lt,B===En?z._2:z._1,function(){return function(){delete dn[Vt],vt?vt=!1:Dn===null?ua(B,null,null):ua(B,Dn._1,Dn._2)}}),vt){vt=!1;return}break}Dn===null?z=null:(z=Dn._1,Dn=Dn._2)}}function Ir(mt){return function(z){return function(){delete w[mt._1],mt._3=z,ua(z,mt._2._1,mt._2._2)}}}function Re(){var mt=lr,z=pt,Dn=null,q=null,B,En;n:for(;;)switch(B=null,En=null,mt){case lr:switch(z.tag){case f:Dn&&(q=new X(o,Dn,q)),Dn=new X(f,z._1,n,n),z=z._2;break;case d:Dn&&(q=new X(o,Dn,q)),Dn=new X(d,n,z._2,n),z=z._1;break;case m:Dn&&(q=new X(o,Dn,q)),Dn=new X(m,n,z._2,n),z=z._1;break;default:En=H++,mt=Cr,B=z,z=new X(yt,En,new X(o,Dn,q),n),B=ff(S,$n,B),B.onComplete({rethrow:!1,handler:Ir(z)})(),w[En]=B,$n&&$n.register(B)}break;case Cr:if(Dn===null)break n;Dn._1===n?(Dn._1=z,mt=lr,z=Dn._2,Dn._2=n):(Dn._2=z,z=Dn,q===null?Dn=null:(Dn=q._1,q=q._2))}for(qn=z,En=0;En<H;En++)w[En].run()}function Oe(mt,z){Ut=S.left(mt);var Dn;for(var q in dn)if(dn.hasOwnProperty(q)){Dn=dn[q];for(q in Dn)Dn.hasOwnProperty(q)&&Dn[q]()}dn=null;var B=gt(mt,qn,z);return function(En){return new X(u,function(An){return function(){for(var vt in B)B.hasOwnProperty(vt)&&B[vt]();return uf}})}}return Re(),function(mt){return new X(u,function(z){return function(){return Oe(mt,z)}})}}function sd(S,$n,pt){return new X(u,function(Rn){return function(){return ld(S,$n,pt,Rn)}})}return X.EMPTY=n,X.Pure=Lr(t),X.Throw=Lr(r),X.Catch=Lr(e),X.Sync=Lr(a),X.Async=Lr(u),X.Bind=Lr(c),X.Bracket=Lr(l),X.Fork=Lr(_),X.Seq=Lr(i),X.ParMap=Lr(f),X.ParApply=Lr(d),X.ParAlt=Lr(m),X.Fiber=ff,X.Supervisor=cd,X.Scheduler=bu,X.nonCanceler=uf,X}(),nm=hr.Pure,tm=hr.Throw;function rm(n){return function(t){return hr.Catch(n,t)}}function em(n){return function(t){return t.tag===hr.Pure.tag?hr.Pure(n(t._1)):hr.Bind(t,function(r){return hr.Pure(n(r))})}}function am(n){return function(t){return hr.Bind(n,t)}}var om=hr.Sync;var _u=hr.Async;function um(n,t){return function(){return hr.Fiber(n,null,t)}}var ih=function(){function n(r,e){return r===0&&typeof setImmediate<"u"?setImmediate(e):setTimeout(e,r)}function t(r,e){return r===0&&typeof clearImmediate<"u"?clearImmediate(e):clearTimeout(e)}return function(r,e){return hr.Async(function(a){return function(){var u=n(e,a(r()));return function(){return hr.Sync(function(){return r(t(e,u))})}}})}}(),fh=hr.Seq;var Ch=function(n,t,r){var e=0,a;return function(u){if(e===2)return a;if(e===1)throw new ReferenceError(n+" was needed before it finished initializing (module "+t+", line "+u+")",t,u);return e=1,a=r(),e=2,a}};var Kc={map:em};var Th=function(){var n=function(e){if(e instanceof k)return e.value0;if(e instanceof R)return Kr("unsafeFromRight: Left");throw new Error("Failed pattern match at Effect.Aff (line 407, column 21 - line 409, column 54): "+[e.constructor.name])},t=function(e){if(e instanceof R)return e.value0;if(e instanceof k)return Kr("unsafeFromLeft: Right");throw new Error("Failed pattern match at Effect.Aff (line 402, column 20 - line 404, column 55): "+[e.constructor.name])},r=function(e){if(e instanceof R)return!0;if(e instanceof k)return!1;throw new Error("Failed pattern match at Effect.Aff (line 397, column 12 - line 399, column 21): "+[e.constructor.name])};return{isLeft:r,fromLeft:t,fromRight:n,left:R.create,right:k.create}}(),Eh=function(n){return um(Th,n)},Fh=function(n){return function(){var r=Eh(n)();return r.run(),r}},sm=function(){var n=V(xn);return function(t){return n(Fh(t))}}();var Yc={Applicative0:function(){return Ni},Bind1:function(){return Zc}},Zc={bind:am,Apply0:function(){return _m(0)}},Ni={pure:nm,Apply0:function(){return _m(0)}},_m=Ch("applyAff","Effect.Aff",function(){return{apply:Sr(Yc),Functor0:function(){return Kc}}});var nl={liftEffect:om,Monad0:function(){return Yc}};var xh={throwError:tm,Monad0:function(){return Yc}},pm={catchError:rm,MonadThrow0:function(){return xh}};var mm=T(y(Ni)(void 0));var gm=function(n){return _u(function(t){return function(){var e=n(function(a){return t(R.create(a))()},function(a){return t(k.create(a))()});return function(a){return _u(function(u){return function(){return e(a,function(l){return u(R.create(l))()},function(l){return u(k.create(l))()}),mm}})}}})};function Ri(n){return Object.prototype.toString.call(n).slice(8,-1)}var bm=Array.isArray||function(n){return Object.prototype.toString.call(n)==="[object Array]"};var hm=function(n){return function(t){return function(r){return(r|0)===r?n(r):t}}},cr=function(n){return n};var Oi=isFinite;var al=Math.floor;var pu=function(n){return function(t){return n%t}};var Wi=function(){return hm(v.create)(D.value)}(),Qh=function(n){if(!Oi(n))return 0;if(n>=cr(Pr(la)))return Pr(la);if(n<=cr(Br(la)))return Br(la);if(Xt)return Kt(0)(Wi(n));throw new Error("Failed pattern match at Data.Int (line 72, column 1 - line 72, column 29): "+[n.constructor.name])};var ul=function(n){return Qh(al(n))};var il=function(){function n(t){this.value0=t}return n.create=function(t){return new n(t)},n}(),Lm=function(){function n(t,r){this.value0=t,this.value1=r}return n.create=function(t){return function(r){return new n(t,r)}},n}(),eC=function(){function n(t,r){this.value0=t,this.value1=r}return n.create=function(t){return function(r){return new n(t,r)}},n}(),aC=function(){function n(t,r){this.value0=t,this.value1=r}return n.create=function(t){return function(r){return new n(t,r)}},n}(),ea=C,oC=C;var Hi=function(n){if(n instanceof il)return n.value0;if(n instanceof eC)return"Error at array index "+(N(Rr)(n.value0)+(": "+Hi(n.value1)));if(n instanceof aC)return"Error at property "+(N(Nr)(n.value0)+(": "+Hi(n.value1)));if(n instanceof Lm)return"Type mismatch: expected "+(n.value0+(", found "+n.value1));throw new Error("Failed pattern match at Foreign (line 78, column 1 - line 78, column 45): "+[n.constructor.name])};var fl=function(n){var t=Zr($p(n));return function(r){return t(Xp(r))}};var aa=function(n){return function(t){return function(r){if(Ri(r)===t)return y(Fa(n))(oC(r));if(Xt)return fl(n)(new Lm(t,Ri(r)));throw new Error("Failed pattern match at Foreign (line 123, column 1 - line 123, column 104): "+[t.constructor.name,r.constructor.name])}}};var cl=function(){function n(t){this.value0=t}return n.create=function(t){return new n(t)},n}(),ll=function(){function n(t,r){this.value0=t,this.value1=r}return n.create=function(t){return function(r){return new n(t,r)}},n}(),sl=function(){function n(){}return n.value=new n,n}(),_l=function(){function n(){}return n.value=new n,n}(),pl=function(){function n(t){this.value0=t}return n.create=function(t){return new n(t)},n}(),Im=function(n){return function(t){var r=function(f){return f===""?y(Fa(_t))(kp):Or(function(){var d=fl(_t);return function(m){return d(il.create(m))}}())(y(Fa(_t)))(Rp(f))},e=function(){if(t.responseFormat instanceof Sc)return aa(_t)("ArrayBuffer");if(t.responseFormat instanceof kc)return aa(_t)("Blob");if(t.responseFormat instanceof Pc)return function(f){return U(Bc(Yf)(_t))(aa(_t)("Document")(f))(U(Bc(Yf)(_t))(aa(_t)("XMLDocument")(f))(aa(_t)("HTMLDocument")(f)))};if(t.responseFormat instanceof au)return Fu(qc(_t))(function(f){return t.responseFormat.value0(r(f))})(aa(_t)("String"));if(t.responseFormat instanceof Nc)return aa(_t)("String");if(t.responseFormat instanceof xi)return T(t.responseFormat.value0(y(Fa(_t))(void 0)));throw new Error("Failed pattern match at Affjax (line 274, column 18 - line 283, column 57): "+[t.responseFormat.constructor.name])}(),a=function(f){if(f instanceof mp)return new k(f.value0(ea));if(f instanceof vp)return new k(ea(f.value0));if(f instanceof dp)return new k(ea(f.value0));if(f instanceof Dp)return new k(ea(f.value0));if(f instanceof yp)return new k(ea(f.value0));if(f instanceof Lc)return vf("Body contains values that cannot be encoded as application/x-www-form-urlencoded")(s(nt)(ea)(Hp(f.value0)));if(f instanceof Ic)return new k(ea(zc(f.value0)));throw new Error("Failed pattern match at Affjax (line 235, column 20 - line 250, column 69): "+[f.constructor.name])},u=function(f){return function(d){return f instanceof v&&!ze(Sn)(Zt)(cf(pn(We))($c)(f.value0))(d)?Bf(d)(f.value0):d}},c=function(f){return u(s(nt)(Fi.create)(De(vr)(gp)(f)))(u(s(nt)(Ei.create)(Tp(t.responseFormat)))(t.headers))},l=function(f){return{method:Jp(t.method),url:t.url,headers:s(rt)(function(d){return{field:$c(d),value:hp(d)}})(c(t.content)),content:f,responseType:Cp(t.responseFormat),username:uo(t.username),password:uo(t.password),withCredentials:t.withCredentials,timeout:Kt(0)(s(nt)(function(d){return d})(t.timeout))}},_=function(f){return Hr(Kc)(Mi(pm)(gm(sp(n,"AffjaxTimeoutErrorMessageIdent","AffjaxRequestFailedMessageIdent",Mp.create,l(f)))))(function(d){if(d instanceof k){var m=Sp(e(d.value0.body));if(m instanceof R)return new R(new ll(Qp(m.value0),d.value0));if(m instanceof k)return new k({body:m.value0,headers:d.value0.headers,status:d.value0.status,statusText:d.value0.statusText});throw new Error("Failed pattern match at Affjax (line 209, column 9 - line 211, column 52): "+[m.constructor.name])}if(d instanceof R)return new R(function(){var o=ou(d.value0),p=o==="AffjaxTimeoutErrorMessageIdent";if(p)return sl.value;var sn=o==="AffjaxRequestFailedMessageIdent";return sn?_l.value:new pl(d.value0)}());throw new Error("Failed pattern match at Affjax (line 207, column 144 - line 219, column 28): "+[d.constructor.name])})};if(t.content instanceof D)return _(uo(D.value));if(t.content instanceof v){var i=a(t.content.value0);if(i instanceof k)return _(uo(new v(i.value0)));if(i instanceof R)return y(Ni)(new R(new cl(i.value0)));throw new Error("Failed pattern match at Affjax (line 199, column 7 - line 203, column 48): "+[i.constructor.name])}throw new Error("Failed pattern match at Affjax (line 195, column 3 - line 203, column 48): "+[t.content.constructor.name])}},ml=function(n){if(n instanceof cl)return"There was a problem with the request content: "+n.value0;if(n instanceof ll)return"There was a problem with the response body: "+Hi(n.value0);if(n instanceof sl)return"There was a problem making the request: timeout";if(n instanceof _l)return"There was a problem making the request: request failed";if(n instanceof pl)return"There was a problem making the request: "+ou(n.value0);throw new Error("Failed pattern match at Affjax (line 113, column 14 - line 123, column 66): "+[n.constructor.name])},oa=function(){return{method:new R(su.value),url:"/",headers:[],content:D.value,username:D.value,password:D.value,withCredentials:!1,responseFormat:Fp,timeout:D.value}}();var vl={newXHR:function(){return new XMLHttpRequest},fixupUrl:function(n){return n||"/"}};var Sm=Im(vl);var Pm=function(){function n(){}return n.value=new n,n}(),dl=function(){function n(t){this.value0=t}return n.create=function(t){return new n(t)},n}(),cC=function(){return M.value}(),km="Click to get some random user data.",lC=function(n){return Vn(T(function(){return n(Pm.value)(),sm(g(Zc)(Sm({method:new R(su.value),url:"https://randomuser.me/api/",headers:oa.headers,content:oa.content,username:oa.username,password:oa.password,withCredentials:oa.withCredentials,responseFormat:Ep,timeout:oa.timeout}))(function(r){if(r instanceof R)return ne(nl)(n(new dl("GET /api response failed to decode: "+ml(r.value0))));if(r instanceof k)return ne(nl)(n(new dl(Vc(2)(r.value0.body))));throw new Error("Failed pattern match at Deku.Example.Docs.Effects (line 44, column 9 - line 51, column 48): "+[r.constructor.name])}))()}))},Nm=function(n){return function(t){return function(r){return $t({reflectType:function(){return`<div>
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
</div>`}})()()(On()(Rt()(On()(Mt(n.Monad0().Applicative0()))({reflectType:function(){return"result"}})({reflectSymbol:function(){return"result"}})(n))({reflectType:function(){return"next"}})({reflectSymbol:function(){return"next"}})(n))({reflectType:function(){return"code"}})({reflectSymbol:function(){return"code"}})(n))(n)(cC)({code:Wn(xt(n)([Ft(n)([wn(n.Monad0())(`module Main where

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
`)])])),result:Wn(Za(n)(Lt(ht)(s(At)(Dr(t)))(function(e){return function(a){var u=ir(Yr(n.Monad0().Applicative0()))(function(_){return _ instanceof Pm?new v(new R(void 0)):_ instanceof dl?new v(new k(_.value0)):D.value})(a),c=ir(Yr(n.Monad0().Applicative0()))(function(_){return _ instanceof k?new v(_.value0):D.value})(u),l=ir(Yr(n.Monad0().Applicative0()))(function(_){return _ instanceof R?new v(void 0):D.value})(u);return Pn(n)([Pn(n)([fr(n)($(n.Monad0().Applicative0())(rn(ft)(Kn.value)(lC(e))))([wr(n.Monad0())(U(In(n.Monad0().Applicative0()))($(n.Monad0().Applicative0())(km))(U(In(n.Monad0().Applicative0()))($r(Gn)(l)("Loading..."))($r(Gn)(c)(km))))])]),Fc(n)(U(In(n.Monad0().Applicative0()))($(n.Monad0().Applicative0())(rn(Ec)(rr.value)("display: none;")))($r(Gn)(ba(Vo(n.Monad0().Applicative0()))(ha(It(n))(function(_){return function(i){return new E(i&&!1,function(){return i?new v(void 0):D.value}())}})(c)(!0)))(rn(Ec)(rr.value)("display: block;"))))([xt(n)([Ft(n)([wr(n.Monad0())(U(In(n.Monad0().Applicative0()))($(n.Monad0().Applicative0())(""))(c))])])])])}}))),next:$(n.Monad0().Applicative0())(rn(ft)(Kn.value)(Vn(T(bn(Pt)(r(Yo.value))(zt)))))})}}};function Wm(n){var t={};for(var r in n)({}).hasOwnProperty.call(n,r)&&(t[r]=n[r]);return t}function Um(n){return function(t){return function(r){return r[n]=t(r[n]),r}}}var Hm=ia;var qm=function(){return function(){return function(n){return function(t){return function(r){return function(e){return Um(kt(n)(t))(r)(e)}}}}}};var Bm=Y,zm=function(n){return function(t){return n(Wm(t))}};var CC=function(n){return n},TC=function(n){return n.mappingWithIndex};var EC=function(n){return n.mapping};var qi={mapRecordWithIndexBuilder:function(n){return function(t){return Q(Bm)}}},Vm=function(n){return n.mapRecordWithIndexBuilder},io=function(n){return function(t){return function(r){return function(){return function(){return{mapRecordWithIndexBuilder:function(e){return function(a){return fa(Hm)(qm()()(n)(M.value)(TC(t)(a)(M.value)))(Vm(r)(M.value)(a))}}}}}}}};var Bi=function(){return function(n){return{hmap:function(){var t=Vm(n)(M.value);return function(r){return zm(t(CC(r)))}}()}}};var Jm=function(n){return n.hmap},fo=function(n){return{mappingWithIndex:function(t){return function(r){return EC(n)(t)}}}};var FC=function(){function n(){}return n.value=new n,n}(),co=function(n){return{mapping:function(t){return s(At)(Dr(n))}}},zi=function(n){return Jm(n)(FC.value)};var Vi=function(){function n(){}return n.value=new n,n}();var Ji={attr:function(n){return function(t){return ot({key:"input",value:va(t)})}}};function Xm(n){return n.target}var Xi=function(n){return Ot(Xm(n))};function yl(n){return function(){return n.value}}function gl(n){return function(){return n.valueAsNumber}}function Ym(n,t,r,e){if(typeof window<"u"){var a=window[r];if(a!=null&&e instanceof a)return t(e)}for(var u=e;u!=null;){var c=Object.getPrototypeOf(u),l=c.constructor.name;if(l===r)return t(e);if(l==="Object")return n;u=c}return n}var L=function(n){return function(t){return Ym(D.value,v.create,n,t)}};var Qi=L("HTMLInputElement");var Ki=function(n){var t=U(In(n))($(n)(rn(bi)(eo.value)("range"))),r=s(Gn)(function(e){return rn(Ji)(Vi.value)(Vn(function(a){return ue(dr)(gr)(g(vr)(Xi(a))(Qi))(xu(_a)(gl)(e))}))});return function(e){return t(r(e))}},Yi=function(n){return function(t){return function(r){return s(n)(function(){var e=rn(r)(Kn.value);return function(a){return e(function(u){return u(hn(t))}(a))}}())}}};var IC=function(){return M.value}(),tv=function(n){return function(t){return function(r){return $t({reflectType:function(){return`<div>
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
</div>`}})()()(On()(Rt()(On()(Mt(n.Monad0().Applicative0()))({reflectType:function(){return"result"}})({reflectSymbol:function(){return"result"}})(n))({reflectType:function(){return"next"}})({reflectSymbol:function(){return"next"}})(n))({reflectType:function(){return"code"}})({reflectSymbol:function(){return"code"}})(n))(n)(IC)({code:Wn(xt(n)([Ft(n)([wn(n.Monad0())(`module Main where

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
`)])])),result:Wn(pi()(n)(Ka({reflectSymbol:function(){return"buttonClicked"}})()()(Ka({reflectSymbol:function(){return"sliderMoved"}})()()(ci)()()()())()()()())(M.value)(Lt(ht)(zi(Bi()(io({reflectSymbol:function(){return"buttonClicked"}})(fo(co(t)))(io({reflectSymbol:function(){return"sliderMoved"}})(fo(co(t)))(qi)()())()())))(function(e){return function(a){return Pn(n)([fr(n)(Yi(Gn)(Be)(to)($(n.Monad0().Applicative0())(e.buttonClicked)))([wn(n.Monad0())("Click")]),Pn(n)([wr(n.Monad0())(U(In(n.Monad0().Applicative0()))($(n.Monad0().Applicative0())("Val: 0"))(s(Gn)(function(){var u=A(ge)("Val: "),c=N(Rr);return function(l){return u(c(l))}}())(Qe(It(n))(T(St(Er)(1)))(U(In(n.Monad0().Applicative0()))($(n.Monad0().Applicative0())(void 0))(a.buttonClicked))(-1))))]),Pn(n)([ta(n)(Ki(n.Monad0().Applicative0())($(n.Monad0().Applicative0())(e.sliderMoved)))([]),Pn(n)([wr(n.Monad0())(U(In(n.Monad0().Applicative0()))($(n.Monad0().Applicative0())("Val: 50"))(s(Gn)(function(){var u=A(ge)("Val: "),c=N(bo);return function(l){return u(c(l))}}())(a.sliderMoved)))])])])}}))),next:$(n.Monad0().Applicative0())(rn(ft)(Kn.value)(Vn(T(bn(Pt)(r(nu.value))(zt)))))})}}};var rv=function(){function n(){}return n.value=new n,n}();var ev={attr:function(n){return function(t){return ot({key:"keyup",value:va(t)})}}};function bl(n){return n.code}var av=L("KeyboardEvent");var RC=function(){function n(){}return n.value=new n,n}(),hl=function(){function n(){}return n.value=new n,n}(),ov=function(){function n(t){this.value0=t}return n.create=function(t){return new n(t)},n}(),OC=function(){return M.value}(),uv=function(n){return function(t){return function(r){return $t({reflectType:function(){return`<div>
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
    <li><code>Insert</code>, which takes an element.</li>
    <li><code>SendToTop</code>, which sends the current element to the top of its parent.</li>
    <li><code>Remove</code>, which removes the element from its parent.</li>
  </ul>

  <p>The Deku engine listens for these in a specific order. <code>Insert</code> can be followed by 0 or more <code>SendToTop</code>-s. When a <code>Remove</code> is called, the stream is unsubscribed from the parent. Because we're in the land of <code>Event</code>-s, you can emit anything, but this is the how they will be listened to.</p>

  <h2>Next steps</h2>
  <p>In this section, we used nested events to insert and remove elements from a parent. In the next section, we'll see how we can use <a ~next~ style="cursor:pointer;">portals to move an element to a different place of the DOM</a>.</p>
</div>`}})()()(On()(Rt()(On()(Mt(t.Monad0().Applicative0()))({reflectType:function(){return"result"}})({reflectSymbol:function(){return"result"}})(t))({reflectType:function(){return"next"}})({reflectSymbol:function(){return"next"}})(t))({reflectType:function(){return"code"}})({reflectSymbol:function(){return"code"}})(t))(t)(OC)({code:Wn(xt(t)([Ft(t)([wn(t.Monad0())(`module Main where

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
`)])])),result:Wn(Za(t)(Lt(ht)(s(At)(Dr(n)))(function(e){return Lt(ht)(function(a){return U(In(t.Monad0().Applicative0()))($(t.Monad0().Applicative0())(RC.value))(a)})(function(a){return Pn(t)([Pn(t)([ta(t)(oe(Sn)(Cn(t.Monad0().Applicative0()))($(t.Monad0().Applicative0()))([rn(Z_)(rr.value)("border-style:solid;border-width: 1px;border-color: black;"),rn(Ji)(Vi.value)(Vn(function(u){return ue(dr)(gr)(g(vr)(Xi(u))(Qi))(xu(_a)(yl)(function(c){return e(ov.create(c))}))})),rn(ev)(rv.value)(Vn(function(u){return ue(dr)(gr)(av(u))(function(c){return de(dr)(bl(c)==="Enter")(e(hl.value))})}))]))([]),fr(t)(U(In(t.Monad0().Applicative0()))($(t.Monad0().Applicative0())(rn(Di)(rr.value)("margin: 5px;")))($(t.Monad0().Applicative0())(rn(ft)(Kn.value)(Vn(T(e(hl.value)))))))([wn(t.Monad0())("Add")])]),Pn(t)([Ya(s(Gn)(function(u){return Xa(It(t))(Ke(t)(Lt(ht)(s(At)(Dr(n)))(function(c){return function(l){return U(In(t.Monad0().Applicative0()))($(t.Monad0().Applicative0())(new Le(Pn(t)([Ca(t)($(t.Monad0().Applicative0())(rn(ro)(rr.value)("margin: 5px;")))([wn(t.Monad0())(u)]),fr(t)(U(In(t.Monad0().Applicative0()))($(t.Monad0().Applicative0())(rn(Di)(rr.value)("margin: 5px;")))($(t.Monad0().Applicative0())(rn(ft)(Kn.value)(Vn(T(c(li.value)))))))([wn(t.Monad0())("Prioritize")]),fr(t)(U(In(t.Monad0().Applicative0()))($(t.Monad0().Applicative0())(rn(Di)(rr.value)("margin: 5px;")))($(t.Monad0().Applicative0())(rn(ft)(Kn.value)(Vn(T(c(Jo.value)))))))([wn(t.Monad0())("Delete")])]))))(l)}})))})(ir(Yr(t.Monad0().Applicative0()))(function(u){return u.value0?new v(u.value1):D.value})(ha(It(t))(function(u){return function(c){return u instanceof ov?new E(u.value0,new E(!1,u.value0)):u instanceof hl?new E(c,new E(!0,c)):new E("",new E(!1,""))}})(a)(""))))])])})}))),next:$(t.Monad0().Applicative0())(rn(ft)(Kn.value)(Vn(T(bn(Pt)(r(ru.value))(zt)))))})}}};var UC=function(){return M.value}(),iv=function(n){return function(t){return $t({reflectType:function(){return`<div>
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
</div>`}})()()(On()(Rt()(On()(Mt(n.Monad0().Applicative0()))({reflectType:function(){return"result"}})({reflectSymbol:function(){return"result"}})(n))({reflectType:function(){return"next"}})({reflectSymbol:function(){return"next"}})(n))({reflectType:function(){return"code"}})({reflectSymbol:function(){return"code"}})(n))(n)(UC)({code:Wn(xt(n)([Ft(n)([wn(n.Monad0())(`module Main where

import Prelude

import Deku.Control (text_)
import Deku.Toplevel (runInBody)
import Effect (Effect)

main :: Effect Unit
main = runInBody (text_ "Hello world")
`)])])),result:Wn(Pn(n)([wn(n.Monad0())("Hello world")])),next:Qa(It(n))(rn(ft)(Kn.value)(Vn(T(bn(Pt)(t(Qo.value))(zt)))))})}};var qC=function(){return M.value}(),fv=function(n){return function(t){return $t({reflectType:function(){return`<div>
  <h1>Deku</h1>

  <h3>A web micro-framework written in PureScript</h3>

  <p>Hi! You've found <a href="https://github.com/mikesol/purescript-deku">Deku</a>.</p>

  <p>Deku is the coolest web micro-framework that no one knows about yet. Except you, of course, as you're here. So welcome!</p>

  <p>The main goal of Deku is speed. I made it for the purpose of creating interactive web-based musical instruments, but it's equally useful as a general-purpose web framework. Its standard event-handling patterns tend to outperform those of React and Vue by a factor of 1.5-2x.</p>

  <p>This documentation is written in Deku and can be found <a href="https://github.com/mikesol/purescript-deku/tree/main/examples/docs">here</a>. One good way to follow along is by using the Deku starter repo, which you can clone <a href="https://github.com/mikesol/purescript-deku-starter">here</a>.</p>

  <p>And now, without further ado, check out the <a ~next~ style="cursor:pointer;">hello world section</a>!</p>
</div>`}})()()(Rt()(Mt(n.Monad0().Applicative0()))({reflectType:function(){return"next"}})({reflectSymbol:function(){return"next"}})(n))(n)(qC)({next:Qa(It(n))(rn(ft)(Kn.value)(Vn(T(bn(Pt)(t(Xo.value))(zt)))))})}};var cv=function(){function n(){}return n.value=new n,n}(),lv={attr:function(n){return function(t){return ot({key:"controls",value:Bt(t)})}}};var sv=function(){function n(){}return n.value=new n,n}();var _v={attr:function(n){return function(t){return ot({key:"src",value:Bt(t)})}}};var pv=function(){function n(){}return n.value=new n,n}(),mv={attr:function(n){return function(t){return ot({key:"width",value:Bt(t)})}}};var vv=function(n){return function(t){return function(r){return new Mn(Qn(n)("source")(t)(new Xn(r)))}}};var dv=function(n){return function(t){return function(r){return new Mn(Qn(n)("video")(t)(new Xn(r)))}}};var XC=function(){return M.value}(),Dv=function(n){return function(t){return function(r){return $t({reflectType:function(){return`<div>
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
</div>`}})()()(On()(Rt()(On()(Mt(t.Monad0().Applicative0()))({reflectType:function(){return"result"}})({reflectSymbol:function(){return"result"}})(t))({reflectType:function(){return"next"}})({reflectSymbol:function(){return"next"}})(t))({reflectType:function(){return"code"}})({reflectSymbol:function(){return"code"}})(t))(t)(XC)({code:Wn(xt(t)([Ft(t)([wn(t.Monad0())(`module Main where

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
`)])])),result:Wn(Ya(Ke(t)(Lt(ht)(s(At)(Dr(n)))(function(e){return Lt(ht)(U(In(t.Monad0().Applicative0()))($(t.Monad0().Applicative0())(void 0)))(function(a){return $(t.Monad0().Applicative0())(new Le(K_()(t)(s(Yu)(function(u){return dv(t)(oe(Sn)(Cn(t.Monad0().Applicative0()))($(t.Monad0().Applicative0()))([rn(lv)(cv.value)("true"),rn(mv)(pv.value)("250")]))([vv(t)(oe(Sn)(Cn(t.Monad0().Applicative0()))($(t.Monad0().Applicative0()))([rn(_v)(sv.value)(u),rn(ap)(eo.value)("video/mp4")]))([])])})(jf()()("https://interactive-examples.mdn.mozilla.net/media/cc0-videos/flower.mp4")(jf()()("https://www.w3schools.com/jsref/movie.mp4")(y_))))(function(u){return function(c){var l=Jf()()()()()({reflectType:function(){return 1}})(M.value)(u),_=Jf()()()()()({reflectType:function(){return 0}})(M.value)(u),i=Qe(It(t))(T(Wr(Zt)))(a),f=function(){var d=vi(t)(function(m){return m?_:l});return function(m){return d(i(m))}}();return Pn(t)([fr(t)($(t.Monad0().Applicative0())(rn(ft)(Kn.value)(Vn(T(e(void 0))))))([wn(t.Monad0())("Switch videos")]),Pn(t)([Go(t)([f(!0)]),Go(t)([f(!1)])])])}})))})})))),next:$(t.Monad0().Applicative0())(rn(ft)(Kn.value)(Vn(T(bn(Pt)(r(eu.value))(zt)))))})}}};var KC=function(){return M.value}(),YC=function(){return M.value}(),yv=function(n){return function(t){return $t({reflectType:function(){return`<div>
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
</div>`}})()()(On()(Rt()(On()(Mt(n.Monad0().Applicative0()))({reflectType:function(){return"result"}})({reflectSymbol:function(){return"result"}})(n))({reflectType:function(){return"next"}})({reflectSymbol:function(){return"next"}})(n))({reflectType:function(){return"code"}})({reflectSymbol:function(){return"code"}})(n))(n)(KC)({code:Wn(xt(n)([Ft(n)([wn(n.Monad0())(`module Main where

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
`)])])),result:Wn(cp({reflectType:function(){return`<div>
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
`}})()(n)(Mt(n.Monad0().Applicative0()))(YC)),next:Qa(It(n))(rn(ft)(Kn.value)(Vn(T(bn(Pt)(t(Zo.value))(zt)))))})}};var n0=function(){return M.value}(),t0=function(){return M.value}(),gv=function(n){return function(t){return function(r){return Ac({reflectType:function(){return`<div>
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
</div>`}})({reflectType:function(){return"?"}})()()(t)(On()(Rt()(On()(Mt(t.Monad0().Applicative0()))({reflectType:function(){return"result"}})({reflectSymbol:function(){return"result"}})(t))({reflectType:function(){return"next"}})({reflectSymbol:function(){return"next"}})(t))({reflectType:function(){return"code"}})({reflectSymbol:function(){return"code"}})(t))(M.value)(n0)({code:Wn(xt(t)([Ft(t)([wn(t.Monad0())(`module Main where

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
  )`)])])),result:Wn(Ya(Ke(t)(Lt(ht)(s(At)(Dr(n)))(function(e){return function(a){return $(t.Monad0().Applicative0())(new Le($t({reflectType:function(){return`<div>
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
`}})()()(Rt()(On()(Mt(t.Monad0().Applicative0()))({reflectType:function(){return"somethingNew"}})({reflectSymbol:function(){return"somethingNew"}})(t))({reflectType:function(){return"myli"}})({reflectSymbol:function(){return"myli"}})(t))(t)(t0)({myli:$(t.Monad0().Applicative0())(rn(Y_)(rr.value)("background-color:rgb(200,240,210);")),somethingNew:Wn(fr(t)($(t.Monad0().Applicative0())(rn(to)(Kn.value)(e(new v(void 0)))))([wr(t.Monad0())(U(In(t.Monad0().Applicative0()))($r(Gn)(ba(Vo(t.Monad0().Applicative0()))(a))("Thanks for clicking me!"))($(t.Monad0().Applicative0())("I was dynamically inserted")))]))})))}})))),next:$(t.Monad0().Applicative0())(rn(ft)(Kn.value)(Vn(T(bn(Pt)(r(tu.value))(zt)))))})}}};var e0=function(n){return function(t){return function(r){return new Mn(Qn(n)("p")(t)(new Xn(r)))}}},bv=function(n){return e0(n)(_n(Cn(n.Monad0().Applicative0())))};var Cl=(n,t,r)=>{t!=="@portal@"&&r.units[t].main.appendChild(r.units[n].main)},hv=n=>t=>r=>()=>{var e,a=t.id;r.scopes[t.scope]||(r.scopes[t.scope]=[]),r.scopes[t.scope].push(a),n&&t.parent!=="@portal@"&&(e=document.body.querySelectorAll("[data-deku-ssr-"+a+"]").item(0))?r.units[a]={listeners:{},parent:t.parent,scope:t.scope,main:e}:(r.units[a]={listeners:{},parent:t.parent,scope:t.scope,main:document.createElement(t.tag)},Cl(a,t.parent,r))},Cv=n=>t=>r=>()=>{var e=t.id,a;r.scopes[t.scope]||(r.scopes[t.scope]=[]),r.scopes[t.scope].push(e),n&&t.parent!=="@portal@"&&(a=document.body.querySelectorAll("[data-deku-ssr-"+t.parent+"]").item(0))?r.units[e]={main:a.childNodes[0],parent:t.parent,scope:t.scope}:(r.units[e]={main:document.createTextNode(""),parent:t.parent,scope:t.scope},Cl(e,t.parent,r))};function Tl(){return{units:{},scopes:{}}}var Tv=n=>t=>r=>()=>{var e=t.id,a=t.value;n&&!r.units[e]&&(dom=document.body.querySelectorAll("[data-deku-ssr-"+e+"]").item(0))&&(r.units[e]={listeners:{},parent:t.parent,scope:t.scope,main:dom},r.scopes[t.scope]||(r.scopes[t.scope]=[]),r.scopes[t.scope].push(e)),r.units[e].main.tagName==="INPUT"&&t.key==="value"?r.units[e].main.value=a:r.units[e].main.tagName==="INPUT"&&t.key==="checked"?r.units[e].main.checked=a==="true":r.units[e].main.setAttribute(t.key,a)},Ev=n=>t=>r=>()=>{var e=t.id,a=t.value;if(n&&!r.units[e]&&(dom=document.body.querySelectorAll("[data-deku-ssr-"+e+"]").item(0))&&(r.units[e]={listeners:{},parent:t.parent,scope:t.scope,main:dom},r.scopes[t.scope]||(r.scopes[t.scope]=[]),r.scopes[t.scope].push(e)),t.key==="@self@")a(r.units[e].main)();else{r.units[e].listeners[t.key]&&r.units[e].main.removeEventListener(t.key,r.units[e].listeners[t.key]);var u=c=>a(c)();r.units[e].main.addEventListener(t.key,u),r.units[e].listeners[t.key]=u}},Fv=n=>t=>()=>{var r=n.id;t.units[r].main.nodeValue=n.text},xv=n=>t=>r=>()=>{var e,a,u=t.id,c=t.html,l=t.verb,_=t.cache,i=t.parent,f=t.scope,d=t.pxScope;if(n&&i!=="@portal@"&&(e=document.body.querySelectorAll("[data-deku-ssr-"+u+"]").item(0)))r.units[u]={listeners:{},scope:f,parent:i,main:e};else{let o=Object.entries(_);for(var m=0;m<o.length;m++){let p=o[m][0];o[m][1]===!0?c=c.replace(l+p+l,'data-deku-attr-internal="'+p+'"'):c=c.replace(l+p+l,'<span style="display:contents;" data-deku-elt-internal="'+p+'"></span>')}a=document.createElement("div"),a.innerHTML=c.trim(),r.units[u]={listeners:{},scope:f,parent:i,main:a.firstChild}}r.scopes[f]||(r.scopes[f]=[]),r.scopes[f].push(u),a||(a=e),a.querySelectorAll("[data-deku-attr-internal]").forEach(function(o){var p=o.getAttribute("data-deku-attr-internal");let sn=p+d;r.units[sn]={listeners:{},main:o,scope:f},r.scopes[f].push(sn)}),a.querySelectorAll("[data-deku-elt-internal]").forEach(function(o){var p=o.getAttribute("data-deku-elt-internal");let sn=p+d;r.units[p+d]={listeners:{},main:o,scope:f},r.scopes[f].push(sn)}),e||Cl(u,i,r)},Mv=n=>t=>()=>{var r=n.id;t.units[r]={main:n.root}},wv=n=>t=>()=>{var r=n.id,e=n.parent;t.units[r].containingScope=n.scope,t.units[e].main.prepend(t.units[r].main)},Av=n=>t=>()=>{var r=n.id;t.units[r].noop||t.units[r].containingScope&&t.units[r].containingScope!==n.scope||t.units[r].main.remove()},Lv=n=>t=>()=>{delete t.units[n.id]},Iv=n=>t=>()=>{var r=n.id;t.units[r].main.parentNode.prepend(t.units[r].main)};var $v=function(n){return n};var c0=1,El=2147483647,l0=function(){return El-1|0}(),Fl=function(n){var t=function(r){return function(e){return function(a){var u=e-r|0,c=Lu(Df)(a)(u),l=c<r;return l?c+e|0:c}}};return t(c0)(l0)(n)};var s0=0,_0=48271,Sv=function(n){return function(t){return mr()(Wi(pu(cr(_0)*cr(t)+cr(n))(cr(El))))}},kv=Sv(s0);var g0=function(){function n(c){this.fn=c}var t={},r=function(c,l){this.head=c,this.tail=l};function e(c){return new r(c,t)}function a(c){return function(l){return new r(c,l)}}function u(c){for(var l=[],_=c;_!==t;)l.push(_.head),_=_.tail;return l}return function(c){return function(l){return function(_){var i=function(d,m){return c(l(a)(_(d)))(m)},f=function(d,m,o){if(m===0)return d;var p=o[m-1];return new n(function(){var sn=f(i(p,d),m-1,o);return sn})};return function(d){for(var m=l(e)(_(d[d.length-1])),o=f(m,d.length-1,d);o instanceof n;)o=o.fn();return l(u)(o)}}}}}();var lo=function(n){return{map:function(t){return function(r){return function(e){return s(n)(function(a){return new E(t(a.value0),a.value1)})(r(e))}}}}};var wl=function(n){return{Applicative0:function(){return tf(n)},Bind1:function(){return Zi(n)}}},Zi=function(n){return{bind:function(t){return function(r){return function(e){return g(n.Bind1())(t(e))(function(a){var u=r(a.value0);return u(a.value1)})}}},Apply0:function(){return nf(n)}}},nf=function(n){return{apply:Sr(wl(n)),Functor0:function(){return lo(n.Bind1().Apply0().Functor0())}}},tf=function(n){return{pure:function(t){return function(r){return y(n.Applicative0())(new E(t,r))}},Apply0:function(){return nf(n)}}};var du=function(n){return{state:function(t){var r=y(n.Applicative0());return function(e){return r(t(e))}},Monad0:function(){return wl(n)}}};var qv=function(n){return function(t){var r=n(t);return r.value1}},Bv=function(n){return function(t){var r=n(t);return r.value0}};var P0=function(n){return n};var N0=function(){var n=function(t){return new E($v(t.newSeed),function(){var r={};for(var e in t)({}).hasOwnProperty.call(t,e)&&(r[e]=t[e]);return r.newSeed=kv(t.newSeed),r}())};return ve(du(_t))(n)}();var Du=lo(ae);var Ll=function(n){return Bv(P0(n))};var Jv=nf(_t),Vv=function(n){return function(t){var r=cr(t),e=cr(n),a=function(l){return e+pu(l)(r-e+1)},u=s(Du)(cr)(N0),c=yn(Jv)(s(Du)(St(yo))(u))(s(Du)(qr(yo)(2))(u));return s(Du)(function(l){return ul(a(l))})(c)}},jv=function(n){return function(t){var r=n<=t;return r?Vv(n)(t):Vv(t)(n)}};var Il=function(n){return n.arbitrary};var $l=function(){return{arbitrary:jv(-1e6)(1e6)}}();var rf=function(){function n(t){this.value0=t}return n.create=function(t){return new n(t)},n}(),ef=function(){function n(t){this.value0=t}return n.create=function(t){return new n(t)},n}(),af=function(){function n(t){this.value0=t}return n.create=function(t){return new n(t)},n}(),of=function(){function n(t){this.value0=t}return n.create=function(t){return new n(t)},n}(),yu=function(){function n(t){this.value0=t}return n.create=function(t){return new n(t)},n}(),O0=function(n){return function(t){return V(Dt)(qt(function(r){return A(bt)(r)([new yu(n)])})(t))}},W0=function(n){return function(t){return V(Dt)(qt(function(r){return A(bt)(r)([new of(n)])})(t))}},U0=function(n){return function(t){return V(Dt)(qt(function(r){return A(bt)(r)([new ef(n)])})(t))}},H0=function(n){return function(t){return V(Dt)(qt(function(r){return A(bt)(r)([new af(n)])})(t))}},q0=function(n){return function(t){return V(Dt)(qt(function(r){return A(bt)(r)([new rf(n)])})(t))}},Xv=function(n){return{ids:function(){var r=dt(n)(),e=N(Rr)(Ll(Il($l))({newSeed:Fl(r),size:5}));return V(Dt)(qt(St(Er)(1))(n))(),e},makeElement:q0,makeRoot:function(t){return function(r){return y(Yt)(void 0)}},makeText:U0,makePursx:H0,setProp:W0,setCb:function(t){return function(r){return y(Yt)(void 0)}},setText:O0,sendToTop:function(t){return function(r){return y(Yt)(void 0)}},deleteFromCache:function(t){return function(r){return y(Yt)(void 0)}},giveNewParent:function(t){return function(r){return y(Yt)(void 0)}},disconnectElement:function(t){return function(r){return y(Yt)(void 0)}}}},Qv=function(n){return{ids:function(){var r=Sa(n)(),e=N(Rr)(Ll(Il($l))({newSeed:Fl(r),size:5}));return V(xn)(Cs(St(Er)(1))(n))(),e},makeElement:hv(!0),makeRoot:Mv,makeText:Cv(!0),makePursx:xv(!0),setProp:Tv(!0),setCb:Ev(!0),setText:Fv,sendToTop:Iv,deleteFromCache:Lv,giveNewParent:wv,disconnectElement:Av}};var Sl=({id:n,html:t,pxScope:r,cache:e,verb:a})=>{let u=t,c=Object.entries(e);for(var l=0;l<c.length;l++){let d=c[l][0];c[l][1]===!0?u=u.replace(a+d+a,'data-deku-attr-internal="'+d+'" data-deku-ssr-'+d+r+'="true"'):u=u.replace(a+d+a,'<span style="display:contents;" data-deku-elt-internal="'+d+'" data-deku-ssr-'+d+r+'="true"></span>')}let _=u.indexOf(">"),i=u.indexOf("/>"),f=i==_-1?i:_;return u.slice(0,f)+" data-deku-ssr-"+n+'="true" '+u.slice(f)};var Yv=function(n){return function(t){var r=function(i){return function(f){return V(lo(ae))(ao(du(_t))(function(d){var m={};for(var o in d)({}).hasOwnProperty.call(d,o)&&(m[o]=d[o]);return m.idToActions=ja(Jt)(function(p){if(p instanceof v)return new v(A(bt)(p.value0)([f]));if(p instanceof D)return new v([f]);throw new Error("Failed pattern match at Deku.SSR (line 43, column 17 - line 45, column 45): "+[p.constructor.name])})(i)(d.idToActions),m}))}},e=function(i){return function(f){return function(d){return Bn(zn)(Zi(_t))(V(lo(ae))(ao(du(_t))(function(m){var o={};for(var p in m)({}).hasOwnProperty.call(m,p)&&(o[p]=m[p]);return o.parentToChild=ja(Jt)(function(sn){if(sn instanceof v)return new v(A(bt)(sn.value0)([f]));if(sn instanceof D)return new v([f]);throw new Error("Failed pattern match at Deku.SSR (line 30, column 17 - line 32, column 41): "+[sn.constructor.name])})(i)(m.parentToChild),o})))(function(){return r(f)(d)})}}},a=qv(ur(Ve)(tf(_t))(function(i){if(i instanceof rf||i instanceof ef||i instanceof af)return e(i.value0.parent)(i.value0.id)(i);if(i instanceof of||i instanceof yu)return r(i.value0.id)(i);throw new Error("Failed pattern match at Deku.SSR (line 53, column 17 - line 58, column 43): "+[i.constructor.name])})(t))({parentToChild:Ja,idToActions:Ja}),u=function(i){return Kt("")(Ku(function(f){return f instanceof rf?new v(f.value0.tag):D.value})(i))},c=function(i){return Ce(Sn)(ho)(" ")(ir(N_)(function(f){return f instanceof of?new v(f.value0.key+('="'+(f.value0.value+'"'))):D.value})(i))},l=function(i){return st("")(function(f){var d=function(p){return Kt("")(Ku(function(sn){return sn instanceof yu?new v(sn.value0.text):D.value})(f))},m=function(p){var sn=u(f),Jn=c(f);return"<"+(sn+(" "+(Jn+(" data-deku-ssr-"+(i+('="true">'+(_(i)+("</"+(sn+">")))))))))},o=Ha(f)(0);return o instanceof v&&o.value0 instanceof yu?d(void 0):o instanceof v&&o.value0 instanceof ef?d(void 0):o instanceof v&&o.value0 instanceof af?Sl(o.value0.value0):m(void 0)})(oi(Jt)(i)(a.idToActions))},_=function(i){var f=Kt([])(oi(Jt)(i)(a.parentToChild));return tr(Sn)(ho)(l)(f)};return"<"+(n+(' data-deku-ssr-deku-root="true">'+(_("deku-root")+("</"+(n+">")))))}};var xT=function(n){return function(t){return function(r){return function(e){return s(n.Monad0().Bind1().Apply0().Functor0())(function(){var a=Yv(t);return function(u){return function(c){return r.head+c}(function(c){return c+r.tail}(a(u)))}}())(mn(n)(function(){var u=wt(0)(),c=wt([])(),l=Xv(u);return V(Dt)(Gt(_e(Yt)(Su)({parent:"deku-root",scope:"rootScope",raiseId:function(_){return y(Yt)(void 0)}})(l)(di(Ze)(Ze)(e)))(function(_){return _(c)}))(),dt(c)()}))}}}},Zv=function(n){return xT(n)("body")};var MT=function(n){return function(){var r=Tl(),e=Hr(xn)(Co(0))(Qv)();return Gt(_e(dr)(ku)({parent:"deku-root",scope:"rootScope",raiseId:function(a){return y(dr)(void 0)}})(e)(di(Ze)(Ze)(n)))(function(a){return a(r)})()}},nd=function(n){return V(xn)(MT(n))};var wT=function(){return M.value}(),rd=function(n){return function(t){return pi()(n)(Ka({reflectSymbol:function(){return"buttonClicked"}})()()(Ka({reflectSymbol:function(){return"sliderMoved"}})()()(ci)()()()())()()()())(M.value)(Lt(ht)(zi(Bi()(io({reflectSymbol:function(){return"buttonClicked"}})(fo(co(t)))(io({reflectSymbol:function(){return"sliderMoved"}})(fo(co(t)))(qi)()())()())))(function(r){return function(e){return Pn(n)([bv(n)([wn(n.Monad0())(`Here's an example of SSR in deku.
All of the static bits are rendered as HTML,
and all of the dynamic bits are hydrated on page load.`)]),fr(n)(Yi(Gn)(Be)(to)($(n.Monad0().Applicative0())(r.buttonClicked)))([wn(n.Monad0())("Click")]),Pn(n)([wr(n.Monad0())(U(In(n.Monad0().Applicative0()))($(n.Monad0().Applicative0())("Val: 0"))(s(Gn)(function(){var a=A(ge)("Val: "),u=N(Rr);return function(c){return a(u(c))}}())(Qe(It(n))(T(St(Er)(1)))(U(In(n.Monad0().Applicative0()))($(n.Monad0().Applicative0())(void 0))(e.buttonClicked))(-1))))]),Pn(n)([ta(n)(Ki(n.Monad0().Applicative0())($(n.Monad0().Applicative0())(r.sliderMoved)))([]),Pn(n)([wr(n.Monad0())(U(In(n.Monad0().Applicative0()))($(n.Monad0().Applicative0())("Val: 50"))(s(Gn)(function(){var a=A(ge)("Val: "),u=N(bo);return function(c){return a(u(c))}}())(e.sliderMoved)))])])])}}))}},ed=function(n){return function(t){return function(r){return $t({reflectType:function(){return`<div>
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
  <p>Unlike the previous examples that used <code>runInBody</code>, our application code here has a slightly more complicated type. This is because it is polymorphic over <code>m</code>, and <code>m</code> will be different depending on if we are doing SSR or if we are on the live page. Also note the use of the function <code>halways</code>. This is needed before our pushers so that they will be lifted into the correct monad.</p>
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
</div>`}})()()(On()(On()(On()(On()(On()(Mt(n.Monad0().Applicative0()))({reflectType:function(){return"result"}})({reflectSymbol:function(){return"result"}})(n))({reflectType:function(){return"codegen"}})({reflectSymbol:function(){return"codegen"}})(n))({reflectType:function(){return"code2"}})({reflectSymbol:function(){return"code2"}})(n))({reflectType:function(){return"code1"}})({reflectSymbol:function(){return"code1"}})(n))({reflectType:function(){return"code0"}})({reflectSymbol:function(){return"code0"}})(n))(n)(wT)({code2:Wn(xt(n)([Ft(n)([wn(n.Monad0())(`module Live where

import Prelude

import App (app)
import Deku.Toplevel (hydrate)
import Effect (Effect)

main :: Effect Unit
main = hydrate app`)])])),code1:Wn(xt(n)([Ft(n)([wn(n.Monad0())(`module Build where

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
    app >>= log`)])])),code0:Wn(xt(n)([Ft(n)([wn(n.Monad0())(`module App where

import Prelude

import Control.Alt ((<|>))
import Control.Monad.ST.Class (class MonadST)
import Data.Monoid.Always (class Always)
import Data.Profunctor (lcmap)
import Deku.Always (halways)
import Deku.Control (text, text_)
import Deku.Core (Domable, vbussed)
import Deku.DOM as D
import Deku.Listeners (click_, slider)
import Effect (Effect)
import FRP.Event (bang, fold)
import FRP.Event.VBus (V)
import Type.Proxy (Proxy(..))

type UIEvents = V
  ( buttonClicked :: Unit
  , sliderMoved :: Number
  )

app
  :: forall s m lock payload
   . MonadST s m
  => Always (m Unit) (Effect Unit)
  => Domable m lock payload
app = vbussed (Proxy :: _ UIEvents) $ lcmap halways \\push event -> do
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
`)])])),result:Wn(rd(n)(t)),codegen:Wn(xt(n)([Ft(n)([wr(n.Monad0())(br(function(e){return bn(n.Monad0().Bind1().Apply0())(g(n.Monad0().Bind1())(Zv(n)({head:'<!DOCTYPE html><html><head><script src="bundle.js" defer><\/script></head>',tail:"</html>"})(rd(Su)(Fs($a(Be)))))(e))(y(n.Monad0().Applicative0())(y(n.Monad0().Applicative0())(void 0)))}))])]))})}}};var ad=function(n){return function(t){var r=function(e){return function(a){if(a instanceof Ci)return fv(n)(e);if(a instanceof Xo)return iv(n)(e);if(a instanceof Qo)return lp(n)(e);if(a instanceof Ko)return yv(n)(e);if(a instanceof Zo)return tv(n)(t)(e);if(a instanceof nu)return Nm(n)(t)(e);if(a instanceof Yo)return gv(t)(n)(e);if(a instanceof tu)return uv(t)(n)(e);if(a instanceof ru)return Dv(t)(n)(e);if(a instanceof eu)return ed(n)(t)(e);throw new Error("Failed pattern match at Deku.Example.Docs.Scene (line 90, column 3 - line 90, column 66): "+[e.constructor.name,a.constructor.name])}};return Za(n)(Lt(ht)(s(At)(Dr(t)))(function(e){return Lt(ht)(function(a){return U(In(n.Monad0().Applicative0()))($(n.Monad0().Applicative0())(Ci.value))(a)})(function(a){return Pn(n)([Pn(n)(s(rt)(function(u){return Go(n)([yi(n)(oe(Sn)(Cn(n.Monad0().Applicative0()))($(n.Monad0().Applicative0()))([rn(ft)(Kn.value)(Vn(T(e(u.value0)))),rn(np)(rr.value)("cursor:pointer;")]))([wn(n.Monad0())(u.value1.value0)]),Ca(n)($(n.Monad0().Applicative0())(rn(ro)(rr.value)(function(){return u.value1.value1?"":"display:none;"}())))([wn(n.Monad0())(" | ")])])})([new E(Ci.value,new E("Home",!0)),new E(Xo.value,new E("Hello world",!0)),new E(Qo.value,new E("Component",!0)),new E(Ko.value,new E("Pursx 1",!0)),new E(Zo.value,new E("Events 1",!0)),new E(nu.value,new E("Effects",!0)),new E(Yo.value,new E("Pursx 2",!0)),new E(tu.value,new E("Events 2",!0)),new E(ru.value,new E("Portals",!0)),new E(eu.value,new E("SSR",!1))])),Pn(n)([vi(n)(r(e))(a)])])})}))}};var od=nd(ad(ku)(xs($a(Be))));od();
