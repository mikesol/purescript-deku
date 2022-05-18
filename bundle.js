var fa={compose:function(n){return function(t){return function(r){return n(t(r))}}}},ca=function(n){return n.compose};var Z=function(n){return n.identity},rn={identity:function(n){return n},Semigroupoid0:function(){return fa}};var h=function(n){return n};var Wl=h;var Ul=function(n){return function(t){return function(){return n(t())}}},Hl=function(n){return function(){return n}},Bl=function(n){return function(t){return function(){return t(n())()}}};function Lt(n){return function(){return{value:n}}}var gt=function(n){return function(){return n.value}},ql=function(n){return function(t){return function(){var r=n(t.value);return t.value=r.state,r.value}}},ur=function(n){return function(t){return function(){return t.value=n}}};var zl=function(n){return function(t){for(var r=n.length,e=t.length,a=new Array(r*e),u=0,i=0;i<r;i++)for(var l=n[i],_=0;_<e;_++)a[u++]=l(t[_]);return a}};var Zt=!0;var _f=function(n){return function(t){return function(r){return function(e){return n(t(r))(t(e))}}}},at=function(n){return function(t){return function(r){return n(r)(t)}}},E=function(n){return function(t){return n}};var pf=function(n){return function(t){return t(n)}};var Vl=function(n){return function(t){for(var r=t.length,e=new Array(r),a=0;a<r;a++)e[a]=n(t[a]);return e}};var x=function(){function n(){}return n.value=new n,n}();var s=function(n){return n.map},qr=function(n){return function(t){return function(r){return s(n)(r)(t)}}},Q=function(n){return s(n)(E(void 0))},Sr=function(n){return function(t){return function(r){return s(n)(E(r))(t)}}};var It={map:ca(fa)},ot={map:Vl};var bo={apply:zl,Functor0:function(){return ot}},bn=function(n){return n.apply};var Cn=function(n){return function(t){return function(r){return bn(n)(s(n.Functor0())(E(Z(rn)))(t))(r)}}},dr=function(n){return function(t){return function(r){return function(e){return bn(n)(s(n.Functor0())(t)(r))(e)}}}};var y=function(n){return n.pure};var De=function(n){return function(t){return function(r){if(t)return r;if(!t)return y(n)(void 0);throw new Error("Failed pattern match at Control.Applicative (line 63, column 1 - line 63, column 63): "+[t.constructor.name,r.constructor.name])}}},Co=function(n){return function(t){return function(r){return bn(n.Apply0())(y(n)(t))(r)}}};var ho={pure:function(n){return[n]},Apply0:function(){return bo}};var jl=function(n){return function(t){for(var r=[],e=0,a=n.length;e<a;e++)Array.prototype.push.apply(r,t(n[e]));return r}};var Vn=function(n){return n.discard};var Su={bind:jl,Apply0:function(){return bo}},g=function(n){return n.bind},ye=function(n){return at(g(n))},Pu=function(n){return function(t){return function(r){return function(e){return ye(n)(t)(r(e))}}}},Nu=function(n){return function(t){return function(r){return function(e){return g(n)(t(e))(r)}}}};var Jn={discard:function(n){return g(n)}};var la=function(n){return function(t){return g(n)(t)(Z(rn))}};var Pr=function(n){return function(t){return function(r){return g(n.Bind1())(t)(function(e){return g(n.Bind1())(r)(function(a){return y(n.Applicative0())(e(a))})})}}};var Gl=function(n){return function(t){return n+t}},Xl=function(n){return function(t){return n.length===0?t:t.length===0?n:n.concat(t)}};var Nt=function(n){return n.reflectSymbol};var Er=function(n){return function(t){return t[n]}},ge=function(n){return function(t){return function(r){var e={};for(var a in r)({}).hasOwnProperty.call(r,a)&&(e[a]=r[a]);return e[n]=t,e}}};var Kl={append:function(n){return function(t){return void 0}}},be={append:Gl};var Tt={append:Xl};var A=function(n){return n.append};var H=function(n){return n.alt};var Id=String.fromCharCode(65535),$d=String.fromCharCode(0),Sd=Number.POSITIVE_INFINITY,Pd=Number.NEGATIVE_INFINITY;var Yl=function(n){return function(t){return function(r){return function(e){return function(a){return e<a?n:e===a?t:r}}}}};var Zl=Yl;var ns=Yl;var ts=function(n){return function(t){return n===t}};var rs=ts;var es=ts;var We={eq:es};var To={eq:rs};var nn=function(n){return n.eq};var tn=function(){function n(){}return n.value=new n,n}(),_n=function(){function n(){}return n.value=new n,n}(),cn=function(){function n(){}return n.value=new n,n}();var as=function(n){return function(t){return n-t|0}};var os=function(n){return function(t){return n+t|0}},us=function(n){return function(t){return n*t|0}},is=function(n){return function(t){return n+t}},fs=function(n){return function(t){return n*t}};var Eo={add:is,zero:0,mul:fs,one:1},Fr={add:os,zero:0,mul:us,one:1};var zr=function(n){return n.mul};var St=function(n){return n.add};var df={sub:as,Semiring0:function(){return Fr}};var zt=function(){return{compare:ns(tn.value)(cn.value)(_n.value),Eq0:function(){return We}}}();var Dr=function(){return{compare:Zl(tn.value)(cn.value)(_n.value),Eq0:function(){return To}}}();var un=function(n){return n.compare};var kr=function(n){return n.top};var sa={top:2147483647,bottom:-2147483648,Ord0:function(){return Dr}};var Vr=function(n){return n.bottom};var ls=function(n){return n.toString()},ss=function(n){var t=n.toString();return isNaN(t+".0")?t:t+".0"};var _s=function(n){var t=n.length;return'"'+n.replace(/[\0-\x1F\x7F"\\]/g,function(r,e){switch(r){case'"':case"\\":return"\\"+r;case"\x07":return"\\a";case"\b":return"\\b";case"\f":return"\\f";case`
`:return"\\n";case"\r":return"\\r";case"	":return"\\t";case"\v":return"\\v"}var a=e+1,u=a<t&&n[a]>="0"&&n[a]<="9"?"\\&":"";return"\\"+r.charCodeAt(0).toString(10)+u})+'"'};var Rr={show:_s};var Mo={show:ss},Or={show:ls};var R=function(n){return n.show};var D=function(){function n(){}return n.value=new n,n}(),v=function(){function n(t){this.value0=t}return n.create=function(t){return new n(t)},n}();var Yn=function(n){return function(t){return function(r){if(r instanceof D)return n;if(r instanceof v)return t(r.value0);throw new Error("Failed pattern match at Data.Maybe (line 237, column 1 - line 237, column 51): "+[n.constructor.name,t.constructor.name,r.constructor.name])}}};var Ou=Yn(!1)(E(!0));var et={map:function(n){return function(t){return t instanceof v?new v(n(t.value0)):D.value}}};var tr=function(n){return Yn(n)(Z(rn))},yr=function(){return function(n){if(n instanceof v)return n.value0;throw new Error("Failed pattern match at Data.Maybe (line 288, column 1 - line 288, column 46): "+[n.constructor.name])}};var _a={apply:function(n){return function(t){if(n instanceof v)return s(et)(n.value0)(t);if(n instanceof D)return D.value;throw new Error("Failed pattern match at Data.Maybe (line 67, column 1 - line 69, column 30): "+[n.constructor.name,t.constructor.name])}},Functor0:function(){return et}},gr={bind:function(n){return function(t){if(n instanceof v)return t(n.value0);if(n instanceof D)return D.value;throw new Error("Failed pattern match at Data.Maybe (line 125, column 1 - line 127, column 28): "+[n.constructor.name,t.constructor.name])}},Apply0:function(){return _a}};var Be=function(){return{pure:v.create,Apply0:function(){return _a}}}();var O=function(){function n(t){this.value0=t}return n.create=function(t){return new n(t)},n}(),P=function(){function n(t){this.value0=t}return n.create=function(t){return new n(t)},n}();var yf=function(n){return Yn(new O(n))(P.create)};var Na={map:function(n){return function(t){if(t instanceof O)return new O(t.value0);if(t instanceof P)return new P(n(t.value0));throw new Error("Failed pattern match at Data.Either (line 31, column 1 - line 31, column 52): "+[t.constructor.name])}}};var Wr=function(n){return function(t){return function(r){if(r instanceof O)return n(r.value0);if(r instanceof P)return t(r.value0);throw new Error("Failed pattern match at Data.Either (line 208, column 1 - line 208, column 64): "+[n.constructor.name,t.constructor.name,r.constructor.name])}}},gf=function(){return Wr(E(D.value))(v.create)}();var ue=function(n){return n};var ie={map:function(n){return function(t){return n(t)}}};var vs={apply:function(n){return function(t){return n(t)}},Functor0:function(){return ie}},Yd={bind:function(n){return function(t){return t(n)}},Apply0:function(){return vs}},Zd={pure:ue,Apply0:function(){return vs}},tt={Applicative0:function(){return Zd},Bind1:function(){return Yd}};var ds=function(n){return Math.min(Math.abs(n),2147483647)},Ds=function(n){return function(t){return t===0?0:t>0?Math.floor(n/t):-Math.floor(n/-t)}},ys=function(n){return function(t){if(t===0)return 0;var r=Math.abs(t);return(n%r+r)%r}};var gs={Ring0:function(){return df}};var Wu=function(n){return n.mod};var bf={degree:ds,div:Ds,mod:ys,CommutativeRing0:function(){return gs}};var qe={mempty:void 0,Semigroup0:function(){return Kl}},xo={mempty:"",Semigroup0:function(){return be}};var Tn=function(n){return n.mempty};var hf=function(n){return function(){return n}},Cs=function(n){return function(t){return function(){return t(n())()}}};var hs=function(n,t,r){var e=0,a;return function(u){if(e===2)return a;if(e===1)throw new ReferenceError(n+" was needed before it finished initializing (module "+t+", line "+u+")",t,u);return e=1,a=r(),e=2,a}},ka={Applicative0:function(){return xr},Bind1:function(){return pa}},pa={bind:Cs,Apply0:function(){return Tf(0)}},xr={pure:hf,Apply0:function(){return Tf(0)}},Ts=hs("functorEffect","Effect",function(){return{map:Co(xr)}}),Tf=hs("applyEffect","Effect",function(){return{apply:Pr(ka),Functor0:function(){return Ts(0)}}}),xn=Ts(20),kt=Tf(23),Es=function(n){return{append:dr(kt)(A(n))}},Ra=function(n){return{mempty:hf(Tn(n)),Semigroup0:function(){return Es(n.Semigroup0())}}};var Fs=function(n){return function(){return{value:n}}};var Oa=function(n){return function(){return n.value}},Ms=function(n){return function(t){return function(){var r=n(t.value);return t.value=r.state,r.value}}};var wo=Fs,uD=Ms,xs=function(n){return uD(function(t){var r=n(t);return{state:r,value:r}})};var _D=function(n,t,r){var e=0,a;return function(u){if(e===2)return a;if(e===1)throw new ReferenceError(n+" was needed before it finished initializing (module "+t+", line "+u+")",t,u);return e=1,a=r(),e=2,a}},pD=ql,Vt=function(n){return pD(function(t){var r=n(t);return{state:r,value:r}})},bt={map:Ul},Uu={Applicative0:function(){return ir},Bind1:function(){return Hu}},Hu={bind:Bl,Apply0:function(){return Mf(0)}},ir={pure:Hl,Apply0:function(){return Mf(0)}},Mf=_D("applyST","Control.Monad.ST.Internal",function(){return{apply:Pr(Uu),Functor0:function(){return bt}}}),As=Mf(46);var Bu={liftST:Z(rn),Monad0:function(){return Uu}},qu={liftST:Wl,Monad0:function(){return ka}},vn=function(n){return n.liftST};var Ls=function(n){return{always:E(Tn(n)),Monoid0:function(){return n}}},Is=function(n){return{always:Z(rn),Monoid0:function(){return n}}},br=function(n){return n.always};function $s(n){return()=>n.slice()}function Ss(n){return t=>r=>()=>{r[n]=t}}function Ps(n){return()=>n.slice()}var vD=function(n){return function(t){if(n<1)return[];var r=new Array(n);return r.fill(t)}},dD=function(n){return function(t){for(var r=[],e=0,a=0;a<n;a++)r[e++]=t;return r}},xf=typeof Array.prototype.fill=="function"?vD:dD,DD=function(){function n(a,u){this.head=a,this.tail=u}var t={};function r(a){return function(u){return new n(a,u)}}function e(a){for(var u=[],i=0,l=a;l!==t;)u[i++]=l.head,l=l.tail;return u}return function(a){return function(u){return e(a(r)(t)(u))}}}();var Ns=function(n){return function(t){return function(r){return function(e){return e<0||e>=r.length?t:n(r[e])}}}},ks=function(n){return function(t){return function(r){return function(e){for(var a=0;a<e.length;a++){var u=r(e[a]);if(t(u))return u}return n}}}},Rs=function(n){return function(t){return function(r){return function(e){for(var a=0,u=e.length;a<u;a++)if(r(e[a]))return n(a);return t}}}};var Os=function(n){return function(t){return function(r){return function(e){if(r<0||r>=e.length)return t;var a=e.slice();return a.splice(r,1),n(a)}}}};var Io=function(n){return function(t){return t.filter(n)}},zu=function(n){return function(t){for(var r=[],e=[],a=0;a<t.length;a++){var u=t[a];n(u)?r.push(u):e.push(u)}return{yes:r,no:e}}};var yD=function(){function n(t,r,e,a,u,i){var l,_,c,f,d,m,o;for(l=u+(i-u>>1),l-u>1&&n(t,r,a,e,u,l),i-l>1&&n(t,r,a,e,l,i),_=u,c=l,f=u;_<l&&c<i;)d=a[_],m=a[c],o=r(t(d)(m)),o>0?(e[f++]=m,++c):(e[f++]=d,++_);for(;_<l;)e[f++]=a[_++];for(;c<i;)e[f++]=a[c++]}return function(t){return function(r){return function(e){var a;return e.length<2?e:(a=e.slice(0),n(t,r,a,e.slice(0),0,e.length),a)}}}}();var bD=function(n,t,r){var e=0,a;return function(u){if(e===2)return a;if(e===1)throw new ReferenceError(n+" was needed before it finished initializing (module "+t+", line "+u+")",t,u);return e=1,a=r(),e=2,a}};var Ws={defer:function(n){return function(t){return n(void 0)(t)}}},Wa=function(n){return n.defer},wf=function(n){return function(t){var r=bD("go","Control.Lazy",function(){return Wa(n)(function(a){return t(r(25))})}),e=r(25);return e}};function ma(){return[]}var Af=function(n){return function(t){return function(){return t.push.apply(t,n)}}};var fe=function(n){return function(){return n}};function CD(n){return function(){return n.slice()}}var Lf=CD,hD=function(){function n(t,r,e,a,u,i){var l,_,c,f,d,m,o;for(l=u+(i-u>>1),l-u>1&&n(t,r,a,e,u,l),i-l>1&&n(t,r,a,e,l,i),_=u,c=l,f=u;_<l&&c<i;)d=a[_],m=a[c],o=r(t(d)(m)),o>0?(e[f++]=m,++c):(e[f++]=d,++_);for(;_<l;)e[f++]=a[_++];for(;c<i;)e[f++]=a[c++]}return function(t){return function(r){return function(e){return function(){return e.length<2||n(t,r,e,e.slice(0),0,e.length),e}}}}}();var qs=function(n){return function(t){return function(){var e=Lf(t)();return n(e)(),fe(e)()}}};var Te=function(n){return Af([n])};var zs=function(n){return function(t){return n&&t}},Vs=function(n){return function(t){return n||t}},Js=function(n){return!n};var Ur=function(n){return n.not};var So=function(n){return n.ff};var Ha=function(n){return n.disj},rr={ff:!1,tt:!0,implies:function(n){return function(t){return Ha(rr)(Ur(rr)(n))(t)}},conj:zs,disj:Vs,not:Js};var MD=function(){function n(t,r){this.value0=t,this.value1=r}return n.create=function(t){return function(r){return new n(t,r)}},n}();var xD=function(n){return function(){var r=gt(n.value1)();return Vt(function(e){return e+1|0})(n.value1)(),n.value0(r)}};var Ju=function(n){return s(bt)(MD.create(n))(Lt(0))},ju=function(n){return function(t){return function(){for(var e=Lt(!1)();s(bt)(Ur(rr))(gt(e))();)(function(){var u=xD(n)();if(u instanceof v)return t(u.value0)();if(u instanceof D)return Q(bt)(ur(!0)(e))();throw new Error("Failed pattern match at Data.Array.ST.Iterator (line 42, column 5 - line 44, column 47): "+[u.constructor.name])})();return{}}}};var Gs=function(n){return function(t){return function(r){for(var e=t,a=r.length,u=a-1;u>=0;u--)e=n(r[u])(e);return e}}},Xs=function(n){return function(t){return function(r){for(var e=t,a=r.length,u=0;u<a;u++)e=n(e)(r[u]);return e}}};var ln=function(n){return n.empty};var F=function(){function n(t,r){this.value0=t,this.value1=r}return n.create=function(t){return function(r){return new n(t,r)}},n}();var Rt=function(n){return n.value1};var va={map:function(n){return function(t){return new F(t.value0,n(t.value1))}}};var Ro=function(n){return n};var HD=function(n){return{append:function(t){return function(r){return Ha(n)(t)(r)}}}};var Pf=function(n){return{mempty:So(n),Semigroup0:function(){return HD(n)}}};var Wo=function(){return h};var mt=Wo;var Ku=function(){return function(){return function(){return function(){return function(n){return Wo()}}}}};var ut=function(n){return n.foldr};var za=function(n){return function(t){return ut(n)(H(t.Alt0()))(ln(t))}},ce=function(n){return function(t){return function(r){return ut(n)(function(){var e=H(t.Alt0());return function(a){return e(r(a))}}())(ln(t))}}},Qr=function(n){return function(t){return function(r){return ut(t)(function(){var e=Cn(n.Apply0());return function(a){return e(r(a))}}())(y(n)(void 0))}}},er=function(n){return function(t){return at(Qr(n)(t))}},Yu=function(n){return function(t){return Qr(n)(t)(Z(rn))}},it=function(n){return n.foldl};var Ee=function(n){return function(t){return function(r){return function(e){var a=function(u){return function(i){return u.init?{init:!1,acc:i}:{init:!1,acc:A(t.Semigroup0())(u.acc)(A(t.Semigroup0())(r)(i))}}};return it(n)(a)({init:!0,acc:Tn(t)})(e).acc}}}};var Pt={foldr:function(n){return function(t){return function(r){if(r instanceof D)return t;if(r instanceof v)return n(r.value0)(t);throw new Error("Failed pattern match at Data.Foldable (line 138, column 1 - line 144, column 27): "+[n.constructor.name,t.constructor.name,r.constructor.name])}}},foldl:function(n){return function(t){return function(r){if(r instanceof D)return t;if(r instanceof v)return n(t)(r.value0);throw new Error("Failed pattern match at Data.Foldable (line 138, column 1 - line 144, column 27): "+[n.constructor.name,t.constructor.name,r.constructor.name])}}},foldMap:function(n){return function(t){return function(r){if(r instanceof D)return Tn(n);if(r instanceof v)return t(r.value0);throw new Error("Failed pattern match at Data.Foldable (line 138, column 1 - line 144, column 27): "+[t.constructor.name,r.constructor.name])}}}};var t_=function(n){return function(t){return function(r){return ut(n)(function(e){return function(a){return A(t.Semigroup0())(r(e))(a)}})(Tn(t))}}},Sn={foldr:Gs,foldl:Xs,foldMap:function(n){return t_(Sn)(n)}};var ar=function(n){return n.foldMap};var ze=function(n){return function(t){return Ku()()()()(Ro)(ar(n)(Pf(t)))}};var r_=function(){function n(a){return[a]}function t(a){return function(u){return[a,u]}}function r(a){return function(u){return function(i){return[a,u,i]}}}function e(a){return function(u){return a.concat(u)}}return function(a){return function(u){return function(i){return function(l){return function(_){function c(f,d){switch(d-f){case 0:return i([]);case 1:return u(n)(l(_[f]));case 2:return a(u(t)(l(_[f])))(l(_[f+1]));case 3:return a(a(u(r)(l(_[f])))(l(_[f+1])))(l(_[f+2]));default:var m=f+Math.floor((d-f)/4)*2;return a(u(e)(c(f,m)))(c(m,d))}}return c(0,_.length)}}}}}}();var fr=function(n){return n.traverse};var __=function(n){return function(t){return fr(n)(t)(Z(rn))}},Ve={traverse:function(n){return r_(bn(n.Apply0()))(s(n.Apply0().Functor0()))(y(n))},sequence:function(n){return __(Ve)(n)},Functor0:function(){return ot},Foldable1:function(){return Sn}};var Jf=function(n){return function(t){return qs(Te(t))(n)()}},y_=function(n){return[n]};var ja=function(){return Ns(v.create)(D.value)}();var oi=function(){return ks(D.value)(Ou)}();var g_=function(){return Rs(v.create)(D.value)}();var b_=function(){return Os(v.create)(D.value)}(),jf=function(n){return function(t){return function(r){return r.length===0?[]:Yn(r)(function(e){return yr()(b_(e)(r))})(g_(n(t))(r))}}};var qo=function(n){return function(t){return A(Tt)([n])(t)}};var Wy=at(g(Su)),Gf=function(n){return Wy(function(){var t=Yn([])(y_);return function(r){return t(n(r))}}())};var C_=function(n){return function(t){for(var r=t.length,e=Array(r),a=0;a<r;a++)e[a]=n(a)(t[a]);return e}};var Me=function(n){return n.mapWithIndex};var zo={mapWithIndex:C_,Functor0:function(){return ot}};var le=function(){function n(t,r){this.value0=t,this.value1=r}return n.create=function(t){return function(r){return new n(t,r)}},n}();var ii=function(n){return function(t){return new le(t,ln(n))}};var ft=function(){function n(){}return n.value=new n,n}(),K=function(){function n(t,r){this.value0=t,this.value1=r}return n.create=function(t){return function(r){return new n(t,r)}},n}(),fi=function(n){return n},ng=function(n){return new K(n.value0,n.value1)};var tg=function(n){var t=function(r){return function(e){var a=r,u=!1,i;function l(_,c){if(c instanceof K&&c.value1 instanceof K&&c.value1.value1 instanceof K){a=new K(c,_),e=c.value1.value1.value1;return}var f=function(m){return m instanceof K&&m.value1 instanceof K&&m.value1.value1 instanceof ft?new K(n(m.value0),new K(n(m.value1.value0),ft.value)):m instanceof K&&m.value1 instanceof ft?new K(n(m.value0),ft.value):ft.value},d=function(m){return function(o){var p=m,B=!1,Wn;function Kt(kn,Br){if(kn instanceof K&&kn.value0 instanceof K&&kn.value0.value1 instanceof K&&kn.value0.value1.value1 instanceof K){p=kn.value1,o=new K(n(kn.value0.value0),new K(n(kn.value0.value1.value0),new K(n(kn.value0.value1.value1.value0),Br)));return}return B=!0,Br}for(;!B;)Wn=Kt(p,o);return Wn}};return u=!0,d(_)(f(c))}for(;!u;)i=l(a,e);return i}};return t(ft.value)},Yf={map:tg};var we={foldr:function(n){return function(t){var r=function(){var a=function(u){return function(i){var l=u,_=!1,c;function f(d,m){if(m instanceof ft)return _=!0,d;if(m instanceof K){l=new K(m.value0,d),i=m.value1;return}throw new Error("Failed pattern match at Data.List.Types (line 107, column 7 - line 107, column 23): "+[d.constructor.name,m.constructor.name])}for(;!_;)c=f(l,i);return c}};return a(ft.value)}(),e=it(we)(at(n))(t);return function(a){return e(r(a))}}},foldl:function(n){var t=function(r){return function(e){var a=r,u=!1,i;function l(_,c){if(c instanceof ft)return u=!0,_;if(c instanceof K){a=n(_)(c.value0),e=c.value1;return}throw new Error("Failed pattern match at Data.List.Types (line 111, column 12 - line 113, column 30): "+[c.constructor.name])}for(;!u;)i=l(a,e);return i}};return t},foldMap:function(n){return function(t){return it(we)(function(r){var e=A(n.Semigroup0())(r);return function(a){return e(t(a))}})(Tn(n))}}};var Vo={append:function(n){return function(t){return ut(we)(K.create)(t)(n)}}};var Zf={append:function(n){return function(t){return new le(n.value0,A(Vo)(n.value1)(ng(t)))}}};var E_={alt:A(Vo),Functor0:function(){return Yf}},nc=function(){return{empty:ft.value,Alt0:function(){return E_}}}();var L_=function(n){return n()};var I_=function(n){throw new Error(n)};var $_=function(){return I_};var bg=L_,Zr=function(n){return bg(function(){return $_()(n)})};var Y=function(){function n(){}return n.value=new n,n}(),pn=function(){function n(t,r,e,a){this.value0=t,this.value1=r,this.value2=e,this.value3=a}return n.create=function(t){return function(r){return function(e){return function(a){return new n(t,r,e,a)}}}},n}(),Pn=function(){function n(t,r,e,a,u,i,l){this.value0=t,this.value1=r,this.value2=e,this.value3=a,this.value4=u,this.value5=i,this.value6=l}return n.create=function(t){return function(r){return function(e){return function(a){return function(u){return function(i){return function(l){return new n(t,r,e,a,u,i,l)}}}}}}},n}(),je=function(){function n(t,r,e){this.value0=t,this.value1=r,this.value2=e}return n.create=function(t){return function(r){return function(e){return new n(t,r,e)}}},n}(),Ae=function(){function n(t,r,e){this.value0=t,this.value1=r,this.value2=e}return n.create=function(t){return function(r){return function(e){return new n(t,r,e)}}},n}(),Ge=function(){function n(t,r,e,a,u,i){this.value0=t,this.value1=r,this.value2=e,this.value3=a,this.value4=u,this.value5=i}return n.create=function(t){return function(r){return function(e){return function(a){return function(u){return function(i){return new n(t,r,e,a,u,i)}}}}}},n}(),se=function(){function n(t,r,e,a,u,i){this.value0=t,this.value1=r,this.value2=e,this.value3=a,this.value4=u,this.value5=i}return n.create=function(t){return function(r){return function(e){return function(a){return function(u){return function(i){return new n(t,r,e,a,u,i)}}}}}},n}(),Xe=function(){function n(t,r,e,a,u,i){this.value0=t,this.value1=r,this.value2=e,this.value3=a,this.value4=u,this.value5=i}return n.create=function(t){return function(r){return function(e){return function(a){return function(u){return function(i){return new n(t,r,e,a,u,i)}}}}}},n}(),li=function(){function n(t,r,e,a){this.value0=t,this.value1=r,this.value2=e,this.value3=a}return n.create=function(t){return function(r){return function(e){return function(a){return new n(t,r,e,a)}}}},n}();var si=function(n){return function(t){var r=un(n),e=function(a){var u=!1,i;function l(_){if(_ instanceof Y)return u=!0,D.value;if(_ instanceof pn){var c=r(t)(_.value1);if(c instanceof cn)return u=!0,new v(_.value2);if(c instanceof tn){a=_.value0;return}a=_.value3;return}if(_ instanceof Pn){var f=r(t)(_.value1);if(f instanceof cn)return u=!0,new v(_.value2);var d=r(t)(_.value4);if(d instanceof cn)return u=!0,new v(_.value5);if(f instanceof tn){a=_.value0;return}if(d instanceof _n){a=_.value6;return}a=_.value3;return}throw new Error("Failed pattern match at Data.Map.Internal (line 241, column 5 - line 241, column 22): "+[_.constructor.name])}for(;!u;)i=l(a);return i};return e}};var Et=function(n){return function(t){return function(r){var e=n,a=t,u=!1,i;function l(_,c,f){if(c instanceof ft)return u=!0,f;if(c instanceof K){if(c.value0 instanceof je){e=_,a=c.value1,r=new pn(f,c.value0.value0,c.value0.value1,c.value0.value2);return}if(c.value0 instanceof Ae){e=_,a=c.value1,r=new pn(c.value0.value0,c.value0.value1,c.value0.value2,f);return}if(c.value0 instanceof Ge){e=_,a=c.value1,r=new Pn(f,c.value0.value0,c.value0.value1,c.value0.value2,c.value0.value3,c.value0.value4,c.value0.value5);return}if(c.value0 instanceof se){e=_,a=c.value1,r=new Pn(c.value0.value0,c.value0.value1,c.value0.value2,f,c.value0.value3,c.value0.value4,c.value0.value5);return}if(c.value0 instanceof Xe){e=_,a=c.value1,r=new Pn(c.value0.value0,c.value0.value1,c.value0.value2,c.value0.value3,c.value0.value4,c.value0.value5,f);return}throw new Error("Failed pattern match at Data.Map.Internal (line 462, column 3 - line 467, column 88): "+[c.value0.constructor.name])}throw new Error("Failed pattern match at Data.Map.Internal (line 459, column 1 - line 459, column 80): "+[c.constructor.name,f.constructor.name])}for(;!u;)i=l(e,a,r);return i}}},_i=function(n){return function(t){return function(r){var e=function(i){return function(l){var _=i,c=!1,f;function d(m,o){if(m instanceof ft)return c=!0,new pn(o.value0,o.value1,o.value2,o.value3);if(m instanceof K){if(m.value0 instanceof je)return c=!0,Et(n)(m.value1)(new Pn(o.value0,o.value1,o.value2,o.value3,m.value0.value0,m.value0.value1,m.value0.value2));if(m.value0 instanceof Ae)return c=!0,Et(n)(m.value1)(new Pn(m.value0.value0,m.value0.value1,m.value0.value2,o.value0,o.value1,o.value2,o.value3));if(m.value0 instanceof Ge){_=m.value1,l=new li(new pn(o.value0,o.value1,o.value2,o.value3),m.value0.value0,m.value0.value1,new pn(m.value0.value2,m.value0.value3,m.value0.value4,m.value0.value5));return}if(m.value0 instanceof se){_=m.value1,l=new li(new pn(m.value0.value0,m.value0.value1,m.value0.value2,o.value0),o.value1,o.value2,new pn(o.value3,m.value0.value3,m.value0.value4,m.value0.value5));return}if(m.value0 instanceof Xe){_=m.value1,l=new li(new pn(m.value0.value0,m.value0.value1,m.value0.value2,m.value0.value3),m.value0.value4,m.value0.value5,new pn(o.value0,o.value1,o.value2,o.value3));return}throw new Error("Failed pattern match at Data.Map.Internal (line 498, column 5 - line 503, column 108): "+[m.value0.constructor.name,o.constructor.name])}throw new Error("Failed pattern match at Data.Map.Internal (line 495, column 3 - line 495, column 56): "+[m.constructor.name,o.constructor.name])}for(;!c;)f=d(_,l);return f}},a=un(n),u=function(i){return function(l){var _=i,c=!1,f;function d(m,o){if(o instanceof Y)return c=!0,e(m)(new li(Y.value,t,r,Y.value));if(o instanceof pn){var p=a(t)(o.value1);if(p instanceof cn)return c=!0,Et(n)(m)(new pn(o.value0,t,r,o.value3));if(p instanceof tn){_=new K(new je(o.value1,o.value2,o.value3),m),l=o.value0;return}_=new K(new Ae(o.value0,o.value1,o.value2),m),l=o.value3;return}if(o instanceof Pn){var B=a(t)(o.value1);if(B instanceof cn)return c=!0,Et(n)(m)(new Pn(o.value0,t,r,o.value3,o.value4,o.value5,o.value6));var Wn=a(t)(o.value4);if(Wn instanceof cn)return c=!0,Et(n)(m)(new Pn(o.value0,o.value1,o.value2,o.value3,t,r,o.value6));if(B instanceof tn){_=new K(new Ge(o.value1,o.value2,o.value3,o.value4,o.value5,o.value6),m),l=o.value0;return}if(B instanceof _n&&Wn instanceof tn){_=new K(new se(o.value0,o.value1,o.value2,o.value4,o.value5,o.value6),m),l=o.value3;return}_=new K(new Xe(o.value0,o.value1,o.value2,o.value3,o.value4,o.value5),m),l=o.value6;return}throw new Error("Failed pattern match at Data.Map.Internal (line 478, column 3 - line 478, column 55): "+[m.constructor.name,o.constructor.name])}for(;!c;)f=d(_,l);return f}};return u(ft.value)}}},xg=function(n){return function(t){var r=function(l){return function(_){var c=l,f=!1,d;function m(o,p){if(o instanceof ft)return f=!0,p;if(o instanceof K){if(o.value0 instanceof je&&o.value0.value2 instanceof Y&&p instanceof Y)return f=!0,Et(n)(o.value1)(new pn(Y.value,o.value0.value0,o.value0.value1,Y.value));if(o.value0 instanceof Ae&&o.value0.value0 instanceof Y&&p instanceof Y)return f=!0,Et(n)(o.value1)(new pn(Y.value,o.value0.value1,o.value0.value2,Y.value));if(o.value0 instanceof je&&o.value0.value2 instanceof pn){c=o.value1,_=new Pn(p,o.value0.value0,o.value0.value1,o.value0.value2.value0,o.value0.value2.value1,o.value0.value2.value2,o.value0.value2.value3);return}if(o.value0 instanceof Ae&&o.value0.value0 instanceof pn){c=o.value1,_=new Pn(o.value0.value0.value0,o.value0.value0.value1,o.value0.value0.value2,o.value0.value0.value3,o.value0.value1,o.value0.value2,p);return}return o.value0 instanceof je&&o.value0.value2 instanceof Pn?(f=!0,Et(n)(o.value1)(new pn(new pn(p,o.value0.value0,o.value0.value1,o.value0.value2.value0),o.value0.value2.value1,o.value0.value2.value2,new pn(o.value0.value2.value3,o.value0.value2.value4,o.value0.value2.value5,o.value0.value2.value6)))):o.value0 instanceof Ae&&o.value0.value0 instanceof Pn?(f=!0,Et(n)(o.value1)(new pn(new pn(o.value0.value0.value0,o.value0.value0.value1,o.value0.value0.value2,o.value0.value0.value3),o.value0.value0.value4,o.value0.value0.value5,new pn(o.value0.value0.value6,o.value0.value1,o.value0.value2,p)))):o.value0 instanceof Ge&&o.value0.value2 instanceof Y&&o.value0.value5 instanceof Y&&p instanceof Y?(f=!0,Et(n)(o.value1)(new Pn(Y.value,o.value0.value0,o.value0.value1,Y.value,o.value0.value3,o.value0.value4,Y.value))):o.value0 instanceof se&&o.value0.value0 instanceof Y&&o.value0.value5 instanceof Y&&p instanceof Y?(f=!0,Et(n)(o.value1)(new Pn(Y.value,o.value0.value1,o.value0.value2,Y.value,o.value0.value3,o.value0.value4,Y.value))):o.value0 instanceof Xe&&o.value0.value0 instanceof Y&&o.value0.value3 instanceof Y&&p instanceof Y?(f=!0,Et(n)(o.value1)(new Pn(Y.value,o.value0.value1,o.value0.value2,Y.value,o.value0.value4,o.value0.value5,Y.value))):o.value0 instanceof Ge&&o.value0.value2 instanceof pn?(f=!0,Et(n)(o.value1)(new pn(new Pn(p,o.value0.value0,o.value0.value1,o.value0.value2.value0,o.value0.value2.value1,o.value0.value2.value2,o.value0.value2.value3),o.value0.value3,o.value0.value4,o.value0.value5))):o.value0 instanceof se&&o.value0.value0 instanceof pn?(f=!0,Et(n)(o.value1)(new pn(new Pn(o.value0.value0.value0,o.value0.value0.value1,o.value0.value0.value2,o.value0.value0.value3,o.value0.value1,o.value0.value2,p),o.value0.value3,o.value0.value4,o.value0.value5))):o.value0 instanceof se&&o.value0.value5 instanceof pn?(f=!0,Et(n)(o.value1)(new pn(o.value0.value0,o.value0.value1,o.value0.value2,new Pn(p,o.value0.value3,o.value0.value4,o.value0.value5.value0,o.value0.value5.value1,o.value0.value5.value2,o.value0.value5.value3)))):o.value0 instanceof Xe&&o.value0.value3 instanceof pn?(f=!0,Et(n)(o.value1)(new pn(o.value0.value0,o.value0.value1,o.value0.value2,new Pn(o.value0.value3.value0,o.value0.value3.value1,o.value0.value3.value2,o.value0.value3.value3,o.value0.value4,o.value0.value5,p)))):o.value0 instanceof Ge&&o.value0.value2 instanceof Pn?(f=!0,Et(n)(o.value1)(new Pn(new pn(p,o.value0.value0,o.value0.value1,o.value0.value2.value0),o.value0.value2.value1,o.value0.value2.value2,new pn(o.value0.value2.value3,o.value0.value2.value4,o.value0.value2.value5,o.value0.value2.value6),o.value0.value3,o.value0.value4,o.value0.value5))):o.value0 instanceof se&&o.value0.value0 instanceof Pn?(f=!0,Et(n)(o.value1)(new Pn(new pn(o.value0.value0.value0,o.value0.value0.value1,o.value0.value0.value2,o.value0.value0.value3),o.value0.value0.value4,o.value0.value0.value5,new pn(o.value0.value0.value6,o.value0.value1,o.value0.value2,p),o.value0.value3,o.value0.value4,o.value0.value5))):o.value0 instanceof se&&o.value0.value5 instanceof Pn?(f=!0,Et(n)(o.value1)(new Pn(o.value0.value0,o.value0.value1,o.value0.value2,new pn(p,o.value0.value3,o.value0.value4,o.value0.value5.value0),o.value0.value5.value1,o.value0.value5.value2,new pn(o.value0.value5.value3,o.value0.value5.value4,o.value0.value5.value5,o.value0.value5.value6)))):o.value0 instanceof Xe&&o.value0.value3 instanceof Pn?(f=!0,Et(n)(o.value1)(new Pn(o.value0.value0,o.value0.value1,o.value0.value2,new pn(o.value0.value3.value0,o.value0.value3.value1,o.value0.value3.value2,o.value0.value3.value3),o.value0.value3.value4,o.value0.value3.value5,new pn(o.value0.value3.value6,o.value0.value4,o.value0.value5,p)))):(f=!0,Zr("The impossible happened in partial function `up`."))}throw new Error("Failed pattern match at Data.Map.Internal (line 552, column 5 - line 573, column 86): "+[o.constructor.name])}for(;!f;)d=m(c,_);return d}},e=function(l){return function(_){var c=l,f=!1,d;function m(o,p){if(p instanceof pn&&p.value0 instanceof Y&&p.value3 instanceof Y)return f=!0,r(o)(Y.value);if(p instanceof pn){c=new K(new Ae(p.value0,p.value1,p.value2),o),_=p.value3;return}if(p instanceof Pn&&p.value0 instanceof Y&&p.value3 instanceof Y&&p.value6 instanceof Y)return f=!0,r(new K(new Ae(Y.value,p.value1,p.value2),o))(Y.value);if(p instanceof Pn){c=new K(new Xe(p.value0,p.value1,p.value2,p.value3,p.value4,p.value5),o),_=p.value6;return}return f=!0,Zr("The impossible happened in partial function `removeMaxNode`.")}for(;!f;)d=m(c,_);return d}},a=function(l){var _=!1,c;function f(d){if(d instanceof pn&&d.value3 instanceof Y)return _=!0,{key:d.value1,value:d.value2};if(d instanceof pn){l=d.value3;return}if(d instanceof Pn&&d.value6 instanceof Y)return _=!0,{key:d.value4,value:d.value5};if(d instanceof Pn){l=d.value6;return}return _=!0,Zr("The impossible happened in partial function `maxNode`.")}for(;!_;)c=f(l);return c},u=un(n),i=function(l){return function(_){var c=l,f=!1,d;function m(o,p){if(p instanceof Y)return f=!0,D.value;if(p instanceof pn){var B=u(t)(p.value1);if(p.value3 instanceof Y&&B instanceof cn)return f=!0,new v(new F(p.value2,r(o)(Y.value)));if(B instanceof cn){var Wn=a(p.value0);return f=!0,new v(new F(p.value2,e(new K(new je(Wn.key,Wn.value,p.value3),o))(p.value0)))}if(B instanceof tn){c=new K(new je(p.value1,p.value2,p.value3),o),_=p.value0;return}c=new K(new Ae(p.value0,p.value1,p.value2),o),_=p.value3;return}if(p instanceof Pn){var Kt=function(){return p.value0 instanceof Y&&p.value3 instanceof Y&&p.value6 instanceof Y}(),B=u(t)(p.value4),kn=u(t)(p.value1);if(Kt&&kn instanceof cn)return f=!0,new v(new F(p.value2,Et(n)(o)(new pn(Y.value,p.value4,p.value5,Y.value))));if(Kt&&B instanceof cn)return f=!0,new v(new F(p.value5,Et(n)(o)(new pn(Y.value,p.value1,p.value2,Y.value))));if(kn instanceof cn){var Wn=a(p.value0);return f=!0,new v(new F(p.value2,e(new K(new Ge(Wn.key,Wn.value,p.value3,p.value4,p.value5,p.value6),o))(p.value0)))}if(B instanceof cn){var Wn=a(p.value3);return f=!0,new v(new F(p.value5,e(new K(new se(p.value0,p.value1,p.value2,Wn.key,Wn.value,p.value6),o))(p.value3)))}if(kn instanceof tn){c=new K(new Ge(p.value1,p.value2,p.value3,p.value4,p.value5,p.value6),o),_=p.value0;return}if(kn instanceof _n&&B instanceof tn){c=new K(new se(p.value0,p.value1,p.value2,p.value4,p.value5,p.value6),o),_=p.value3;return}c=new K(new Xe(p.value0,p.value1,p.value2,p.value3,p.value4,p.value5),o),_=p.value6;return}throw new Error("Failed pattern match at Data.Map.Internal (line 525, column 16 - line 548, column 80): "+[p.constructor.name])}for(;!f;)d=m(c,_);return d}};return i(ft.value)}};var Ya=function(){return Y.value}();var N_=function(n){return function(t){return function(r){return Yn(r)(Rt)(xg(n)(t)(r))}}};var Za=function(n){return function(t){return function(r){return function(e){var a=t(si(n)(r)(e));if(a instanceof D)return N_(n)(r)(e);if(a instanceof v)return _i(n)(r)(a.value0)(e);throw new Error("Failed pattern match at Data.Map.Internal (line 596, column 15 - line 598, column 25): "+[a.constructor.name])}}}};var k_={compact:function(n){return function(){var r=ma(),e=Ju(function(a){return ja(n)(a)})();return ju(e)(function(){var a=Q(bt);return function(u){return a(function(i){if(i instanceof D)return y(ir)(0);if(i instanceof v)return Te(i.value0)(r);throw new Error("Failed pattern match at Data.Compactable (line 111, column 34 - line 113, column 35): "+[i.constructor.name])}(u))}}())(),fe(r)()}()},separate:function(n){return function(){var r=ma(),e=ma(),a=Ju(function(u){return ja(n)(u)})();return ju(a)(function(){var u=Q(bt);return function(i){return u(function(l){if(l instanceof O)return Te(l.value0)(r);if(l instanceof P)return Te(l.value0)(e);throw new Error("Failed pattern match at Data.Compactable (line 122, column 34 - line 124, column 31): "+[l.constructor.name])}(i))}}())(),bn(As)(s(bt)(function(u){return function(i){return{left:u,right:i}}})(fe(r)))(fe(e))()}()}};var ba=function(n){return n.compact};var R_={partitionMap:function(n){var t=function(r){return function(e){var a=n(e);if(a instanceof O)return{left:A(Tt)(r.left)([a.value0]),right:r.right};if(a instanceof P)return{right:A(Tt)(r.right)([a.value0]),left:r.left};throw new Error("Failed pattern match at Data.Filterable (line 149, column 16 - line 151, column 50): "+[a.constructor.name])}};return it(Sn)(t)({left:[],right:[]})},partition:zu,filterMap:Gf,filter:Io,Compactable0:function(){return k_},Functor1:function(){return ot}};var cr=function(n){return n.filterMap};var O_=function(n){return n.filter};var vt={dimap:function(n){return function(t){return function(r){return function(e){return t(r(n(e)))}}}}},W_=function(n){return n.dimap},Ct=function(n){return function(t){return W_(n)(t)(Z(rn))}};var to=function(n){return n.keepLatest},Qe=function(n){return n.fold};var Ca=function(n){return function(t){return function(r){return function(e){return cr(n.Filterable1())(Rt)(Qe(n)(function(a){return function(u){return s(va)(y(Be))(t(a)(u.value0))}})(r)(new F(e,D.value)))}}}};var Ke=function(n){return n.bang};function uc(n){return function(t){return n===t}}var H_=uc;var Hg=function(n){return n};var Jt=function(n){return function(t){return n(t)}},Bg=function(n){return function(t){return function(r){return function(e){return function(a){return g(n.Monad0().Bind1())(vn(n)(Lt(D.value)))(function(u){return g(n.Monad0().Bind1())(r(function(i){return vn(n)(Q(bt)(ur(new v(i))(u)))}))(function(i){return g(n.Monad0().Bind1())(e(function(l){return g(n.Monad0().Bind1())(vn(n)(gt(u)))(Qr(t)(Pt)(function(_){return a(l(_))}))}))(function(l){return y(t)(Cn(t.Apply0())(i)(l))})})})}}}}},lr=Hg,qg=function(n){return function(t){return function(r){return g(n.Monad0().Bind1())(vn(n)(Lt(D.value)))(function(e){return g(n.Monad0().Bind1())(t(function(a){return Vn(Jn)(n.Monad0().Bind1())(g(n.Monad0().Bind1())(vn(n)(gt(e)))(Yu(n.Monad0().Applicative0())(Pt)))(function(){return g(n.Monad0().Bind1())(Jt(a)(r))(function(u){return vn(n)(Q(bt)(ur(new v(u))(e)))})})}))(function(a){return y(n.Monad0().Applicative0())(Vn(Jn)(n.Monad0().Bind1())(g(n.Monad0().Bind1())(vn(n)(gt(e)))(Yu(n.Monad0().Applicative0())(Pt)))(function(){return a}))})})}}},Xn={map:function(n){return function(t){return function(r){return t(function(e){return r(n(e))})}}}};var zg=function(n){return function(t){return function(r){return function(e){return function(a){return g(n.Monad0().Bind1())(vn(n)(Lt(e)))(function(u){return r(function(i){return g(n.Monad0().Bind1())(vn(n)(Vt(t(i))(u)))(a)})})}}}}},jo=function(n){return function(t){return function(r){return function(e){return r(function(a){var u=t(a);if(u instanceof v)return e(u.value0);if(u instanceof D)return y(n)(void 0);throw new Error("Failed pattern match at FRP.Event (line 126, column 13 - line 128, column 27): "+[u.constructor.name])})}}}},ic=function(n){return function(t){return jo(n)(function(r){var e=t(r);if(e)return new v(r);if(!e)return D.value;throw new Error("Failed pattern match at FRP.Event (line 84, column 13 - line 86, column 25): "+[e.constructor.name])})}};var fc=function(n){return function(t){return g(n.Monad0().Bind1())(vn(n)(Lt([])))(function(r){return y(n.Monad0().Applicative0())({event:function(e){return g(t.Monad0().Bind1())(vn(t)(Vt(function(a){return A(Tt)(a)([e])})(r)))(function(){return y(t.Monad0().Applicative0())(g(t.Monad0().Bind1())(vn(t)(Vt(jf(H_)(e))(r)))(function(){return y(t.Monad0().Applicative0())(void 0)}))})},push:function(e){return g(t.Monad0().Bind1())(vn(t)(gt(r)))(Qr(t.Monad0().Applicative0())(Sn)(function(a){return a(e)}))}})})}},Vg=function(n){return function(t){return function(r){return function(e){return g(t.Bind1())(fc(n)(n))(function(a){var u=r(a.event);return g(t.Bind1())(Jt(u.input)(a.push))(function(i){return g(t.Bind1())(Jt(u.output)(e))(function(l){return y(t.Applicative0())(Cn(t.Bind1().Apply0())(i)(l))})})})}}}},B_=function(n){return function(t){return function(r){return lr(function(e){return g(n.Monad0().Bind1())(fc(n)(n))(function(a){return Vn(Jn)(n.Monad0().Bind1())(e(r(a.event)))(function(){return Jt(t)(a.push)})})})}}},Go=function(n){return{compact:jo(n)(Z(rn)),separate:function(t){return{left:jo(n)(function(r){if(r instanceof O)return new v(r.value0);if(r instanceof P)return D.value;throw new Error("Failed pattern match at FRP.Event (line 67, column 13 - line 69, column 33): "+[r.constructor.name])})(t),right:jo(n)(function(r){if(r instanceof P)return new v(r.value0);if(r instanceof O)return D.value;throw new Error("Failed pattern match at FRP.Event (line 74, column 13 - line 76, column 32): "+[r.constructor.name])})(t)}}}},te=function(n){return{filter:ic(n),filterMap:jo(n),partition:function(t){return function(r){return{yes:ic(n)(t)(r),no:ic(n)(function(){var e=Ur(rr);return function(a){return e(t(a))}}())(r)}}},partitionMap:function(t){return function(r){return{left:cr(te(n))(function(){var e=Wr(v.create)(E(D.value));return function(a){return e(t(a))}}())(r),right:cr(te(n))(function(e){return gf(t(e))})(r)}}},Compactable0:function(){return Go(n)},Functor1:function(){return Xn}}},Ye=function(n){return function(t){return lr(function(r){return g(n.Monad0().Bind1())(fc(n)(n))(function(e){return Vn(Jn)(n.Monad0().Bind1())(r(t(e.push)(e.event)))(function(){return y(n.Monad0().Applicative0())(y(n.Monad0().Applicative0())(void 0))})})})}},S=function(n){return function(t){return function(r){return s(n.Apply0().Functor0())(function(e){return y(n)(void 0)})(r(t))}}},An=function(n){return{alt:function(t){return function(r){return function(e){return bn(n.Apply0())(s(n.Apply0().Functor0())(function(a){return function(u){return Cn(n.Apply0())(a)(u)}})(t(e)))(r(e))}}},Functor0:function(){return Xn}}},dn=function(n){return{empty:function(t){return y(n)(y(n)(void 0))},Alt0:function(){return An(n)}}},Ft=function(n){return{fold:zg(n),keepLatest:qg(n),sampleOn:Bg(n)(n.Monad0().Applicative0()),fix:Vg(n)(n.Monad0()),bang:S(n.Monad0().Applicative0()),Plus0:function(){return dn(n.Monad0().Applicative0())},Filterable1:function(){return te(n.Monad0().Applicative0())}}};var q_="_____$__$_$$_vbus";function cc(n){return()=>{for(let t in n)delete n[t]}}function lc(n){return()=>{let t=(u,i,l,_)=>{let c=Object.keys(_);for(var f=0;f<c.length;f++)if(_[c[f]]instanceof Object&&_[c[f]][q_]===q_){let d={},m={};t(u,d,m,_[c[f]]),i[c[f]]=d,l[c[f]]=m}else{let d=`${Math.random()}`;u[d]={},i[c[f]]=m=>()=>{let o=Object.keys(u[d]);for(var p=0;p<o.length;p++)u[d][o[p]](m)()},l[c[f]]=m=>()=>{let o=`${Math.random()}`;return u[d][o]=m,()=>{delete u[d][o]}}}},r={},e={},a={};return t(r,e,a,n),{p:e,e:a,s:r}}}var sc=function(n){return function(t){return function(r){return function(e){return n(t,r,e)}}}};var mc=function(n){return function(){return function(){return function(t){return function(r){return function(e){return ge(Nt(n)(t))(r)(e)}}}}}},vc=function(n){return function(){return function(t){return function(r){return Er(Nt(n)(t))(r)}}}};var vi={vb:function(n){return function(t){return function(r){return{}}}}},V_=function(n){return n.vb},J_=function(){return function(n){return function(t){return function(r){return function(e){var a=V_(t)(x.value)(x.value)(x.value);return lr(function(u){return g(n.Monad0().Bind1())(lc(a))(function(i){return Vn(Jn)(n.Monad0().Bind1())(u(e(i.p)(i.e)))(function(){return y(n.Monad0().Applicative0())(cc(i.s))})})})}}}}};var ro=function(n){return function(){return function(){return function(t){return function(){return function(){return function(){return function(){return{vb:function(r){return function(e){return function(a){return mc(n)()()(x.value)(void 0)(V_(t)(x.value)(x.value)(x.value))}}}}}}}}}}}};var Ze=function(){function n(t){this.value0=t}return n.create=function(t){return new n(t)},n}(),yc=function(){function n(){}return n.value=new n,n}();var Xo=function(){function n(t){this.value0=t}return n.create=function(t){return new n(t)},n}(),Qo=function(){function n(){}return n.value=new n,n}(),di=function(){function n(t){this.value0=t}return n.create=function(t){return new n(t)},n}(),Di=function(){function n(t){this.value0=t}return n.create=function(t){return new n(t)},n}(),yi=function(){function n(t){this.value0=t}return n.create=function(t){return new n(t)},n}(),Ko=function(){function n(t){this.value0=t}return n.create=function(t){return new n(t)},n}(),yn=function(){function n(t){this.value0=t}return n.create=function(t){return new n(t)},n}();var ha={eq:function(n){return function(t){return n instanceof Ze&&t instanceof Ze?n.value0===t.value0:n instanceof yc&&t instanceof yc}}};var Yo=function(){return function(n){return function(t){return function(r){return function(e){return new Ko(J_()(n)(t)(r)(e))}}}}},rt=function(n){return new yi(n)};var Ta=function(n){return new Di(n)},Ea=function(n){return function(t){return new Ko(Ye(n)(t))}};var _e=function(n){return n.reflectType};var eo={map:function(n){return function(t){return s(ot)(n)(t)}}};var tb=function(n){return _e(n)},gi=function(){return function(n){return n}};var gc=function(){return function(){return function(){return function(){return function(){return function(n){return function(t){return function(r){return r[tb(n)(t)]}}}}}}}};var G_=[];var bc=function(){return function(){return function(n){return function(t){return qo(n)(t)}}}};function X_(n){return function(){var t={};for(var r in n)hasOwnProperty.call(n,r)&&(t[r]=n[r]);return t}}var na={};function hc(n){return n()}function Q_(n){return function(t){return function(r){return function(e){var a=r;function u(l){return function(_){return t(_)(l)(e[l])}}for(var i in e)hasOwnProperty.call(e,i)&&(a=n(a)(u(i)));return a}}}}function bi(n){return function(t){var r=[];for(var e in t)hasOwnProperty.call(t,e)&&r.push(n(e)(t[e]));return r}}var rb=Object.keys||bi(function(n){return function(){return n}});function Tc(n){return function(t){return function(r){return function(){return r[n]=t,r}}}}var Ec=function(n){return function(t){return function(){return delete t[n],t}}};var lb=bi(function(n){return function(t){return t}});var sb=X_;var K_=function(n){return function(t){return hc(function(){var e=sb(t)();return n(e)(),e})}};var ao=function(n){return function(t){return K_(Tc(n)(t))}};var Y_=Q_(pf),_b=function(n){return function(t){return Y_(function(r){return function(e){return function(a){return A(n.Semigroup0())(r)(t(e)(a))}}})(Tn(n))}},Z_={foldl:function(n){return Y_(function(t){return function(r){return n(t)}})},foldr:function(n){return function(t){return function(r){return ut(Sn)(n)(t)(lb(r))}}},foldMap:function(n){return function(t){return _b(n)(E(t))}}};var Fc=function(n){return K_(Ec(n))};var np=function(){function n(){}return n.value=new n,n}(),xc=function(){function n(){}return n.value=new n,n}(),pb=function(){function n(){}return n.value=new n,n}();var Zo=function(n){return function(t){return function(r){var e=function(a){var u=function(i){return function(l){return new F(l+1|0,new F(i,l))}};return Ca(Ft(n))(u)(a)(0)};return new Di(to(Ft(n))(B_(n)(e(r))(function(a){return s(Xn)(function(u){return H(An(n.Monad0().Applicative0()))(Ke(Ft(n))(new Xo(t(u.value0))))(s(Xn)(E(Qo.value))(O_(te(n.Monad0().Applicative0()))(function(){var i=nn(To)(u.value1+1|0);return function(l){return i(Rt(l))}}())(a)))})(a)})))}}},pe=function(n){return function(t){return function(r){return function(e){return function(a){var u=function(i){return i(e)(a)};return function(i){if(i instanceof yi)return ce(Sn)(dn(n))(pe(n)(t)(r)(e)(a))(i.value0);if(i instanceof Ko)return to(Ft(t))(s(Xn)(pe(n)(t)(r)(e)(a))(i.value0));if(i instanceof yn)return u(r.toElt(i.value0));if(i instanceof Di)return lr(function(l){return g(t.Monad0().Bind1())(vn(t)(Lt(na)))(function(_){return g(t.Monad0().Bind1())(Jt(i.value0)(function(c){return g(t.Monad0().Bind1())(r.ids(a))(function(f){return g(t.Monad0().Bind1())(vn(t)(Lt(y(n)(void 0))))(function(d){return g(t.Monad0().Bind1())(r.ids(a))(function(m){return g(t.Monad0().Bind1())(vn(t)(Lt(y(n)(void 0))))(function(o){return g(t.Monad0().Bind1())(vn(t)(Lt(D.value)))(function(p){return g(t.Monad0().Bind1())(vn(t)(Lt(y(n)(void 0))))(function(B){return g(t.Monad0().Bind1())(s(n.Apply0().Functor0())(Ze.create)(r.ids(a)))(function(Wn){return g(t.Monad0().Bind1())(vn(t)(Lt(np.value)))(function(Kt){return g(t.Monad0().Bind1())(Jt(c)(function(kn){return g(t.Monad0().Bind1())(vn(t)(gt(Kt)))(function(Br){return kn instanceof di&&Br instanceof xc?g(t.Monad0().Bind1())(vn(t)(gt(p)))(Qr(n)(Pt)(function(){var pr=r.doLogic(kn.value0)(a);return function(W){return l(pr(W))}}())):kn instanceof Qo&&Br instanceof xc?Vn(Jn)(t.Monad0().Bind1())(Q(n.Apply0().Functor0())(vn(t)(ur(pb.value)(Kt))))(function(){var pr=Cn(n.Apply0())(Cn(n.Apply0())(Cn(n.Apply0())(Cn(n.Apply0())(g(t.Monad0().Bind1())(vn(t)(gt(p)))(Qr(n)(Pt)(function(W){return er(n)(Pt)(e.parent)(function(Yt){return l(r.disconnectElement(a)({id:W,parent:Yt,scope:Wn}))})})))(la(t.Monad0().Bind1())(vn(t)(gt(d)))))(la(t.Monad0().Bind1())(vn(t)(gt(o)))))(Q(n.Apply0().Functor0())(vn(t)(Vt(Fc(f))(_)))))(Q(n.Apply0().Functor0())(vn(t)(Vt(Fc(m))(_))));return Cn(n.Apply0())(Q(n.Apply0().Functor0())(vn(t)(ur(pr)(B))))(pr)}):kn instanceof Xo&&Br instanceof np?Vn(Jn)(t.Monad0().Bind1())(Q(n.Apply0().Functor0())(vn(t)(ur(xc.value)(Kt))))(function(){return g(t.Monad0().Bind1())(Jt(pe(n)(t)(r)({parent:e.parent,scope:Wn,raiseId:function(pr){return Q(n.Apply0().Functor0())(vn(t)(ur(new v(pr))(p)))}})(a)(function(){return kn.value0 instanceof yn?kn.value0:r.wrapElt(kn.value0)}()))(l))(function(pr){return Vn(Jn)(t.Monad0().Bind1())(Q(n.Apply0().Functor0())(vn(t)(Vt(ao(m)(pr))(_))))(function(){return Q(n.Apply0().Functor0())(vn(t)(ur(pr)(o)))})})}):y(n)(void 0)})}))(function(kn){return Vn(Jn)(t.Monad0().Bind1())(Q(n.Apply0().Functor0())(vn(t)(ur(kn)(d))))(function(){return Vn(Jn)(t.Monad0().Bind1())(Q(n.Apply0().Functor0())(vn(t)(Vt(ao(f)(kn))(_))))(function(){return la(t.Monad0().Bind1())(vn(t)(gt(B)))})})})})})})})})})})})}))(function(c){return y(n)(Vn(Jn)(t.Monad0().Bind1())(g(t.Monad0().Bind1())(vn(t)(gt(_)))(it(Z_)(Cn(n.Apply0()))(y(n)(void 0))))(function(){return c}))})})});throw new Error("Failed pattern match at Bolson.Control (line 209, column 17 - line 294, column 20): "+[i.constructor.name])}}}}}};var mb=h,vb=function(){return function(n){return function(t){return function(r){return function(e){return function(a){return function(u){return function(i){var l=function(_){return function(c){return lr(function(f){return g(n.Monad0().Bind1())($s(s(ot)(E(""))(gi()(u))))(function(d){var m=za(Sn)(dn(n.Monad0().Applicative0()))(Me(zo)(function(o){return wf(Ws)(function(p){return function(B){return B instanceof yn?function(Wn){return Wn({parent:D.value,scope:r(_.scope),raiseId:function(Kt){return Ss(o)(Kt)(d)}})(c)}(e.toElt(B.value0)):p(e.wrapElt(B))}})})(gi()(u)));return g(n.Monad0().Bind1())(Jt(m)(f))(function(o){return g(n.Monad0().Bind1())(vn(n)(Lt(y(n.Monad0().Applicative0())(void 0))))(function(p){return g(n.Monad0().Bind1())(s(n.Monad0().Bind1().Apply0().Functor0())(h)(Ps(d)))(function(B){var Wn=s(eo)(function(kn){return function(Br){return new yn(a.fromElt(function(pr){return function(W){return lr(function(Yt){return Vn(Jn)(n.Monad0().Bind1())(pr.raiseId(kn))(function(){return Vn(Jn)(n.Monad0().Bind1())(er(n.Monad0().Applicative0())(Pt)(pr.parent)(function(Do){return Yt(a.giveNewParent(W)({id:kn,parent:Do,scope:pr.scope})(Br))}))(function(){return y(n.Monad0().Applicative0())(y(n.Monad0().Applicative0())(void 0))})})})}}))}})(B),Kt=pe(n.Monad0().Applicative0())(n)(e)(_)(c)(mb(i(Wn)(h)));return g(n.Monad0().Bind1())(Jt(Kt)(f))(function(kn){return Vn(Jn)(n.Monad0().Bind1())(Q(n.Monad0().Bind1().Apply0().Functor0())(vn(n)(ur(kn)(p))))(function(){return y(n.Monad0().Applicative0())(Vn(Jn)(n.Monad0().Bind1())(o)(function(){return Vn(Jn)(n.Monad0().Bind1())(De(n.Monad0().Applicative0())(!t)(er(n.Monad0().Applicative0())(Sn)(gi()(B))(function(Br){return f(a.deleteFromCache(c)({id:Br}))})))(function(){return la(n.Monad0().Bind1())(vn(n)(gt(p)))})}))})})})})})})})}};return new yn(a.fromElt(l))}}}}}}}};var tp=function(){return function(n){return function(t){return function(r){return function(e){return function(a){return vb()(n)(!1)(Z(rn))(t)(r)(e)(a)}}}}}};var db=function(n){return n},tu=function(){function n(t){this.value0=t}return n.create=function(t){return new n(t)},n}(),ru=function(){function n(t){this.value0=t}return n.create=function(t){return new n(t)},n}(),Db=function(n){return n},Ci=Wo(),lt=Db;var jt=function(){return tu.create}();var Fa=function(){return ru.create}(),Qn=function(){var n=s(It)(s(xn)(E(!0)));return function(t){return db(n(t))}}(),on=function(n){return n.attr};var yb=function(n){return n.makeText},gb=function(n){return function(t){return function(r){return s(Xn)(function(e){return n.setText(function(a){return{id:t,text:a}}(e))})(r)}}},bb=function(n){return function(t){return function(r){return s(Xn)(function(e){return function(a){if(a.value instanceof tu)return n.setProp({id:t,key:a.key,value:a.value.value0});if(a.value instanceof ru)return n.setCb({id:t,key:a.key,value:a.value.value0});throw new Error("Failed pattern match at Deku.Control (line 68, column 26 - line 70, column 45): "+[a.value.constructor.name])}(Ci(e))})(r)}}},Cb=function(n){return n.makeElement},Lr=function(n){return function(t){var r=function(e){return function(a){return lr(function(u){return g(n.Bind1())(a.ids)(function(i){return Vn(Jn)(n.Bind1())(e.raiseId(i))(function(){return s(n.Bind1().Apply0().Functor0())(Cn(n.Bind1().Apply0())(u(a.deleteFromCache({id:i}))))(Jt(za(Sn)(dn(n.Applicative0()))([S(n.Applicative0())(yb(a)({id:i,parent:e.parent,scope:e.scope})),gb(a)(i)(t)]))(u))})})})}};return new yn(r)}},wn=function(n){return function(t){return Lr(n)(S(n.Applicative0())(t))}},On=function(n){return function(t){return function(r){return function(e){var a=function(u){return function(i){return lr(function(l){return g(n.Monad0().Bind1())(i.ids)(function(_){return Vn(Jn)(n.Monad0().Bind1())(u.raiseId(_))(function(){return s(n.Monad0().Bind1().Apply0().Functor0())(Cn(n.Monad0().Bind1().Apply0())(l(i.deleteFromCache({id:_}))))(Jt(H(An(n.Monad0().Applicative0()))(za(Sn)(dn(n.Monad0().Applicative0()))([S(n.Monad0().Applicative0())(Cb(i)({id:_,parent:u.parent,scope:u.scope,tag:t})),bb(i)(_)(r)]))(hb(n)({parent:new v(_),scope:u.scope,raiseId:function(c){return y(n.Monad0().Applicative0())(void 0)}})(i)(e)))(l))})})})}};return a}}}},hb=function(n){return pe(n.Monad0().Applicative0())(n)({doLogic:function(t){return function(r){return function(e){return r.sendToTop({id:e})}}},ids:function(){var t=mt();return function(r){return function(e){return e.ids}(t(r))}}(),disconnectElement:function(t){return function(r){return t.disconnectElement({id:r.id,scope:r.scope,parent:r.parent,scopeEq:nn(ha)})}},wrapElt:function(){var t=On(n)("div")(ln(dn(n.Monad0().Applicative0())));return function(r){return yn.create(t(r))}}(),toElt:function(t){return t}})};var rp=function(){return function(n){return function(t){return function(r){return tp()(n)({doLogic:function(e){return function(a){return function(u){return a.sendToTop({id:u})}}},ids:function(){var e=mt();return function(a){return function(u){return u.ids}(e(a))}}(),disconnectElement:function(e){return function(a){return e.disconnectElement({id:a.id,scope:a.scope,parent:a.parent,scopeEq:nn(ha)})}},wrapElt:function(){var e=On(n)("div")(ln(dn(n.Monad0().Applicative0())));return function(a){return yn.create(e(a))}}(),toElt:function(e){return e}})({fromElt:function(e){return e},giveNewParent:function(e){return function(a){return function(u){return mt()(e).giveNewParent(a)}}},deleteFromCache:function(){var e=mt();return function(a){return function(u){return u.deleteFromCache}(e(a))}}()})(t)(Ct(vt)(s(eo)(function(e){return e(void 0)}))(r))}}}};var Zn=function(){function n(){}return n.value=new n,n}(),oo={attr:function(n){return function(t){return lt({key:"click",value:Fa(E(Sr(xn)(t)(!0)))})}}};var _t={attr:function(n){return function(t){return lt({key:"click",value:Fa(t)})}}};var or=function(){function n(){}return n.value=new n,n}();var uo={attr:function(n){return function(t){return lt({key:"style",value:jt(t)})}}};var ep={attr:function(n){return function(t){return lt({key:"style",value:jt(t)})}}};var ap={attr:function(n){return function(t){return lt({key:"style",value:jt(t)})}}};var wc={attr:function(n){return function(t){return lt({key:"style",value:jt(t)})}}};var hi={attr:function(n){return function(t){return lt({key:"style",value:jt(t)})}}};var op={attr:function(n){return function(t){return lt({key:"style",value:jt(t)})}}};var Ti=function(n){return function(t){return function(r){return new yn(On(n)("a")(t)(rt(r)))}}};var Ac=function(n){return function(t){return function(r){return new yn(On(n)("div")(t)(rt(r)))}}},Nn=function(n){return Ac(n)(ln(dn(n.Monad0().Applicative0())))};var Ma=function(n){return function(t){return function(r){return new yn(On(n)("span")(t)(rt(r)))}}},au=function(n){return Ma(n)(ln(dn(n.Monad0().Applicative0())))};var ip=function(){function n(){}return n.value=new n,n}();var fp={attr:function(n){return function(t){return lt({key:"href",value:jt(t)})}}};var io=function(){function n(){}return n.value=new n,n}();var cp={attr:function(n){return function(t){return lt({key:"type",value:jt(t)})}}};var Fi={attr:function(n){return function(t){return lt({key:"type",value:jt(t)})}}};var sr=function(n){return function(t){return function(r){return new yn(On(n)("button")(t)(rt(r)))}}},lp=function(n){return sr(n)(ln(dn(n.Monad0().Applicative0())))};var Eb=function(n){return function(t){return function(r){return new yn(On(n)("code")(t)(rt(r)))}}},xt=function(n){return Eb(n)(ln(dn(n.Monad0().Applicative0())))};var Fb=function(n){return function(t){return function(r){return new yn(On(n)("i")(t)(rt(r)))}}},sp=function(n){return Fb(n)(ln(dn(n.Monad0().Applicative0())))};var ra=function(n){return function(t){return function(r){return new yn(On(n)("input")(t)(rt(r)))}}};var xb=function(n){return function(t){return function(r){return new yn(On(n)("li")(t)(rt(r)))}}},_p=function(n){return xb(n)(ln(dn(n.Monad0().Applicative0())))};var Ab=function(n){return function(t){return function(r){return new yn(On(n)("pre")(t)(rt(r)))}}},wt=function(n){return Ab(n)(ln(dn(n.Monad0().Applicative0())))};var Lb=function(n){return function(t){return function(r){return new yn(On(n)("ul")(t)(rt(r)))}}},pp=function(n){return Lb(n)(ln(dn(n.Monad0().Applicative0())))};var xi=function(){function n(){}return n.value=new n,n}(),ou=function(){function n(){}return n.value=new n,n}(),uu=function(){function n(){}return n.value=new n,n}(),iu=function(){function n(){}return n.value=new n,n}(),fu=function(){function n(){}return n.value=new n,n}(),cu=function(){function n(){}return n.value=new n,n}(),lu=function(){function n(){}return n.value=new n,n}(),su=function(){function n(){}return n.value=new n,n}(),_u=function(){function n(){}return n.value=new n,n}(),pu=function(){function n(){}return n.value=new n,n}();function Ic(){window.scrollTo(0,0)}var Gt=Ic;var Sb=function(n){return n};var At=function(n){return{pursxToElement:function(t){return function(r){return function(e){return{cache:na,element:function(a){return function(u){return ln(dn(n))}}}}}}}},$c=function(n){return n.pursxToElement},Wt=function(){return function(n){return function(t){return function(r){return function(e){return{pursxToElement:function(a){return function(u){return function(i){var l=$c(n)(a)(x.value)(i);return{cache:ao(_e(t)(x.value))(!0)(l.cache),element:function(_){return function(c){return H(An(e.Monad0().Applicative0()))(s(Xn)(Ct(vt)(Ci)(function(f){if(f.value instanceof tu)return c.setProp({id:_e(t)(x.value)+a,key:f.key,value:f.value.value0});if(f.value instanceof ru)return c.setCb({id:_e(t)(x.value)+a,key:f.key,value:f.value.value0});throw new Error("Failed pattern match at Deku.Pursx (line 4476, column 38 - line 4486, column 24): "+[f.value.constructor.name])}))(vc(r)()(x.value)(i)))(l.element(_)(c))}}}}}}}}}}}};var qn=Sb,Sc=function(n){return function(t){return function(){return function(){return function(r){return function(e){return function(a){return function(u){return function(i){var l=function(_){return function(c){return lr(function(f){return g(r.Monad0().Bind1())(c.ids)(function(d){return g(r.Monad0().Bind1())(c.ids)(function(m){return Vn(Jn)(r.Monad0().Bind1())(_.raiseId(d))(function(){var o=$c(e)(m)(x.value)(i);return s(r.Monad0().Bind1().Apply0().Functor0())(Cn(r.Monad0().Bind1().Apply0())(f(c.deleteFromCache({id:d}))))(Jt(H(An(r.Monad0().Applicative0()))(S(r.Monad0().Applicative0())(c.makePursx({id:d,parent:_.parent,cache:o.cache,pxScope:m,scope:_.scope,html:_e(n)(u),verb:_e(t)(a)})))(o.element(_)(c)))(f))})})})})}};return new yn(l)}}}}}}}}},$t=function(n){return function(){return function(){return function(t){return function(r){return Sc(n)({reflectType:function(){return"~"}})()()(r)(t)(x.value)}}}}},mp=function(n){return function(){return function(t){return function(r){return function(e){return $t(n)()()(r)(t)(e)({})}}}}},Pb=function(n){return pe(n.Monad0().Applicative0())(n)({doLogic:function(t){return function(r){return function(e){return r.sendToTop({id:e})}}},ids:function(){var t=mt();return function(r){return function(e){return e.ids}(t(r))}}(),disconnectElement:function(t){return function(r){return t.disconnectElement({id:r.id,scope:r.scope,parent:r.parent,scopeEq:nn(ha)})}},wrapElt:function(){var t=On(n)("div")(ln(dn(n.Monad0().Applicative0())));return function(r){return yn.create(t(r))}}(),toElt:function(t){return t}})},zn=function(){return function(n){return function(t){return function(r){return function(e){return{pursxToElement:function(a){return function(u){return function(i){var l=vc(r)()(x.value)(i),_=$c(n)(a)(x.value)(i);return{cache:ao(_e(t)(x.value))(!1)(_.cache),element:function(c){return function(f){return H(An(e.Monad0().Applicative0()))(Pb(e)({parent:new v(_e(t)(x.value)+a),scope:c.scope,raiseId:function(d){return y(e.Monad0().Applicative0())(void 0)}})(f)(l))(_.element(c)(f))}}}}}}}}}}}};var Nb=function(){return x.value}(),vp=function(n){return function(t){return $t({reflectType:function(){return`<div>
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
</div>`}})()()(zn()(Wt()(zn()(At(n.Monad0().Applicative0()))({reflectType:function(){return"result"}})({reflectSymbol:function(){return"result"}})(n))({reflectType:function(){return"next"}})({reflectSymbol:function(){return"next"}})(n))({reflectType:function(){return"code"}})({reflectSymbol:function(){return"code"}})(n))(n)(Nb)({code:qn(wt(n)([xt(n)([wn(n.Monad0())(`module Main where

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
  )`)])])),result:qn(Nn(n)([lp(n)([wn(n.Monad0())("I do nothing")]),pp(n)(s(ot)(function(){var r=_p(n),e=y(ho),a=wn(n.Monad0());return function(u){return r(e(a(u)))}}())(["A","B","C"])),Nn(n)([Ti(n)(S(n.Monad0().Applicative0())(on(fp)(ip.value)("https://example.com")))([wn(n.Monad0())("foo ")]),sp(n)([wn(n.Monad0())(" bar ")]),Ma(n)(S(n.Monad0().Applicative0())(on(uo)(or.value)("font-weight: 800;")))([wn(n.Monad0())(" baz")])]),Nn(n)([Nn(n)([Nn(n)([ra(n)(S(n.Monad0().Applicative0())(on(Fi)(io.value)("range")))([])])])])])),next:S(n.Monad0().Applicative0())(on(_t)(Zn.value)(Qn(E(Cn(kt)(t(iu.value))(Gt)))))})}};function dp(n,t,r,e,a){return function(u,i){var l=n.newXHR(),_=n.fixupUrl(a.url,l);if(l.open(a.method||"GET",_,!0,a.username,a.password),a.headers)try{for(var c=0,f;(f=a.headers[c])!=null;c++)l.setRequestHeader(f.field,f.value)}catch(m){u(m)}var d=function(m){return function(){u(new Error(m))}};return l.onerror=d(r),l.ontimeout=d(t),l.onload=function(){i({status:l.status,statusText:l.statusText,headers:l.getAllResponseHeaders().split(`\r
`).filter(function(m){return m.length>0}).map(function(m){var o=m.indexOf(":");return e(m.substring(0,o))(m.substring(o+2))}),body:l.response})},l.responseType=a.responseType,l.withCredentials=a.withCredentials,l.timeout=a.timeout,l.send(a.content),function(m,o,p){try{l.abort()}catch(B){return o(B)}return p()}}}var wi="application/json",Dp="application/x-www-form-urlencoded";var gp=function(){function n(t){this.value0=t}return n.create=function(t){return new n(t)},n}(),bp=function(){function n(t){this.value0=t}return n.create=function(t){return new n(t)},n}(),Cp=function(){function n(t){this.value0=t}return n.create=function(t){return new n(t)},n}(),hp=function(){function n(t){this.value0=t}return n.create=function(t){return new n(t)},n}(),Tp=function(){function n(t){this.value0=t}return n.create=function(t){return new n(t)},n}(),Pc=function(){function n(t){this.value0=t}return n.create=function(t){return new n(t)},n}(),Nc=function(){function n(t){this.value0=t}return n.create=function(t){return new n(t)},n}(),Ep=function(n){return n instanceof Pc?new v(Dp):n instanceof Nc?new v(wi):D.value};var Ai=function(){function n(t){this.value0=t}return n.create=function(t){return new n(t)},n}(),Li=function(){function n(t){this.value0=t}return n.create=function(t){return new n(t)},n}(),Fp=function(){function n(t,r){this.value0=t,this.value1=r}return n.create=function(t){return function(r){return new n(t,r)}},n}(),Mp=function(n){if(n instanceof Ai)return mt()(n.value0);if(n instanceof Li)return mt()(n.value0);if(n instanceof Fp)return n.value1;throw new Error("Failed pattern match at Affjax.RequestHeader (line 26, column 1 - line 26, column 33): "+[n.constructor.name])};var kc=function(n){if(n instanceof Ai)return"Accept";if(n instanceof Li)return"Content-Type";if(n instanceof Fp)return n.value0;throw new Error("Failed pattern match at Affjax.RequestHeader (line 21, column 1 - line 21, column 32): "+[n.constructor.name])};var Rc=function(){function n(t){this.value0=t}return n.create=function(t){return new n(t)},n}(),Oc=function(){function n(t){this.value0=t}return n.create=function(t){return new n(t)},n}(),Wc=function(){function n(t){this.value0=t}return n.create=function(t){return new n(t)},n}(),mu=function(){function n(t){this.value0=t}return n.create=function(t){return new n(t)},n}(),Uc=function(){function n(t){this.value0=t}return n.create=function(t){return new n(t)},n}(),Ii=function(){function n(t){this.value0=t}return n.create=function(t){return new n(t)},n}(),xp=function(n){if(n instanceof Rc)return"arraybuffer";if(n instanceof Oc)return"blob";if(n instanceof Wc)return"document";if(n instanceof mu||n instanceof Uc)return"text";if(n instanceof Ii)return"";throw new Error("Failed pattern match at Affjax.ResponseFormat (line 44, column 3 - line 50, column 19): "+[n.constructor.name])},wp=function(n){return n instanceof mu?new v(wi):D.value};var Ap=function(){return new mu(Z(rn))}(),Lp=function(){return new Ii(Z(rn))}();var $p=function(){function n(t,r){this.value0=t,this.value1=r}return n.create=function(t){return function(r){return new n(t,r)}},n}();function vu(n){return n.message}var re=function(n){return n.throwError};var Pe=function(n){return n.catchError};var $i=function(n){return function(t){return Pe(n)(s(n.MonadThrow0().Monad0().Bind1().Apply0().Functor0())(P.create)(t))(function(){var r=y(n.MonadThrow0().Monad0().Applicative0());return function(e){return r(O.create(e))}}())}};var de=function(n){return n.state};var fo=function(n){return function(t){return de(n)(function(r){var e=t(r);return new F(e,e)})}};var ee=function(n){return n.liftEffect};var qc=function(n){return n};var zc=function(n){return n};var Ri=function(n){return function(t){return n(t)}},Np=function(n){return{map:function(t){return Ri(s(n)(s(Na)(t)))}}};var Vc=function(n){return{Applicative0:function(){return Aa(n)},Bind1:function(){return Jc(n)}}},Jc=function(n){return{bind:function(t){return function(r){return g(n.Bind1())(t)(Wr(function(){var e=y(n.Applicative0());return function(a){return e(O.create(a))}}())(function(e){var a=r(e);return a}))}},Apply0:function(){return kp(n)}}},kp=function(n){return{apply:Pr(Vc(n)),Functor0:function(){return Np(n.Bind1().Apply0().Functor0())}}},Aa=function(n){return{pure:function(){var t=y(n.Applicative0());return function(r){return qc(t(P.create(r)))}}(),Apply0:function(){return kp(n)}}};var Rp=function(n){return{throwError:function(){var t=y(n.Applicative0());return function(r){return qc(t(O.create(r)))}}(),Monad0:function(){return Vc(n)}}};var jc=function(n){return function(t){return{alt:function(r){return function(e){return g(t.Bind1())(r)(function(a){if(a instanceof P)return y(t.Applicative0())(new P(a.value0));if(a instanceof O)return g(t.Bind1())(e)(function(u){if(u instanceof P)return y(t.Applicative0())(new P(u.value0));if(u instanceof O)return y(t.Applicative0())(new O(A(n)(a.value0)(u.value0)));throw new Error("Failed pattern match at Control.Monad.Except.Trans (line 86, column 9 - line 88, column 49): "+[u.constructor.name])});throw new Error("Failed pattern match at Control.Monad.Except.Trans (line 82, column 5 - line 88, column 49): "+[a.constructor.name])})}},Functor0:function(){return Np(t.Bind1().Apply0().Functor0())}}}};var Op=function(){var n=mt();return function(t){return n(zc(t))}}();function Gc(n){return JSON.stringify(n)}function Xc(n){return function(t){return JSON.stringify(t,null,n)}}var Wp=na;function Hp(n,t,r){try{return t(JSON.parse(r))}catch(e){return n(e.message)}}var Bp=function(n){return Hp(O.create,P.create,n)};var Qc=function(n){return function(t){return t.join(n)}};function Zb(n){return n.replace(/[!'()*]/g,function(t){return"%"+t.charCodeAt(0).toString(16)})}var Vp=function(t,r,e){try{return r(Zb(encodeURIComponent(e)).replace(/%20/g,"+"))}catch(a){return t(a)}};var Ui=function(){return sc(Vp)(E(D.value))(v.create)}();var rC=function(n){return n};var Jp=function(){var n=function(e){if(e.value1 instanceof D)return Ui(e.value0);if(e.value1 instanceof v)return bn(_a)(s(et)(function(a){return function(u){return a+("="+u)}})(Ui(e.value0)))(Ui(e.value1.value0));throw new Error("Failed pattern match at Data.FormURLEncoded (line 37, column 16 - line 39, column 114): "+[e.constructor.name])},t=s(et)(Qc("&")),r=fr(Ve)(Be)(n);return function(e){return t(r(rC(e)))}}();var aC=function(){function n(){}return n.value=new n,n}(),Cu=function(){function n(){}return n.value=new n,n}(),oC=function(){function n(){}return n.value=new n,n}(),jp=function(){function n(){}return n.value=new n,n}(),Gp=function(){function n(){}return n.value=new n,n}(),Xp=function(){function n(){}return n.value=new n,n}(),uC=function(){function n(){}return n.value=new n,n}(),iC=function(){function n(){}return n.value=new n,n}(),fC=function(){function n(){}return n.value=new n,n}(),cC=function(){function n(){}return n.value=new n,n}(),lC=function(){function n(){}return n.value=new n,n}(),sC=function(){function n(){}return n.value=new n,n}(),_C=function(){function n(){}return n.value=new n,n}(),pC=function(){function n(){}return n.value=new n,n}(),mC=function(){function n(){}return n.value=new n,n}(),Qp=function(){function n(){}return n.value=new n,n}();var vC=function(n){return n},dC={show:function(n){if(n instanceof aC)return"OPTIONS";if(n instanceof Cu)return"GET";if(n instanceof oC)return"HEAD";if(n instanceof jp)return"POST";if(n instanceof Gp)return"PUT";if(n instanceof Xp)return"DELETE";if(n instanceof uC)return"TRACE";if(n instanceof iC)return"CONNECT";if(n instanceof fC)return"PROPFIND";if(n instanceof cC)return"PROPPATCH";if(n instanceof lC)return"MKCOL";if(n instanceof sC)return"COPY";if(n instanceof _C)return"MOVE";if(n instanceof pC)return"LOCK";if(n instanceof mC)return"UNLOCK";if(n instanceof Qp)return"PATCH";throw new Error("Failed pattern match at Data.HTTP.Method (line 43, column 1 - line 59, column 23): "+[n.constructor.name])}};var Kp=Wr(R(dC))(vC);var nm=function(){var n=ii(nc);return function(t){return fi(n(t))}}();var tm=function(n){return n.value0};function em(n,t,r){return n==null?t:r(n)}function Yc(n){return n}var lo=Yn(null)(Yc),Ut=function(n){return em(n,D.value,v.create)};var hr=function(){var n={},t="Pure",r="Throw",e="Catch",a="Sync",u="Async",i="Bind",l="Bracket",_="Fork",c="Sequential",f="Map",d="Apply",m="Alt",o="Cons",p="Resume",B="Release",Wn="Finalizer",Kt="Finalized",kn="Forked",Br="Fiber",pr="Thunk";function W($,$n,dt,Un){this.tag=$,this._1=$n,this._2=dt,this._3=Un}function Yt($){var $n=function(dt,Un,q){return new W($,dt,Un,q)};return $n.tag=$,$n}function Do($){return new W(t,void 0)}function md($){try{$()}catch($n){setTimeout(function(){throw $n},0)}}function vd($,$n,dt){try{return $n(dt())}catch(Un){return $(Un)}}function dd($,$n,dt){try{return $n(dt)()}catch(Un){return dt($(Un))(),Do}}var Au=function(){var $=1024,$n=0,dt=0,Un=new Array($),q=!1;function w(){var Rn;for(q=!0;$n!==0;)$n--,Rn=Un[dt],Un[dt]=void 0,dt=(dt+1)%$,Rn();q=!1}return{isDraining:function(){return q},enqueue:function(Rn){var Dn,pt;$n===$&&(pt=q,w(),q=pt),Un[(dt+$n)%$]=Rn,$n++,q||w()}}}();function Dd($){var $n={},dt=0,Un=0;return{register:function(q){var w=dt++;q.onComplete({rethrow:!0,handler:function(Rn){return function(){Un--,delete $n[w]}}})(),$n[w]=q,Un++},isEmpty:function(){return Un===0},killAll:function(q,w){return function(){if(Un===0)return w();var Rn=0,Dn={};function pt(jn){Dn[jn]=$n[jn].kill(q,function(ht){return function(){delete Dn[jn],Rn--,$.isLeft(ht)&&$.fromLeft(ht)&&setTimeout(function(){throw $.fromLeft(ht)},0),Rn===0&&w()}})()}for(var Bt in $n)$n.hasOwnProperty(Bt)&&(Rn++,pt(Bt));return $n={},dt=0,Un=0,function(jn){return new W(a,function(){for(var ht in Dn)Dn.hasOwnProperty(ht)&&Dn[ht]()})}}}}}var Ia=0,mr=1,Lu=2,Iu=3,$u=4,Tr=5,yo=6;function sf($,$n,dt){var Un=0,q=Ia,w=dt,Rn=null,Dn=null,pt=null,Bt=null,jn=null,ht=0,ia=0,$r=null,Re=!0;function Oe(z){for(var V,Fn,Ln;;)switch(V=null,Fn=null,Ln=null,q){case Lu:q=mr;try{w=pt(w),Bt===null?pt=null:(pt=Bt._1,Bt=Bt._2)}catch(Xt){q=Tr,Rn=$.left(Xt),w=null}break;case Iu:$.isLeft(w)?(q=Tr,Rn=w,w=null):pt===null?q=Tr:(q=Lu,w=$.fromRight(w));break;case mr:switch(w.tag){case i:pt&&(Bt=new W(o,pt,Bt)),pt=w._2,q=mr,w=w._1;break;case t:pt===null?(q=Tr,w=$.right(w._1)):(q=Lu,w=w._1);break;case a:q=Iu,w=vd($.left,$.right,w._1);break;case u:q=$u,w=dd($.left,w._1,function(Xt){return function(){Un===z&&(Un++,Au.enqueue(function(){Un===z+1&&(q=Iu,w=Xt,Oe(Un))}))}});return;case r:q=Tr,Rn=$.left(w._1),w=null;break;case e:pt===null?jn=new W(o,w,jn,Dn):jn=new W(o,w,new W(o,new W(p,pt,Bt),jn,Dn),Dn),pt=null,Bt=null,q=mr,w=w._1;break;case l:ht++,pt===null?jn=new W(o,w,jn,Dn):jn=new W(o,w,new W(o,new W(p,pt,Bt),jn,Dn),Dn),pt=null,Bt=null,q=mr,w=w._1;break;case _:q=Iu,V=sf($,$n,w._2),$n&&$n.register(V),w._1&&V.run(),w=$.right(V);break;case c:q=mr,w=gd($,$n,w._1);break}break;case Tr:if(pt=null,Bt=null,jn===null)q=yo,w=Dn||Rn||w;else switch(V=jn._3,Ln=jn._1,jn=jn._2,Ln.tag){case e:Dn&&Dn!==V&&ht===0?q=Tr:Rn&&(q=mr,w=Ln._2($.fromLeft(Rn)),Rn=null);break;case p:Dn&&Dn!==V&&ht===0||Rn?q=Tr:(pt=Ln._1,Bt=Ln._2,q=Lu,w=$.fromRight(w));break;case l:ht--,Rn===null&&(Fn=$.fromRight(w),jn=new W(o,new W(B,Ln._2,Fn),jn,V),(Dn===V||ht>0)&&(q=mr,w=Ln._3(Fn)));break;case B:jn=new W(o,new W(Kt,w,Rn),jn,Dn),q=mr,Dn&&Dn!==V&&ht===0?w=Ln._1.killed($.fromLeft(Dn))(Ln._2):Rn?w=Ln._1.failed($.fromLeft(Rn))(Ln._2):w=Ln._1.completed($.fromRight(w))(Ln._2),Rn=null,ht++;break;case Wn:ht++,jn=new W(o,new W(Kt,w,Rn),jn,Dn),q=mr,w=Ln._1;break;case Kt:ht--,q=Tr,w=Ln._1,Rn=Ln._2;break}break;case yo:for(var yt in $r)$r.hasOwnProperty(yt)&&(Re=Re&&$r[yt].rethrow,md($r[yt].handler(w)));$r=null,Dn&&Rn?setTimeout(function(){throw $.fromLeft(Rn)},0):$.isLeft(w)&&Re&&setTimeout(function(){if(Re)throw $.fromLeft(w)},0);return;case Ia:q=mr;break;case $u:return}}function Dt(z){return function(){if(q===yo)return Re=Re&&z.rethrow,z.handler(w)(),function(){};var V=ia++;return $r=$r||{},$r[V]=z,function(){$r!==null&&delete $r[V]}}}function G(z,V){return function(){if(q===yo)return V($.right(void 0))(),function(){};var Fn=Dt({rethrow:!1,handler:function(){return V($.right(void 0))}})();switch(q){case Ia:Dn=$.left(z),q=yo,w=Dn,Oe(Un);break;case $u:Dn===null&&(Dn=$.left(z)),ht===0&&(q===$u&&(jn=new W(o,new W(Wn,w(z)),jn,Dn)),q=Tr,w=null,Rn=null,Oe(++Un));break;default:Dn===null&&(Dn=$.left(z)),ht===0&&(q=Tr,w=null,Rn=null)}return Fn}}function gn(z){return function(){var V=Dt({rethrow:!1,handler:z})();return q===Ia&&Oe(Un),V}}return{kill:G,join:gn,onComplete:Dt,isSuspended:function(){return q===Ia},run:function(){q===Ia&&(Au.isDraining()?Oe(Un):Au.enqueue(function(){Oe(Un)}))}}}function yd($,$n,dt,Un){var q=0,w={},Rn=0,Dn={},pt=new Error("[ParAff] Early exit"),Bt=null,jn=n;function ht(Dt,G,gn){var z=G,V=null,Fn=null,Ln=0,yt={},Xt,go;n:for(;;)switch(Xt=null,z.tag){case kn:if(z._3===n&&(Xt=w[z._1],yt[Ln++]=Xt.kill(Dt,function(bd){return function(){Ln--,Ln===0&&gn(bd)()}})),V===null)break n;z=V._2,Fn===null?V=null:(V=Fn._1,Fn=Fn._2);break;case f:z=z._2;break;case d:case m:V&&(Fn=new W(o,V,Fn)),V=z,z=z._1;break}if(Ln===0)gn($.right(void 0))();else for(go=0,Xt=Ln;go<Xt;go++)yt[go]=yt[go]();return yt}function ia(Dt,G,gn){var z,V,Fn,Ln,yt,Xt;$.isLeft(Dt)?(z=Dt,V=null):(V=Dt,z=null);n:for(;;){if(Fn=null,Ln=null,yt=null,Xt=null,Bt!==null)return;if(G===null){Un(z||V)();return}if(G._3!==n)return;switch(G.tag){case f:z===null?(G._3=$.right(G._1($.fromRight(V))),V=G._3):G._3=z;break;case d:if(Fn=G._1._3,Ln=G._2._3,z){if(G._3=z,yt=!0,Xt=Rn++,Dn[Xt]=ht(pt,z===Fn?G._2:G._1,function(){return function(){delete Dn[Xt],yt?yt=!1:gn===null?ia(z,null,null):ia(z,gn._1,gn._2)}}),yt){yt=!1;return}}else{if(Fn===n||Ln===n)return;V=$.right($.fromRight(Fn)($.fromRight(Ln))),G._3=V}break;case m:if(Fn=G._1._3,Ln=G._2._3,Fn===n&&$.isLeft(Ln)||Ln===n&&$.isLeft(Fn))return;if(Fn!==n&&$.isLeft(Fn)&&Ln!==n&&$.isLeft(Ln))z=V===Fn?Ln:Fn,V=null,G._3=z;else if(G._3=V,yt=!0,Xt=Rn++,Dn[Xt]=ht(pt,V===Fn?G._2:G._1,function(){return function(){delete Dn[Xt],yt?yt=!1:gn===null?ia(V,null,null):ia(V,gn._1,gn._2)}}),yt){yt=!1;return}break}gn===null?G=null:(G=gn._1,gn=gn._2)}}function $r(Dt){return function(G){return function(){delete w[Dt._1],Dt._3=G,ia(G,Dt._2._1,Dt._2._2)}}}function Re(){var Dt=mr,G=dt,gn=null,z=null,V,Fn;n:for(;;)switch(V=null,Fn=null,Dt){case mr:switch(G.tag){case f:gn&&(z=new W(o,gn,z)),gn=new W(f,G._1,n,n),G=G._2;break;case d:gn&&(z=new W(o,gn,z)),gn=new W(d,n,G._2,n),G=G._1;break;case m:gn&&(z=new W(o,gn,z)),gn=new W(m,n,G._2,n),G=G._1;break;default:Fn=q++,Dt=Tr,V=G,G=new W(kn,Fn,new W(o,gn,z),n),V=sf($,$n,V),V.onComplete({rethrow:!1,handler:$r(G)})(),w[Fn]=V,$n&&$n.register(V)}break;case Tr:if(gn===null)break n;gn._1===n?(gn._1=G,Dt=mr,G=gn._2,gn._2=n):(gn._2=G,G=gn,z===null?gn=null:(gn=z._1,z=z._2))}for(jn=G,Fn=0;Fn<q;Fn++)w[Fn].run()}function Oe(Dt,G){Bt=$.left(Dt);var gn;for(var z in Dn)if(Dn.hasOwnProperty(z)){gn=Dn[z];for(z in gn)gn.hasOwnProperty(z)&&gn[z]()}Dn=null;var V=ht(Dt,jn,G);return function(Fn){return new W(u,function(Ln){return function(){for(var yt in V)V.hasOwnProperty(yt)&&V[yt]();return Do}})}}return Re(),function(Dt){return new W(u,function(G){return function(){return Oe(Dt,G)}})}}function gd($,$n,dt){return new W(u,function(Un){return function(){return yd($,$n,dt,Un)}})}return W.EMPTY=n,W.Pure=Yt(t),W.Throw=Yt(r),W.Catch=Yt(e),W.Sync=Yt(a),W.Async=Yt(u),W.Bind=Yt(i),W.Bracket=Yt(l),W.Fork=Yt(_),W.Seq=Yt(c),W.ParMap=Yt(f),W.ParApply=Yt(d),W.ParAlt=Yt(m),W.Fiber=sf,W.Supervisor=Dd,W.Scheduler=Au,W.nonCanceler=Do,W}(),om=hr.Pure,um=hr.Throw;function im(n){return function(t){return hr.Catch(n,t)}}function fm(n){return function(t){return t.tag===hr.Pure.tag?hr.Pure(n(t._1)):hr.Bind(t,function(r){return hr.Pure(n(r))})}}function cm(n){return function(t){return hr.Bind(n,t)}}var lm=hr.Sync;var hu=hr.Async;function sm(n,t){return function(){return hr.Fiber(n,null,t)}}var yC=function(){function n(r,e){return r===0&&typeof setImmediate<"u"?setImmediate(e):setTimeout(e,r)}function t(r,e){return r===0&&typeof clearImmediate<"u"?clearImmediate(e):clearTimeout(e)}return function(r,e){return hr.Async(function(a){return function(){var u=n(e,a(r()));return function(){return hr.Sync(function(){return r(t(e,u))})}}})}}(),gC=hr.Seq;var PC=function(n,t,r){var e=0,a;return function(u){if(e===2)return a;if(e===1)throw new ReferenceError(n+" was needed before it finished initializing (module "+t+", line "+u+")",t,u);return e=1,a=r(),e=2,a}};var tl={map:fm};var NC=function(){var n=function(e){if(e instanceof P)return e.value0;if(e instanceof O)return Zr("unsafeFromRight: Left");throw new Error("Failed pattern match at Effect.Aff (line 407, column 21 - line 409, column 54): "+[e.constructor.name])},t=function(e){if(e instanceof O)return e.value0;if(e instanceof P)return Zr("unsafeFromLeft: Right");throw new Error("Failed pattern match at Effect.Aff (line 402, column 20 - line 404, column 55): "+[e.constructor.name])},r=function(e){if(e instanceof O)return!0;if(e instanceof P)return!1;throw new Error("Failed pattern match at Effect.Aff (line 397, column 12 - line 399, column 21): "+[e.constructor.name])};return{isLeft:r,fromLeft:t,fromRight:n,left:O.create,right:P.create}}(),kC=function(n){return sm(NC,n)},RC=function(n){return function(){var r=kC(n)();return r.run(),r}},dm=function(){var n=Q(xn);return function(t){return n(RC(t))}}();var rl={Applicative0:function(){return Hi},Bind1:function(){return el}},el={bind:cm,Apply0:function(){return Dm(0)}},Hi={pure:om,Apply0:function(){return Dm(0)}},Dm=PC("applyAff","Effect.Aff",function(){return{apply:Pr(rl),Functor0:function(){return tl}}});var al={liftEffect:lm,Monad0:function(){return rl}};var OC={throwError:um,Monad0:function(){return rl}},ym={catchError:im,MonadThrow0:function(){return OC}};var gm=E(y(Hi)(void 0));var Em=function(n){return hu(function(t){return function(){var e=n(function(a){return t(O.create(a))()},function(a){return t(P.create(a))()});return function(a){return hu(function(u){return function(){return e(a,function(l){return u(O.create(l))()},function(l){return u(P.create(l))()}),gm}})}}})};function Bi(n){return Object.prototype.toString.call(n).slice(8,-1)}var Fm=Array.isArray||function(n){return Object.prototype.toString.call(n)==="[object Array]"};var Mm=function(n){return function(t){return function(r){return(r|0)===r?n(r):t}}},_r=function(n){return n};var qi=isFinite;var fl=Math.floor;var Tu=function(n){return function(t){return n%t}};var zi=function(){return Mm(v.create)(D.value)}(),fh=function(n){if(!qi(n))return 0;if(n>=_r(kr(sa)))return kr(sa);if(n<=_r(Vr(sa)))return Vr(sa);if(Zt)return tr(0)(zi(n));throw new Error("Failed pattern match at Data.Int (line 72, column 1 - line 72, column 29): "+[n.constructor.name])};var ll=function(n){return fh(fl(n))};var sl=function(){function n(t){this.value0=t}return n.create=function(t){return new n(t)},n}(),Nm=function(){function n(t,r){this.value0=t,this.value1=r}return n.create=function(t){return function(r){return new n(t,r)}},n}(),vh=function(){function n(t,r){this.value0=t,this.value1=r}return n.create=function(t){return function(r){return new n(t,r)}},n}(),dh=function(){function n(t,r){this.value0=t,this.value1=r}return n.create=function(t){return function(r){return new n(t,r)}},n}(),aa=h,Dh=h;var Ji=function(n){if(n instanceof sl)return n.value0;if(n instanceof vh)return"Error at array index "+(R(Or)(n.value0)+(": "+Ji(n.value1)));if(n instanceof dh)return"Error at property "+(R(Rr)(n.value0)+(": "+Ji(n.value1)));if(n instanceof Nm)return"Type mismatch: expected "+(n.value0+(", found "+n.value1));throw new Error("Failed pattern match at Foreign (line 78, column 1 - line 78, column 45): "+[n.constructor.name])};var _l=function(n){var t=re(Rp(n));return function(r){return t(nm(r))}};var oa=function(n){return function(t){return function(r){if(Bi(r)===t)return y(Aa(n))(Dh(r));if(Zt)return _l(n)(new Nm(t,Bi(r)));throw new Error("Failed pattern match at Foreign (line 123, column 1 - line 123, column 104): "+[t.constructor.name,r.constructor.name])}}};var pl=function(){function n(t){this.value0=t}return n.create=function(t){return new n(t)},n}(),ml=function(){function n(t,r){this.value0=t,this.value1=r}return n.create=function(t){return function(r){return new n(t,r)}},n}(),vl=function(){function n(){}return n.value=new n,n}(),dl=function(){function n(){}return n.value=new n,n}(),Dl=function(){function n(t){this.value0=t}return n.create=function(t){return new n(t)},n}(),km=function(n){return function(t){var r=function(f){return f===""?y(Aa(tt))(Wp):Wr(function(){var d=_l(tt);return function(m){return d(sl.create(m))}}())(y(Aa(tt)))(Bp(f))},e=function(){if(t.responseFormat instanceof Rc)return oa(tt)("ArrayBuffer");if(t.responseFormat instanceof Oc)return oa(tt)("Blob");if(t.responseFormat instanceof Wc)return function(f){return H(jc(Zf)(tt))(oa(tt)("Document")(f))(H(jc(Zf)(tt))(oa(tt)("XMLDocument")(f))(oa(tt)("HTMLDocument")(f)))};if(t.responseFormat instanceof mu)return Pu(Jc(tt))(function(f){return t.responseFormat.value0(r(f))})(oa(tt)("String"));if(t.responseFormat instanceof Uc)return oa(tt)("String");if(t.responseFormat instanceof Ii)return E(t.responseFormat.value0(y(Aa(tt))(void 0)));throw new Error("Failed pattern match at Affjax (line 274, column 18 - line 283, column 57): "+[t.responseFormat.constructor.name])}(),a=function(f){if(f instanceof gp)return new P(f.value0(aa));if(f instanceof bp)return new P(aa(f.value0));if(f instanceof Cp)return new P(aa(f.value0));if(f instanceof hp)return new P(aa(f.value0));if(f instanceof Tp)return new P(aa(f.value0));if(f instanceof Pc)return yf("Body contains values that cannot be encoded as application/x-www-form-urlencoded")(s(et)(aa)(Jp(f.value0)));if(f instanceof Nc)return new P(aa(Gc(f.value0)));throw new Error("Failed pattern match at Affjax (line 235, column 20 - line 250, column 69): "+[f.constructor.name])},u=function(f){return function(d){return f instanceof v&&!ze(Sn)(rr)(_f(nn(We))(kc)(f.value0))(d)?Jf(d)(f.value0):d}},i=function(f){return u(s(et)(Li.create)(ye(gr)(Ep)(f)))(u(s(et)(Ai.create)(wp(t.responseFormat)))(t.headers))},l=function(f){return{method:Kp(t.method),url:t.url,headers:s(ot)(function(d){return{field:kc(d),value:Mp(d)}})(i(t.content)),content:f,responseType:xp(t.responseFormat),username:lo(t.username),password:lo(t.password),withCredentials:t.withCredentials,timeout:tr(0)(s(et)(function(d){return d})(t.timeout))}},_=function(f){return qr(tl)($i(ym)(Em(dp(n,"AffjaxTimeoutErrorMessageIdent","AffjaxRequestFailedMessageIdent",$p.create,l(f)))))(function(d){if(d instanceof P){var m=Op(e(d.value0.body));if(m instanceof O)return new O(new ml(tm(m.value0),d.value0));if(m instanceof P)return new P({body:m.value0,headers:d.value0.headers,status:d.value0.status,statusText:d.value0.statusText});throw new Error("Failed pattern match at Affjax (line 209, column 9 - line 211, column 52): "+[m.constructor.name])}if(d instanceof O)return new O(function(){var o=vu(d.value0),p=o==="AffjaxTimeoutErrorMessageIdent";if(p)return vl.value;var B=o==="AffjaxRequestFailedMessageIdent";return B?dl.value:new Dl(d.value0)}());throw new Error("Failed pattern match at Affjax (line 207, column 144 - line 219, column 28): "+[d.constructor.name])})};if(t.content instanceof D)return _(lo(D.value));if(t.content instanceof v){var c=a(t.content.value0);if(c instanceof P)return _(lo(new v(c.value0)));if(c instanceof O)return y(Hi)(new O(new pl(c.value0)));throw new Error("Failed pattern match at Affjax (line 199, column 7 - line 203, column 48): "+[c.constructor.name])}throw new Error("Failed pattern match at Affjax (line 195, column 3 - line 203, column 48): "+[t.content.constructor.name])}},yl=function(n){if(n instanceof pl)return"There was a problem with the request content: "+n.value0;if(n instanceof ml)return"There was a problem with the response body: "+Ji(n.value0);if(n instanceof vl)return"There was a problem making the request: timeout";if(n instanceof dl)return"There was a problem making the request: request failed";if(n instanceof Dl)return"There was a problem making the request: "+vu(n.value0);throw new Error("Failed pattern match at Affjax (line 113, column 14 - line 123, column 66): "+[n.constructor.name])},ua=function(){return{method:new O(Cu.value),url:"/",headers:[],content:D.value,username:D.value,password:D.value,withCredentials:!1,responseFormat:Lp,timeout:D.value}}();var gl={newXHR:function(){return new XMLHttpRequest},fixupUrl:function(n){return n||"/"}};var Om=km(gl);var Um=function(){function n(){}return n.value=new n,n}(),bl=function(){function n(t){this.value0=t}return n.create=function(t){return new n(t)},n}(),Ch=function(){return x.value}(),Wm="Click to get some random user data.",hh=function(n){return Qn(E(function(){return n(Um.value)(),dm(g(el)(Om({method:new O(Cu.value),url:"https://randomuser.me/api/",headers:ua.headers,content:ua.content,username:ua.username,password:ua.password,withCredentials:ua.withCredentials,responseFormat:Ap,timeout:ua.timeout}))(function(r){if(r instanceof O)return ee(al)(n(new bl("GET /api response failed to decode: "+yl(r.value0))));if(r instanceof P)return ee(al)(n(new bl(Xc(2)(r.value0.body))));throw new Error("Failed pattern match at Deku.Example.Docs.Effects (line 44, column 9 - line 51, column 48): "+[r.constructor.name])}))()}))},Hm=function(n){return function(t){return function(r){return $t({reflectType:function(){return`<div>
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
</div>`}})()()(zn()(Wt()(zn()(At(n.Monad0().Applicative0()))({reflectType:function(){return"result"}})({reflectSymbol:function(){return"result"}})(n))({reflectType:function(){return"next"}})({reflectSymbol:function(){return"next"}})(n))({reflectType:function(){return"code"}})({reflectSymbol:function(){return"code"}})(n))(n)(Ch)({code:qn(wt(n)([xt(n)([wn(n.Monad0())(`module Main where

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
`)])])),result:qn(Ea(n)(Ct(vt)(s(It)(br(t)))(function(e){return function(a){var u=cr(te(n.Monad0().Applicative0()))(function(_){return _ instanceof Um?new v(new O(void 0)):_ instanceof bl?new v(new P(_.value0)):D.value})(a),i=cr(te(n.Monad0().Applicative0()))(function(_){return _ instanceof P?new v(_.value0):D.value})(u),l=cr(te(n.Monad0().Applicative0()))(function(_){return _ instanceof O?new v(void 0):D.value})(u);return Nn(n)([Nn(n)([sr(n)(S(n.Monad0().Applicative0())(on(_t)(Zn.value)(hh(e))))([Lr(n.Monad0())(H(An(n.Monad0().Applicative0()))(S(n.Monad0().Applicative0())(Wm))(H(An(n.Monad0().Applicative0()))(Sr(Xn)(l)("Loading..."))(Sr(Xn)(i)(Wm))))])]),Ac(n)(H(An(n.Monad0().Applicative0()))(S(n.Monad0().Applicative0())(on(wc)(or.value)("display: none;")))(Sr(Xn)(ba(Go(n.Monad0().Applicative0()))(Ca(Ft(n))(function(_){return function(c){return new F(c&&!1,function(){return c?new v(void 0):D.value}())}})(i)(!0)))(on(wc)(or.value)("display: block;"))))([wt(n)([xt(n)([Lr(n.Monad0())(H(An(n.Monad0().Applicative0()))(S(n.Monad0().Applicative0())(""))(i))])])])])}}))),next:S(n.Monad0().Applicative0())(on(_t)(Zn.value)(Qn(E(Cn(kt)(r(fu.value))(Gt)))))})}}};function zm(n){var t={};for(var r in n)({}).hasOwnProperty.call(n,r)&&(t[r]=n[r]);return t}function Vm(n){return function(t){return function(r){return r[n]=t(r[n]),r}}}var Jm=fa;var jm=function(){return function(){return function(n){return function(t){return function(r){return function(e){return Vm(Nt(n)(t))(r)(e)}}}}}};var Gm=rn,Xm=function(n){return function(t){return n(zm(t))}};var Ph=function(n){return n},Nh=function(n){return n.mappingWithIndex};var kh=function(n){return n.mapping};var ji={mapRecordWithIndexBuilder:function(n){return function(t){return Z(Gm)}}},Qm=function(n){return n.mapRecordWithIndexBuilder},so=function(n){return function(t){return function(r){return function(){return function(){return{mapRecordWithIndexBuilder:function(e){return function(a){return ca(Jm)(jm()()(n)(x.value)(Nh(t)(a)(x.value)))(Qm(r)(x.value)(a))}}}}}}}};var Gi=function(){return function(n){return{hmap:function(){var t=Qm(n)(x.value);return function(r){return Xm(t(Ph(r)))}}()}}};var Km=function(n){return n.hmap},_o=function(n){return{mappingWithIndex:function(t){return function(r){return kh(n)(t)}}}};var Rh=function(){function n(){}return n.value=new n,n}(),po=function(n){return{mapping:function(t){return s(It)(br(n))}}},Xi=function(n){return Km(n)(Rh.value)};var Qi=function(){function n(){}return n.value=new n,n}();var Ki={attr:function(n){return function(t){return lt({key:"input",value:Fa(t)})}}};function nv(n){return n.target}var nf=function(n){return Ut(nv(n))};function hl(n){return function(){return n.value}}function Tl(n){return function(){return n.valueAsNumber}}function ev(n,t,r,e){if(typeof window<"u"){var a=window[r];if(a!=null&&e instanceof a)return t(e)}for(var u=e;u!=null;){var i=Object.getPrototypeOf(u),l=i.constructor.name;if(l===r)return t(e);if(l==="Object")return n;u=i}return n}var L=function(n){return function(t){return ev(D.value,v.create,n,t)}};var tf=L("HTMLInputElement");var rf=function(n){var t=H(An(n))(S(n)(on(Fi)(io.value)("range"))),r=s(Xn)(function(e){return on(Ki)(Qi.value)(Qn(function(a){return er(xr)(Pt)(g(gr)(nf(a))(tf))(Nu(pa)(Tl)(e))}))});return function(e){return t(r(e))}},ef=function(n){return function(t){return function(r){return s(n)(function(){var e=on(r)(Zn.value);return function(a){return e(function(u){return u(Tn(t))}(a))}}())}}};var qh=function(){return x.value}(),uv=function(n){return function(t){return function(r){return $t({reflectType:function(){return`<div>
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
</div>`}})()()(zn()(Wt()(zn()(At(n.Monad0().Applicative0()))({reflectType:function(){return"result"}})({reflectSymbol:function(){return"result"}})(n))({reflectType:function(){return"next"}})({reflectSymbol:function(){return"next"}})(n))({reflectType:function(){return"code"}})({reflectSymbol:function(){return"code"}})(n))(n)(qh)({code:qn(wt(n)([xt(n)([wn(n.Monad0())(`module Main where

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
`)])])),result:qn(Yo()(n)(ro({reflectSymbol:function(){return"buttonClicked"}})()()(ro({reflectSymbol:function(){return"sliderMoved"}})()()(vi)()()()())()()()())(x.value)(Ct(vt)(Xi(Gi()(so({reflectSymbol:function(){return"buttonClicked"}})(_o(po(t)))(so({reflectSymbol:function(){return"sliderMoved"}})(_o(po(t)))(ji)()())()())))(function(e){return function(a){return Nn(n)([sr(n)(ef(Xn)(qe)(oo)(S(n.Monad0().Applicative0())(e.buttonClicked)))([wn(n.Monad0())("Click")]),Nn(n)([Lr(n.Monad0())(H(An(n.Monad0().Applicative0()))(S(n.Monad0().Applicative0())("Val: 0"))(s(Xn)(function(){var u=A(be)("Val: "),i=R(Or);return function(l){return u(i(l))}}())(Qe(Ft(n))(E(St(Fr)(1)))(H(An(n.Monad0().Applicative0()))(S(n.Monad0().Applicative0())(void 0))(a.buttonClicked))(-1))))]),Nn(n)([ra(n)(rf(n.Monad0().Applicative0())(S(n.Monad0().Applicative0())(e.sliderMoved)))([]),Nn(n)([Lr(n.Monad0())(H(An(n.Monad0().Applicative0()))(S(n.Monad0().Applicative0())("Val: 50"))(s(Xn)(function(){var u=A(be)("Val: "),i=R(Mo);return function(l){return u(i(l))}}())(a.sliderMoved)))])])])}}))),next:S(n.Monad0().Applicative0())(on(_t)(Zn.value)(Qn(E(Cn(kt)(r(lu.value))(Gt)))))})}}};var iv=function(){return new di(void 0)}(),fv=function(){return Qo.value}(),mo=function(){return Xo.create}();var cv=function(){function n(){}return n.value=new n,n}();var lv={attr:function(n){return function(t){return lt({key:"keyup",value:Fa(t)})}}};function Fl(n){return n.code}var sv=L("KeyboardEvent");var Xh=function(){function n(){}return n.value=new n,n}(),Ml=function(){function n(){}return n.value=new n,n}(),_v=function(){function n(t){this.value0=t}return n.create=function(t){return new n(t)},n}(),Qh=function(){return x.value}(),pv=function(n){return function(t){return function(r){return $t({reflectType:function(){return`<div>
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
</div>`}})()()(zn()(Wt()(zn()(At(t.Monad0().Applicative0()))({reflectType:function(){return"result"}})({reflectSymbol:function(){return"result"}})(t))({reflectType:function(){return"next"}})({reflectSymbol:function(){return"next"}})(t))({reflectType:function(){return"code"}})({reflectSymbol:function(){return"code"}})(t))(t)(Qh)({code:qn(wt(t)([xt(t)([wn(t.Monad0())(`module Main where

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
`)])])),result:qn(Ea(t)(Ct(vt)(s(It)(br(n)))(function(e){return Ct(vt)(function(a){return H(An(t.Monad0().Applicative0()))(S(t.Monad0().Applicative0())(Xh.value))(a)})(function(a){return Nn(t)([Nn(t)([ra(t)(ce(Sn)(dn(t.Monad0().Applicative0()))(S(t.Monad0().Applicative0()))([on(ap)(or.value)("border-style:solid;border-width: 1px;border-color: black;"),on(Ki)(Qi.value)(Qn(function(u){return er(xr)(Pt)(g(gr)(nf(u))(tf))(Nu(pa)(hl)(function(i){return e(_v.create(i))}))})),on(lv)(cv.value)(Qn(function(u){return er(xr)(Pt)(sv(u))(function(i){return De(xr)(Fl(i)==="Enter")(e(Ml.value))})}))]))([]),sr(t)(H(An(t.Monad0().Applicative0()))(S(t.Monad0().Applicative0())(on(hi)(or.value)("margin: 5px;")))(S(t.Monad0().Applicative0())(on(_t)(Zn.value)(Qn(E(e(Ml.value)))))))([wn(t.Monad0())("Add")])]),Nn(t)([Ta(s(Xn)(function(u){return to(Ft(t))(Ye(t)(Ct(vt)(s(It)(br(n)))(function(i){return function(l){return H(An(t.Monad0().Applicative0()))(S(t.Monad0().Applicative0())(mo(Nn(t)([Ma(t)(S(t.Monad0().Applicative0())(on(uo)(or.value)("margin: 5px;")))([wn(t.Monad0())(u)]),sr(t)(H(An(t.Monad0().Applicative0()))(S(t.Monad0().Applicative0())(on(hi)(or.value)("margin: 5px;")))(S(t.Monad0().Applicative0())(on(_t)(Zn.value)(Qn(E(i(iv)))))))([wn(t.Monad0())("Prioritize")]),sr(t)(H(An(t.Monad0().Applicative0()))(S(t.Monad0().Applicative0())(on(hi)(or.value)("margin: 5px;")))(S(t.Monad0().Applicative0())(on(_t)(Zn.value)(Qn(E(i(fv)))))))([wn(t.Monad0())("Delete")])]))))(l)}})))})(cr(te(t.Monad0().Applicative0()))(function(u){return u.value0?new v(u.value1):D.value})(Ca(Ft(t))(function(u){return function(i){return u instanceof _v?new F(u.value0,new F(!1,u.value0)):u instanceof Ml?new F(i,new F(!0,i)):new F("",new F(!1,""))}})(a)(""))))])])})}))),next:S(t.Monad0().Applicative0())(on(_t)(Zn.value)(Qn(E(Cn(kt)(r(_u.value))(Gt)))))})}}};var Yh=function(){return x.value}(),mv=function(n){return function(t){return $t({reflectType:function(){return`<div>
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
</div>`}})()()(zn()(Wt()(zn()(At(n.Monad0().Applicative0()))({reflectType:function(){return"result"}})({reflectSymbol:function(){return"result"}})(n))({reflectType:function(){return"next"}})({reflectSymbol:function(){return"next"}})(n))({reflectType:function(){return"code"}})({reflectSymbol:function(){return"code"}})(n))(n)(Yh)({code:qn(wt(n)([xt(n)([wn(n.Monad0())(`module Main where

import Prelude

import Deku.Control (text_)
import Deku.Toplevel (runInBody)
import Effect (Effect)

main :: Effect Unit
main = runInBody (text_ "Hello world")
`)])])),result:qn(Nn(n)([wn(n.Monad0())("Hello world")])),next:Ke(Ft(n))(on(_t)(Zn.value)(Qn(E(Cn(kt)(t(uu.value))(Gt)))))})}};var n0=function(){return x.value}(),vv=function(n){return function(t){return $t({reflectType:function(){return`<div>
  <h1>Deku</h1>

  <h3>A web micro-framework written in PureScript</h3>

  <p>Hi! You've found <a href="https://github.com/mikesol/purescript-deku">Deku</a>.</p>

  <p>Deku is the coolest web micro-framework that no one knows about yet. Except you, of course, as you're here. So welcome!</p>

  <p>The main goal of Deku is speed. I made it for the purpose of creating interactive web-based musical instruments, but it's equally useful as a general-purpose web framework. Its standard event-handling patterns tend to outperform those of React and Vue by a factor of 1.5-2x.</p>

  <p>This documentation is written in Deku and can be found <a href="https://github.com/mikesol/purescript-deku/tree/main/examples/docs">here</a>. One good way to follow along is by using the Deku starter repo, which you can clone <a href="https://github.com/mikesol/purescript-deku-starter">here</a>.</p>

  <p>And now, without further ado, check out the <a ~next~ style="cursor:pointer;">hello world section</a>!</p>
</div>`}})()()(Wt()(At(n.Monad0().Applicative0()))({reflectType:function(){return"next"}})({reflectSymbol:function(){return"next"}})(n))(n)(n0)({next:Ke(Ft(n))(on(_t)(Zn.value)(Qn(E(Cn(kt)(t(ou.value))(Gt)))))})}};var dv=function(){function n(){}return n.value=new n,n}(),Dv={attr:function(n){return function(t){return lt({key:"controls",value:jt(t)})}}};var yv=function(){function n(){}return n.value=new n,n}();var gv={attr:function(n){return function(t){return lt({key:"src",value:jt(t)})}}};var bv=function(){function n(){}return n.value=new n,n}(),Cv={attr:function(n){return function(t){return lt({key:"width",value:jt(t)})}}};var hv=function(n){return function(t){return function(r){return new yn(On(n)("source")(t)(rt(r)))}}};var Tv=function(n){return function(t){return function(r){return new yn(On(n)("video")(t)(rt(r)))}}};var i0=function(){return x.value}(),Ev=function(n){return function(t){return function(r){return $t({reflectType:function(){return`<div>
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
</div>`}})()()(zn()(Wt()(zn()(At(t.Monad0().Applicative0()))({reflectType:function(){return"result"}})({reflectSymbol:function(){return"result"}})(t))({reflectType:function(){return"next"}})({reflectSymbol:function(){return"next"}})(t))({reflectType:function(){return"code"}})({reflectSymbol:function(){return"code"}})(t))(t)(i0)({code:qn(wt(t)([xt(t)([wn(t.Monad0())(`module Main where

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
`)])])),result:qn(Ta(Ye(t)(Ct(vt)(s(It)(br(n)))(function(e){return Ct(vt)(H(An(t.Monad0().Applicative0()))(S(t.Monad0().Applicative0())(void 0)))(function(a){return S(t.Monad0().Applicative0())(mo(rp()(t)(s(eo)(function(u){return Tv(t)(ce(Sn)(dn(t.Monad0().Applicative0()))(S(t.Monad0().Applicative0()))([on(Dv)(dv.value)("true"),on(Cv)(bv.value)("250")]))([hv(t)(ce(Sn)(dn(t.Monad0().Applicative0()))(S(t.Monad0().Applicative0()))([on(gv)(yv.value)(u),on(cp)(io.value)("video/mp4")]))([])])})(bc()()("https://interactive-examples.mdn.mozilla.net/media/cc0-videos/flower.mp4")(bc()()("https://www.w3schools.com/jsref/movie.mp4")(G_))))(function(u){return function(i){var l=gc()()()()()({reflectType:function(){return 1}})(x.value)(u),_=gc()()()()()({reflectType:function(){return 0}})(x.value)(u),c=Qe(Ft(t))(E(Ur(rr)))(a),f=function(){var d=Zo(t)(function(m){return m?_:l});return function(m){return d(c(m))}}();return Nn(t)([sr(t)(S(t.Monad0().Applicative0())(on(_t)(Zn.value)(Qn(E(e(void 0))))))([wn(t.Monad0())("Switch videos")]),Nn(t)([au(t)([f(!0)]),au(t)([f(!1)])])])}})))})})))),next:S(t.Monad0().Applicative0())(on(_t)(Zn.value)(Qn(E(Cn(kt)(r(pu.value))(Gt)))))})}}};var c0=function(){return x.value}(),l0=function(){return x.value}(),Fv=function(n){return function(t){return $t({reflectType:function(){return`<div>
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
</div>`}})()()(zn()(Wt()(zn()(At(n.Monad0().Applicative0()))({reflectType:function(){return"result"}})({reflectSymbol:function(){return"result"}})(n))({reflectType:function(){return"next"}})({reflectSymbol:function(){return"next"}})(n))({reflectType:function(){return"code"}})({reflectSymbol:function(){return"code"}})(n))(n)(c0)({code:qn(wt(n)([xt(n)([wn(n.Monad0())(`module Main where

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
`)])])),result:qn(mp({reflectType:function(){return`<div>
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
`}})()(n)(At(n.Monad0().Applicative0()))(l0)),next:Ke(Ft(n))(on(_t)(Zn.value)(Qn(E(Cn(kt)(t(cu.value))(Gt)))))})}};var _0=function(){return x.value}(),p0=function(){return x.value}(),Mv=function(n){return function(t){return function(r){return Sc({reflectType:function(){return`<div>
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
</div>`}})({reflectType:function(){return"?"}})()()(t)(zn()(Wt()(zn()(At(t.Monad0().Applicative0()))({reflectType:function(){return"result"}})({reflectSymbol:function(){return"result"}})(t))({reflectType:function(){return"next"}})({reflectSymbol:function(){return"next"}})(t))({reflectType:function(){return"code"}})({reflectSymbol:function(){return"code"}})(t))(x.value)(_0)({code:qn(wt(t)([xt(t)([wn(t.Monad0())(`module Main where

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
  )`)])])),result:qn(Ta(Ye(t)(Ct(vt)(s(It)(br(n)))(function(e){return function(a){return S(t.Monad0().Applicative0())(mo($t({reflectType:function(){return`<div>
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
`}})()()(Wt()(zn()(At(t.Monad0().Applicative0()))({reflectType:function(){return"somethingNew"}})({reflectSymbol:function(){return"somethingNew"}})(t))({reflectType:function(){return"myli"}})({reflectSymbol:function(){return"myli"}})(t))(t)(p0)({myli:S(t.Monad0().Applicative0())(on(ep)(or.value)("background-color:rgb(200,240,210);")),somethingNew:qn(sr(t)(S(t.Monad0().Applicative0())(on(oo)(Zn.value)(e(new v(void 0)))))([Lr(t.Monad0())(H(An(t.Monad0().Applicative0()))(Sr(Xn)(ba(Go(t.Monad0().Applicative0()))(a))("Thanks for clicking me!"))(S(t.Monad0().Applicative0())("I was dynamically inserted")))]))})))}})))),next:S(t.Monad0().Applicative0())(on(_t)(Zn.value)(Qn(E(Cn(kt)(r(su.value))(Gt)))))})}}};var v0=function(n){return function(t){return function(r){return new yn(On(n)("p")(t)(rt(r)))}}},xv=function(n){return v0(n)(ln(dn(n.Monad0().Applicative0())))};var xl=(n,t,r,e)=>{n(a=>e.units[a].main.appendChild(e.units[t].main))(r)},wv=n=>t=>r=>e=>()=>{var a,u=r.id;e.scopes[r.scope]||(e.scopes[r.scope]=[]),e.scopes[r.scope].push(u),n&&r.parent.value0&&(a=document.body.querySelectorAll("[data-deku-ssr-"+u+"]").item(0))?e.units[u]={listeners:{},parent:r.parent,scope:r.scope,main:a}:(e.units[u]={listeners:{},parent:r.parent,scope:r.scope,main:document.createElement(r.tag)},xl(t,u,r.parent,e))},Av=n=>t=>r=>e=>()=>{var a=r.id,u;e.scopes[r.scope]||(e.scopes[r.scope]=[]),e.scopes[r.scope].push(a),n&&r.parent.value0&&(u=document.body.querySelectorAll("[data-deku-ssr-"+r.parent.value0+"]").item(0))?e.units[a]={main:u.childNodes[0],parent:r.parent,scope:r.scope}:(e.units[a]={main:document.createTextNode(""),parent:r.parent,scope:r.scope},xl(t,a,r.parent,e))};function wl(){return{units:{},scopes:{}}}var Lv=n=>t=>r=>()=>{var e=t.id,a=t.value;n&&!r.units[e]&&(dom=document.body.querySelectorAll("[data-deku-ssr-"+e+"]").item(0))&&(r.units[e]={listeners:{},parent:t.parent,scope:t.scope,main:dom},r.scopes[t.scope]||(r.scopes[t.scope]=[]),r.scopes[t.scope].push(e)),r.units[e].main.tagName==="INPUT"&&t.key==="value"?r.units[e].main.value=a:r.units[e].main.tagName==="INPUT"&&t.key==="checked"?r.units[e].main.checked=a==="true":r.units[e].main.setAttribute(t.key,a)},Iv=n=>t=>r=>()=>{var e=t.id,a=t.value;if(n&&!r.units[e]&&(dom=document.body.querySelectorAll("[data-deku-ssr-"+e+"]").item(0))&&(r.units[e]={listeners:{},parent:t.parent,scope:t.scope,main:dom},r.scopes[t.scope]||(r.scopes[t.scope]=[]),r.scopes[t.scope].push(e)),t.key==="@self@")a(r.units[e].main)();else{r.units[e].listeners[t.key]&&r.units[e].main.removeEventListener(t.key,r.units[e].listeners[t.key]);var u=i=>a(i)();r.units[e].main.addEventListener(t.key,u),r.units[e].listeners[t.key]=u}},$v=n=>t=>()=>{var r=n.id;t.units[r].main.nodeValue=n.text},Sv=n=>t=>r=>e=>()=>{var a,u,i=r.id,l=r.html,_=r.verb,c=r.cache,f=r.parent,d=r.scope,m=r.pxScope;if(n&&r.parent.value0&&(a=document.body.querySelectorAll("[data-deku-ssr-"+i+"]").item(0)))e.units[i]={listeners:{},scope:d,parent:f,main:a};else{let p=Object.entries(c);for(var o=0;o<p.length;o++){let B=p[o][0];p[o][1]===!0?l=l.replace(_+B+_,'data-deku-attr-internal="'+B+'"'):l=l.replace(_+B+_,'<span style="display:contents;" data-deku-elt-internal="'+B+'"></span>')}u=document.createElement("div"),u.innerHTML=l.trim(),e.units[i]={listeners:{},scope:d,parent:f,main:u.firstChild}}e.scopes[d]||(e.scopes[d]=[]),e.scopes[d].push(i),u||(u=a),u.querySelectorAll("[data-deku-attr-internal]").forEach(function(p){var B=p.getAttribute("data-deku-attr-internal");let Wn=B+m;e.units[Wn]={listeners:{},main:p,scope:d},e.scopes[d].push(Wn)}),u.querySelectorAll("[data-deku-elt-internal]").forEach(function(p){var B=p.getAttribute("data-deku-elt-internal");let Wn=B+m;e.units[B+m]={listeners:{},main:p,scope:d},e.scopes[d].push(Wn)}),a||xl(t,i,f,e)},Pv=n=>t=>()=>{var r=n.id;t.units[r]={main:n.root}},Nv=n=>t=>()=>{var r=n.id,e=n.parent;t.units[r].containingScope=n.scope,t.units[e].main.prepend(t.units[r].main)},kv=n=>t=>()=>{var r=n.id;t.units[r].noop||t.units[r].containingScope&&!n.scopeEq(t.units[r].containingScope)(n.scope)||t.units[r].main.remove()},Rv=n=>t=>()=>{delete t.units[n.id]},Ov=n=>t=>()=>{var r=n.id;t.units[r].main.parentNode.prepend(t.units[r].main)};var Wv=function(n){return n};var C0=1,Al=2147483647,h0=function(){return Al-1|0}(),Ll=function(n){var t=function(r){return function(e){return function(a){var u=e-r|0,i=Wu(bf)(a)(u),l=i<r;return l?i+e|0:i}}};return t(C0)(h0)(n)};var T0=0,E0=48271,Uv=function(n){return function(t){return yr()(zi(Tu(_r(E0)*_r(t)+_r(n))(_r(Al))))}},Hv=Uv(T0);var I0=function(){function n(i){this.fn=i}var t={},r=function(i,l){this.head=i,this.tail=l};function e(i){return new r(i,t)}function a(i){return function(l){return new r(i,l)}}function u(i){for(var l=[],_=i;_!==t;)l.push(_.head),_=_.tail;return l}return function(i){return function(l){return function(_){var c=function(d,m){return i(l(a)(_(d)))(m)},f=function(d,m,o){if(m===0)return d;var p=o[m-1];return new n(function(){var B=f(c(p,d),m-1,o);return B})};return function(d){for(var m=l(e)(_(d[d.length-1])),o=f(m,d.length-1,d);o instanceof n;)o=o.fn();return l(u)(o)}}}}}();var vo=function(n){return{map:function(t){return function(r){return function(e){return s(n)(function(a){return new F(t(a.value0),a.value1)})(r(e))}}}}};var Sl=function(n){return{Applicative0:function(){return La(n)},Bind1:function(){return af(n)}}},af=function(n){return{bind:function(t){return function(r){return function(e){return g(n.Bind1())(t(e))(function(a){var u=r(a.value0);return u(a.value1)})}}},Apply0:function(){return of(n)}}},of=function(n){return{apply:Pr(Sl(n)),Functor0:function(){return vo(n.Bind1().Apply0().Functor0())}}},La=function(n){return{pure:function(t){return function(r){return y(n.Applicative0())(new F(t,r))}},Apply0:function(){return of(n)}}};var Mu=function(n){return{state:function(t){var r=y(n.Applicative0());return function(e){return r(t(e))}},Monad0:function(){return Sl(n)}}};var Xv=function(n){return function(t){var r=n(t);return r.value1}},Qv=function(n){return function(t){var r=n(t);return r.value0}};var j0=function(n){return n};var G0=function(){var n=function(t){return new F(Wv(t.newSeed),function(){var r={};for(var e in t)({}).hasOwnProperty.call(t,e)&&(r[e]=t[e]);return r.newSeed=Hv(t.newSeed),r}())};return de(Mu(tt))(n)}();var xu=vo(ie);var Nl=function(n){return Qv(j0(n))};var Zv=of(tt),Yv=function(n){return function(t){var r=_r(t),e=_r(n),a=function(l){return e+Tu(l)(r-e+1)},u=s(xu)(_r)(G0),i=bn(Zv)(s(xu)(St(Eo))(u))(s(xu)(zr(Eo)(2))(u));return s(xu)(function(l){return ll(a(l))})(i)}},nd=function(n){return function(t){var r=n<=t;return r?Yv(n)(t):Yv(t)(n)}};var kl=function(n){return n.arbitrary};var Rl=function(){return{arbitrary:nd(-1e6)(1e6)}}();var uf=function(){function n(t){this.value0=t}return n.create=function(t){return new n(t)},n}(),ff=function(){function n(t){this.value0=t}return n.create=function(t){return new n(t)},n}(),cf=function(){function n(t){this.value0=t}return n.create=function(t){return new n(t)},n}(),lf=function(){function n(t){this.value0=t}return n.create=function(t){return new n(t)},n}(),wu=function(){function n(t){this.value0=t}return n.create=function(t){return new n(t)},n}(),Q0=function(n){return function(t){return Q(bt)(Vt(function(r){return A(Tt)(r)([new wu(n)])})(t))}},K0=function(n){return function(t){return Q(bt)(Vt(function(r){return A(Tt)(r)([new lf(n)])})(t))}},Y0=function(n){return function(t){return Q(bt)(Vt(function(r){return A(Tt)(r)([new ff(n)])})(t))}},Z0=function(n){return function(t){return Q(bt)(Vt(function(r){return A(Tt)(r)([new cf(n)])})(t))}},nT=function(n){return function(t){return Q(bt)(Vt(function(r){return A(Tt)(r)([new uf(n)])})(t))}},rd=function(n){return{ids:function(){var r=gt(n)(),e=R(Or)(Nl(kl(Rl))({newSeed:Ll(r),size:5}));return Q(bt)(Vt(St(Fr)(1))(n))(),e},makeElement:nT,makeRoot:function(t){return function(r){return y(ir)(void 0)}},makeText:Y0,makePursx:Z0,setProp:K0,setCb:function(t){return function(r){return y(ir)(void 0)}},setText:Q0,sendToTop:function(t){return function(r){return y(ir)(void 0)}},deleteFromCache:function(t){return function(r){return y(ir)(void 0)}},giveNewParent:function(t){return function(r){return y(ir)(void 0)}},disconnectElement:function(t){return function(r){return y(ir)(void 0)}}}},ed=function(n){return{ids:function(){var r=Oa(n)(),e=R(Or)(Nl(kl(Rl))({newSeed:Ll(r),size:5}));return Q(xn)(xs(St(Fr)(1))(n))(),e},makeElement:wv(!0)(Yn(void 0)),makeRoot:Pv,makeText:Av(!0)(Yn(void 0)),makePursx:Sv(!0)(Yn(void 0)),setProp:Lv(!0),setCb:Iv(!0),setText:$v,sendToTop:Ov,deleteFromCache:Rv,giveNewParent:Nv,disconnectElement:kv}};var Ol=({id:n,html:t,pxScope:r,cache:e,verb:a})=>{let u=t,i=Object.entries(e);for(var l=0;l<i.length;l++){let d=i[l][0];i[l][1]===!0?u=u.replace(a+d+a,'data-deku-attr-internal="'+d+'" data-deku-ssr-'+d+r+'="true"'):u=u.replace(a+d+a,'<span style="display:contents;" data-deku-elt-internal="'+d+'" data-deku-ssr-'+d+r+'="true"></span>')}let _=u.indexOf(">"),c=u.indexOf("/>"),f=c==_-1?c:_;return u.slice(0,f)+" data-deku-ssr-"+n+'="true" '+u.slice(f)};var od=function(n){return function(t){var r=function(c){return function(f){return Q(vo(ie))(fo(Mu(tt))(function(d){var m={};for(var o in d)({}).hasOwnProperty.call(d,o)&&(m[o]=d[o]);return m.idToActions=Za(zt)(function(p){if(p instanceof v)return new v(A(Tt)(p.value0)([f]));if(p instanceof D)return new v([f]);throw new Error("Failed pattern match at Deku.SSR (line 43, column 17 - line 45, column 45): "+[p.constructor.name])})(c)(d.idToActions),m}))}},e=function(c){return function(f){return function(d){return Vn(Jn)(af(tt))(Q(vo(ie))(fo(Mu(tt))(function(m){var o={};for(var p in m)({}).hasOwnProperty.call(m,p)&&(o[p]=m[p]);return o.parentToChild=Za(zt)(function(B){if(B instanceof v)return new v(A(Tt)(B.value0)([f]));if(B instanceof D)return new v([f]);throw new Error("Failed pattern match at Deku.SSR (line 30, column 17 - line 32, column 41): "+[B.constructor.name])})(c)(m.parentToChild),o})))(function(){return r(f)(d)})}}},a=Xv(fr(Ve)(La(tt))(function(c){if(c instanceof uf)return er(La(tt))(Pt)(c.value0.parent)(function(f){return e(f)(c.value0.id)(c)});if(c instanceof ff)return er(La(tt))(Pt)(c.value0.parent)(function(f){return e(f)(c.value0.id)(c)});if(c instanceof cf)return er(La(tt))(Pt)(c.value0.parent)(function(f){return e(f)(c.value0.id)(c)});if(c instanceof lf||c instanceof wu)return r(c.value0.id)(c);throw new Error("Failed pattern match at Deku.SSR (line 53, column 17 - line 60, column 43): "+[c.constructor.name])})(t))({parentToChild:Ya,idToActions:Ya}),u=function(c){return tr("")(oi(function(f){return f instanceof uf?new v(f.value0.tag):D.value})(c))},i=function(c){return Ee(Sn)(xo)(" ")(cr(R_)(function(f){return f instanceof lf?new v(f.value0.key+('="'+(f.value0.value+'"'))):D.value})(c))},l=function(c){return Yn("")(function(f){var d=function(p){return tr("")(oi(function(B){return B instanceof wu?new v(B.value0.text):D.value})(f))},m=function(p){var B=u(f),Wn=i(f);return"<"+(B+(" "+(Wn+(" data-deku-ssr-"+(c+('="true">'+(_(c)+("</"+(B+">")))))))))},o=ja(f)(0);return o instanceof v&&o.value0 instanceof wu?d(void 0):o instanceof v&&o.value0 instanceof ff?d(void 0):o instanceof v&&o.value0 instanceof cf?Ol(o.value0.value0):m(void 0)})(si(zt)(c)(a.idToActions))},_=function(c){var f=tr([])(si(zt)(c)(a.parentToChild));return ar(Sn)(xo)(l)(f)};return"<"+(n+(' data-deku-ssr-deku-root="true">'+(_("deku-root")+("</"+(n+">")))))}};var ud=function(n){return pe(n.Monad0().Applicative0())(n)({doLogic:function(t){return function(r){return function(e){return r.sendToTop({id:e})}}},ids:function(){var t=mt();return function(r){return function(e){return e.ids}(t(r))}}(),disconnectElement:function(t){return function(r){return t.disconnectElement({id:r.id,scope:r.scope,parent:r.parent,scopeEq:nn(ha)})}},wrapElt:function(){var t=On(n)("div")(ln(dn(n.Monad0().Applicative0())));return function(r){return yn.create(t(r))}}(),toElt:function(t){return t}})},OT=function(n){return function(){var r=wl(),e=qr(xn)(wo(0))(ed)();return Jt(ud(qu)({parent:new v("deku-root"),scope:new Ze("rootScope"),raiseId:function(a){return y(xr)(void 0)}})(e)(n))(function(a){return a(r)})()}},id=function(n){return Q(xn)(OT(n))},WT=function(n){return function(t){return function(r){return function(e){return s(n.Monad0().Bind1().Apply0().Functor0())(function(){var a=od(t);return function(u){return function(i){return r.head+i}(function(i){return i+r.tail}(a(u)))}}())(vn(n)(function(){var u=Lt(0)(),i=Lt([])(),l=rd(u);return Q(bt)(Jt(ud(Bu)({parent:new v("deku-root"),scope:new Ze("rootScope"),raiseId:function(_){return y(ir)(void 0)}})(l)(e))(function(_){return _(i)}))(),gt(i)()}))}}}},fd=function(n){return WT(n)("body")};var UT=function(){return x.value}(),ld=function(n){return function(t){return Yo()(n)(ro({reflectSymbol:function(){return"buttonClicked"}})()()(ro({reflectSymbol:function(){return"sliderMoved"}})()()(vi)()()()())()()()())(x.value)(Ct(vt)(Xi(Gi()(so({reflectSymbol:function(){return"buttonClicked"}})(_o(po(t)))(so({reflectSymbol:function(){return"sliderMoved"}})(_o(po(t)))(ji)()())()())))(function(r){return function(e){return Nn(n)([xv(n)([wn(n.Monad0())(`Here's an example of SSR in deku.
All of the static bits are rendered as HTML,
and all of the dynamic bits are hydrated on page load.`)]),sr(n)(ef(Xn)(qe)(oo)(S(n.Monad0().Applicative0())(r.buttonClicked)))([wn(n.Monad0())("Click")]),Nn(n)([Lr(n.Monad0())(H(An(n.Monad0().Applicative0()))(S(n.Monad0().Applicative0())("Val: 0"))(s(Xn)(function(){var a=A(be)("Val: "),u=R(Or);return function(i){return a(u(i))}}())(Qe(Ft(n))(E(St(Fr)(1)))(H(An(n.Monad0().Applicative0()))(S(n.Monad0().Applicative0())(void 0))(e.buttonClicked))(-1))))]),Nn(n)([ra(n)(rf(n.Monad0().Applicative0())(S(n.Monad0().Applicative0())(r.sliderMoved)))([]),Nn(n)([Lr(n.Monad0())(H(An(n.Monad0().Applicative0()))(S(n.Monad0().Applicative0())("Val: 50"))(s(Xn)(function(){var a=A(be)("Val: "),u=R(Mo);return function(i){return a(u(i))}}())(e.sliderMoved)))])])])}}))}},sd=function(n){return function(t){return function(r){return $t({reflectType:function(){return`<div>
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
</div>`}})()()(zn()(zn()(zn()(zn()(zn()(At(n.Monad0().Applicative0()))({reflectType:function(){return"result"}})({reflectSymbol:function(){return"result"}})(n))({reflectType:function(){return"codegen"}})({reflectSymbol:function(){return"codegen"}})(n))({reflectType:function(){return"code2"}})({reflectSymbol:function(){return"code2"}})(n))({reflectType:function(){return"code1"}})({reflectSymbol:function(){return"code1"}})(n))({reflectType:function(){return"code0"}})({reflectSymbol:function(){return"code0"}})(n))(n)(UT)({code2:qn(wt(n)([xt(n)([wn(n.Monad0())(`module Live where

import Prelude

import App (app)
import Deku.Toplevel (hydrate)
import Effect (Effect)

main :: Effect Unit
main = hydrate app`)])])),code1:qn(wt(n)([xt(n)([wn(n.Monad0())(`module Build where

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
    app >>= log`)])])),code0:qn(wt(n)([xt(n)([wn(n.Monad0())(`module App where

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
`)])])),result:qn(ld(n)(t)),codegen:qn(wt(n)([xt(n)([Lr(n.Monad0())(lr(function(e){return Cn(n.Monad0().Bind1().Apply0())(g(n.Monad0().Bind1())(fd(n)({head:'<!DOCTYPE html><html><head><script src="bundle.js" defer><\/script></head>',tail:"</html>"})(ld(Bu)(Ls(Ra(qe)))))(e))(y(n.Monad0().Applicative0())(y(n.Monad0().Applicative0())(void 0)))}))])]))})}}};var _d=function(n){return function(t){var r=function(e){return function(a){if(a instanceof xi)return vv(n)(e);if(a instanceof ou)return mv(n)(e);if(a instanceof uu)return vp(n)(e);if(a instanceof iu)return Fv(n)(e);if(a instanceof cu)return uv(n)(t)(e);if(a instanceof lu)return Hm(n)(t)(e);if(a instanceof fu)return Mv(t)(n)(e);if(a instanceof su)return pv(t)(n)(e);if(a instanceof _u)return Ev(t)(n)(e);if(a instanceof pu)return sd(n)(t)(e);throw new Error("Failed pattern match at Deku.Example.Docs.Scene (line 90, column 3 - line 90, column 66): "+[e.constructor.name,a.constructor.name])}};return Ea(n)(Ct(vt)(s(It)(br(t)))(function(e){return Ct(vt)(function(a){return H(An(n.Monad0().Applicative0()))(S(n.Monad0().Applicative0())(xi.value))(a)})(function(a){return Nn(n)([Nn(n)(s(ot)(function(u){return au(n)([Ti(n)(ce(Sn)(dn(n.Monad0().Applicative0()))(S(n.Monad0().Applicative0()))([on(_t)(Zn.value)(Qn(E(e(u.value0)))),on(op)(or.value)("cursor:pointer;")]))([wn(n.Monad0())(u.value1.value0)]),Ma(n)(S(n.Monad0().Applicative0())(on(uo)(or.value)(function(){return u.value1.value1?"":"display:none;"}())))([wn(n.Monad0())(" | ")])])})([new F(xi.value,new F("Home",!0)),new F(ou.value,new F("Hello world",!0)),new F(uu.value,new F("Component",!0)),new F(iu.value,new F("Pursx 1",!0)),new F(cu.value,new F("Events 1",!0)),new F(lu.value,new F("Effects",!0)),new F(fu.value,new F("Pursx 2",!0)),new F(su.value,new F("Events 2",!0)),new F(_u.value,new F("Portals",!0)),new F(pu.value,new F("SSR",!1))])),Nn(n)([Zo(n)(r(e))(a)])])})}))}};var pd=id(_d(qu)(Is(Ra(qe))));pd();
