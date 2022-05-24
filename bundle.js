var Gl=function(n){return function(t){return function(r){for(var e=t,a=r.length,u=a-1;u>=0;u--)e=n(r[u])(e);return e}}},Xl=function(n){return function(t){return function(r){for(var e=t,a=r.length,u=0;u<a;u++)e=n(e)(r[u]);return e}}};var Ql=function(n){return function(t){for(var r=t.length,e=new Array(r),a=0;a<r;a++)e[a]=n(t[a]);return e}};var la={compose:function(n){return function(t){return function(r){return n(t(r))}}}},Be=function(n){return n.compose};var Q=function(n){return n.identity},z={identity:function(n){return n},Semigroupoid0:function(){return la}};var Zt=!0;var bf=function(n){return function(t){return function(r){return function(e){return n(t(r))(t(e))}}}},ot=function(n){return function(t){return function(r){return n(r)(t)}}},L=function(n){return function(t){return n}};var Tf=function(n){return function(t){return t(n)}};var M=function(){function n(){}return n.value=new n,n}();var s=function(n){return n.map},Jr=function(n){return function(t){return function(r){return s(n)(r)(t)}}},Z=function(n){return s(n)(L(void 0))},Pr=function(n){return function(t){return function(r){return s(n)(L(r))(t)}}};var Nr={map:Be(la)},ut={map:Ql};var Yl=function(n){return function(t){return n+t}},Zl=function(n){return function(t){return n.length===0?t:t.length===0?n:n.concat(t)}};var Pt=function(n){return n.reflectSymbol};var Fr=function(n){return function(t){return t[n]}},be=function(n){return function(t){return function(r){var e={};for(var a in r)({}).hasOwnProperty.call(r,a)&&(e[a]=r[a]);return e[n]=t,e}}};var ns={append:function(n){return function(t){return void 0}}},Te={append:Yl};var Tt={append:Zl};var w=function(n){return n.append};var U=function(n){return n.alt};var ts=function(n){return function(t){for(var r=n.length,e=t.length,a=new Array(r*e),u=0,c=0;c<r;c++)for(var l=n[c],_=0;_<e;_++)a[u++]=l(t[_]);return a}};var No={apply:ts,Functor0:function(){return ut}},Tn=function(n){return n.apply};var K=function(n){return function(t){return function(r){return Tn(n)(s(n.Functor0())(L(Q(z)))(t))(r)}}},Dr=function(n){return function(t){return function(r){return function(e){return Tn(n)(s(n.Functor0())(t)(r))(e)}}}};var D=function(n){return n.pure};var Ce=function(n){return function(t){return function(r){if(t)return r;if(!t)return D(n)(void 0);throw new Error("Failed pattern match at Control.Applicative (line 63, column 1 - line 63, column 63): "+[t.constructor.name,r.constructor.name])}}},Ro=function(n){return function(t){return function(r){return Tn(n.Apply0())(D(n)(t))(r)}}};var ko={pure:function(n){return[n]},Apply0:function(){return No}};var es=function(n){return function(t){for(var r=[],e=0,a=n.length;e<a;e++)Array.prototype.push.apply(r,t(n[e]));return r}};var Vn=function(n){return n.discard};var Ru={bind:es,Apply0:function(){return No}},b=function(n){return n.bind},he=function(n){return ot(b(n))},ku=function(n){return function(t){return function(r){return function(e){return he(n)(t)(r(e))}}}},Ou=function(n){return function(t){return function(r){return function(e){return b(n)(t(e))(r)}}}};var Jn={discard:function(n){return b(n)}};var sa=function(n){return function(t){return b(n)(t)(Q(z))}};var un=function(n){return n.empty};var Od=String.fromCharCode(65535),Wd=String.fromCharCode(0),Ud=Number.POSITIVE_INFINITY,Hd=Number.NEGATIVE_INFINITY;var as=function(n){return function(t){return function(r){return function(e){return function(a){return e<a?n:e===a?t:r}}}}};var os=as;var us=as;var is=function(n){return function(t){return n===t}};var fs=is;var cs=is;var qe={eq:cs};var Oo={eq:fs};var rn=function(n){return n.eq};var en=function(){function n(){}return n.value=new n,n}(),pn=function(){function n(){}return n.value=new n,n}(),sn=function(){function n(){}return n.value=new n,n}();var ls=function(n){return function(t){return n-t|0}};var ss=function(n){return function(t){return n+t|0}},_s=function(n){return function(t){return n*t|0}},ps=function(n){return function(t){return n+t}},ms=function(n){return function(t){return n*t}};var Wo={add:ps,zero:0,mul:ms,one:1},Mr={add:ss,zero:0,mul:_s,one:1};var jr=function(n){return n.mul};var $t=function(n){return n.add};var Ef={sub:ls,Semiring0:function(){return Mr}};var qt=function(){return{compare:us(en.value)(sn.value)(pn.value),Eq0:function(){return qe}}}();var yr=function(){return{compare:os(en.value)(sn.value)(pn.value),Eq0:function(){return Oo}}}();var ln=function(n){return n.compare};var kr=function(n){return n.top};var _a={top:2147483647,bottom:-2147483648,Ord0:function(){return yr}};var Gr=function(n){return n.bottom};var ds=function(n){return n.toString()},Ds=function(n){var t=n.toString();return isNaN(t+".0")?t:t+".0"};var ys=function(n){var t=n.length;return'"'+n.replace(/[\0-\x1F\x7F"\\]/g,function(r,e){switch(r){case'"':case"\\":return"\\"+r;case"\x07":return"\\a";case"\b":return"\\b";case"\f":return"\\f";case`
`:return"\\n";case"\r":return"\\r";case"	":return"\\t";case"\v":return"\\v"}var a=e+1,u=a<t&&n[a]>="0"&&n[a]<="9"?"\\&":"";return"\\"+r.charCodeAt(0).toString(10)+u})+'"'};var Or={show:ys};var Ho={show:Ds},Wr={show:ds};var R=function(n){return n.show};var y=function(){function n(){}return n.value=new n,n}(),v=function(){function n(t){this.value0=t}return n.create=function(t){return new n(t)},n}();var Kn=function(n){return function(t){return function(r){if(r instanceof y)return n;if(r instanceof v)return t(r.value0);throw new Error("Failed pattern match at Data.Maybe (line 237, column 1 - line 237, column 51): "+[n.constructor.name,t.constructor.name,r.constructor.name])}}};var Hu=Kn(!1)(L(!0));var tt={map:function(n){return function(t){return t instanceof v?new v(n(t.value0)):y.value}}};var nr=function(n){return Kn(n)(Q(z))},gr=function(){return function(n){if(n instanceof v)return n.value0;throw new Error("Failed pattern match at Data.Maybe (line 288, column 1 - line 288, column 46): "+[n.constructor.name])}};var pa={apply:function(n){return function(t){if(n instanceof v)return s(tt)(n.value0)(t);if(n instanceof y)return y.value;throw new Error("Failed pattern match at Data.Maybe (line 67, column 1 - line 69, column 30): "+[n.constructor.name,t.constructor.name])}},Functor0:function(){return tt}},br={bind:function(n){return function(t){if(n instanceof v)return t(n.value0);if(n instanceof y)return y.value;throw new Error("Failed pattern match at Data.Maybe (line 125, column 1 - line 127, column 28): "+[n.constructor.name,t.constructor.name])}},Apply0:function(){return pa}};var Nt=function(){return{pure:v.create,Apply0:function(){return pa}}}();var oD={alt:function(n){return function(t){return n instanceof y?t:n}},Functor0:function(){return tt}},Ts=function(){return{empty:y.value,Alt0:function(){return oD}}}();var k=function(){function n(t){this.value0=t}return n.create=function(t){return new n(t)},n}(),P=function(){function n(t){this.value0=t}return n.create=function(t){return new n(t)},n}();var Mf=function(n){return Kn(new k(n))(P.create)};var Oa={map:function(n){return function(t){if(t instanceof k)return new k(t.value0);if(t instanceof P)return new P(n(t.value0));throw new Error("Failed pattern match at Data.Either (line 31, column 1 - line 31, column 52): "+[t.constructor.name])}}};var Ur=function(n){return function(t){return function(r){if(r instanceof k)return n(r.value0);if(r instanceof P)return t(r.value0);throw new Error("Failed pattern match at Data.Either (line 208, column 1 - line 208, column 64): "+[n.constructor.name,t.constructor.name,r.constructor.name])}}},xf=function(){return Ur(L(y.value))(v.create)}();var fD=function(n,t,r){var e=0,a;return function(u){if(e===2)return a;if(e===1)throw new ReferenceError(n+" was needed before it finished initializing (module "+t+", line "+u+")",t,u);return e=1,a=r(),e=2,a}};var Es={defer:function(n){return function(t){return n(void 0)(t)}}},Wa=function(n){return n.defer},wf=function(n){return function(t){var r=fD("go","Control.Lazy",function(){return Wa(n)(function(a){return t(r(25))})}),e=r(25);return e}};var Fs=function(n){return function(t){return n&&t}},Ms=function(n){return function(t){return n||t}},xs=function(n){return!n};var Hr=function(n){return n.not};var Bo=function(n){return n.ff};var Ha=function(n){return n.disj},tr={ff:!1,tt:!0,implies:function(n){return function(t){return Ha(tr)(Hr(tr)(n))(t)}},conj:Fs,disj:Ms,not:xs};var ws=function(n){return Math.min(Math.abs(n),2147483647)},As=function(n){return function(t){return t===0?0:t>0?Math.floor(n/t):-Math.floor(n/-t)}},Ls=function(n){return function(t){if(t===0)return 0;var r=Math.abs(t);return(n%r+r)%r}};var Is={Ring0:function(){return Ef}};var Bu=function(n){return n.mod};var Af={degree:ws,div:As,mod:Ls,CommutativeRing0:function(){return Is}};var Br={mempty:void 0,Semigroup0:function(){return ns}},qo={mempty:"",Semigroup0:function(){return Te}};var En=function(n){return n.mempty};var C=function(){function n(t,r){this.value0=t,this.value1=r}return n.create=function(t){return function(r){return new n(t,r)}},n}();var Rt=function(n){return n.value1};var ma={map:function(n){return function(t){return new C(t.value0,n(t.value1))}}};var jo=function(n){return n};var hD=function(n){return{append:function(t){return function(r){return Ha(n)(t)(r)}}}};var Nf=function(n){return{mempty:Bo(n),Semigroup0:function(){return hD(n)}}};var ED=function(n){return{append:function(t){return function(r){return Be(n)(t)(r)}}}};var da=function(n){return{mempty:Q(n),Semigroup0:function(){return ED(n.Semigroupoid0())}}};var h=function(n){return n};var Da=function(){return h};var mt=Da;var ju=function(){return function(){return function(){return function(){return function(n){return Da()}}}}};var it=function(n){return n.foldr};var za=function(n){return function(t){return it(n)(U(t.Alt0()))(un(t))}},ce=function(n){return function(t){return function(r){return it(n)(function(){var e=U(t.Alt0());return function(a){return e(r(a))}}())(un(t))}}},xr=function(n){return function(t){return function(r){return it(t)(function(){var e=K(n.Apply0());return function(a){return e(r(a))}}())(D(n)(void 0))}}},rr=function(n){return function(t){return ot(xr(n)(t))}},Gu=function(n){return function(t){return xr(n)(t)(Q(z))}},ft=function(n){return n.foldl};var Fe=function(n){return function(t){return function(r){return function(e){var a=function(u){return function(c){return u.init?{init:!1,acc:c}:{init:!1,acc:w(t.Semigroup0())(u.acc)(w(t.Semigroup0())(r)(c))}}};return ft(n)(a)({init:!0,acc:En(t)})(e).acc}}}};var Ct={foldr:function(n){return function(t){return function(r){if(r instanceof y)return t;if(r instanceof v)return n(r.value0)(t);throw new Error("Failed pattern match at Data.Foldable (line 138, column 1 - line 144, column 27): "+[n.constructor.name,t.constructor.name,r.constructor.name])}}},foldl:function(n){return function(t){return function(r){if(r instanceof y)return t;if(r instanceof v)return n(t)(r.value0);throw new Error("Failed pattern match at Data.Foldable (line 138, column 1 - line 144, column 27): "+[n.constructor.name,t.constructor.name,r.constructor.name])}}},foldMap:function(n){return function(t){return function(r){if(r instanceof y)return En(n);if(r instanceof v)return t(r.value0);throw new Error("Failed pattern match at Data.Foldable (line 138, column 1 - line 144, column 27): "+[t.constructor.name,r.constructor.name])}}}};var Ns=function(n){return function(t){return function(r){return it(n)(function(e){return function(a){return w(t.Semigroup0())(r(e))(a)}})(En(t))}}},$n={foldr:Gl,foldl:Xl,foldMap:function(n){return Ns($n)(n)}};var er=function(n){return n.foldMap};var Je=function(n){return function(t){return ju()()()()(jo)(er(n)(Nf(t)))}};var Va=function(n){return{always:L(En(n)),Monoid0:function(){return n}}},Ja=function(n){return{always:Q(z),Monoid0:function(){return n}}},Qo=function(n){return n.always};var Rs=function(n){return function(t){for(var r=t.length,e=Array(r),a=0;a<r;a++)e[a]=n(a)(t[a]);return e}};var le=function(n){return n};var se={map:function(n){return function(t){return n(t)}}};var Ws={apply:function(n){return function(t){return n(t)}},Functor0:function(){return se}},wD={bind:function(n){return function(t){return t(n)}},Apply0:function(){return Ws}},AD={pure:le,Apply0:function(){return Ws}},et={Applicative0:function(){return AD},Bind1:function(){return wD}};var xe=function(n){return n.mapWithIndex};var Yo={mapWithIndex:Rs,Functor0:function(){return ut}};var Js=function(){function n(a){return[a]}function t(a){return function(u){return[a,u]}}function r(a){return function(u){return function(c){return[a,u,c]}}}function e(a){return function(u){return a.concat(u)}}return function(a){return function(u){return function(c){return function(l){return function(_){function f(i,d){switch(d-i){case 0:return c([]);case 1:return u(n)(l(_[i]));case 2:return a(u(t)(l(_[i])))(l(_[i+1]));case 3:return a(a(u(r)(l(_[i])))(l(_[i+1])))(l(_[i+2]));default:var m=i+Math.floor((d-i)/4)*2;return a(u(e)(f(i,m)))(f(m,d))}}return f(0,_.length)}}}}}}();var or=function(n){return n.traverse};var Xs=function(n){return function(t){return or(n)(t)(Q(z))}},je={traverse:function(n){return Js(Tn(n.Apply0()))(s(n.Apply0().Functor0()))(D(n))},sequence:function(n){return Xs(je)(n)},Functor0:function(){return ut},Foldable1:function(){return $n}};var _e=function(){function n(t,r){this.value0=t,this.value1=r}return n.create=function(t){return function(r){return new n(t,r)}},n}();var ei=function(n){return function(t){return new _e(t,un(n))}};var ct=function(){function n(){}return n.value=new n,n}(),nn=function(){function n(t,r){this.value0=t,this.value1=r}return n.create=function(t){return function(r){return new n(t,r)}},n}(),ai=function(n){return n},$y=function(n){return new nn(n.value0,n.value1)};var Py=function(n){var t=function(r){return function(e){var a=r,u=!1,c;function l(_,f){if(f instanceof nn&&f.value1 instanceof nn&&f.value1.value1 instanceof nn){a=new nn(f,_),e=f.value1.value1.value1;return}var i=function(m){return m instanceof nn&&m.value1 instanceof nn&&m.value1.value1 instanceof ct?new nn(n(m.value0),new nn(n(m.value1.value0),ct.value)):m instanceof nn&&m.value1 instanceof ct?new nn(n(m.value0),ct.value):ct.value},d=function(m){return function(o){var p=m,H=!1,Hn;function Qt(Rn,Vr){if(Rn instanceof nn&&Rn.value0 instanceof nn&&Rn.value0.value1 instanceof nn&&Rn.value0.value1.value1 instanceof nn){p=Rn.value1,o=new nn(n(Rn.value0.value0),new nn(n(Rn.value0.value1.value0),new nn(n(Rn.value0.value1.value1.value0),Vr)));return}return H=!0,Vr}for(;!H;)Hn=Qt(p,o);return Hn}};return u=!0,d(_)(i(f))}for(;!u;)c=l(a,e);return c}};return t(ct.value)},Qf={map:Py};var Ae={foldr:function(n){return function(t){var r=function(){var a=function(u){return function(c){var l=u,_=!1,f;function i(d,m){if(m instanceof ct)return _=!0,d;if(m instanceof nn){l=new nn(m.value0,d),c=m.value1;return}throw new Error("Failed pattern match at Data.List.Types (line 107, column 7 - line 107, column 23): "+[d.constructor.name,m.constructor.name])}for(;!_;)f=i(l,c);return f}};return a(ct.value)}(),e=ft(Ae)(ot(n))(t);return function(a){return e(r(a))}}},foldl:function(n){var t=function(r){return function(e){var a=r,u=!1,c;function l(_,f){if(f instanceof ct)return u=!0,_;if(f instanceof nn){a=n(_)(f.value0),e=f.value1;return}throw new Error("Failed pattern match at Data.List.Types (line 111, column 12 - line 113, column 30): "+[f.constructor.name])}for(;!u;)c=l(a,e);return c}};return t},foldMap:function(n){return function(t){return ft(Ae)(function(r){var e=w(n.Semigroup0())(r);return function(a){return e(t(a))}})(En(n))}}};var Ko={append:function(n){return function(t){return it(Ae)(nn.create)(t)(n)}}};var Yf={append:function(n){return function(t){return new _e(n.value0,w(Ko)(n.value1)($y(t)))}}};var Zs={alt:w(Ko),Functor0:function(){return Qf}},Zf=function(){return{empty:ct.value,Alt0:function(){return Zs}}}();var Ks=function(n){return n()};var n_=function(n){throw new Error(n)};var t_=function(){return n_};var Oy=Ks,Yr=function(n){return Oy(function(){return t_()(n)})};function a_(n){var t={};for(var r in n)({}).hasOwnProperty.call(n,r)&&(t[r]=n[r]);return t}function o_(n){return function(t){return function(r){return r[n]=t(r[n]),r}}}var nc=function(n){return function(t){return function(r){return function(e){return n(t,r,e)}}}};var i_=la;var f_=function(){return function(){return function(n){return function(t){return function(r){return function(e){return o_(Pt(n)(t))(r)(e)}}}}}};var c_=z,l_=function(n){return function(t){return n(a_(t))}};var ng=function(n){return n},tg=function(n){return n.mappingWithIndex};var rg=function(n){return n.mapping};var oi={mapRecordWithIndexBuilder:function(n){return function(t){return Q(c_)}}},s_=function(n){return n.mapRecordWithIndexBuilder},Za=function(n){return function(t){return function(r){return function(){return function(){return{mapRecordWithIndexBuilder:function(e){return function(a){return Be(i_)(f_()()(n)(M.value)(tg(t)(a)(M.value)))(s_(r)(M.value)(a))}}}}}}}};var __=function(){return function(n){return{hmap:function(){var t=s_(n)(M.value);return function(r){return l_(t(ng(r)))}}()}}};var p_=function(n){return n.hmap},Ka=function(n){return{mappingWithIndex:function(t){return function(r){return rg(n)(t)}}}};var eg=function(){function n(){}return n.value=new n,n}(),no=function(n){return{mapping:function(t){return s(Nr)(Qo(n))}}},m_=function(n){return p_(n)(eg.value)};var v_=h;var d_=function(n){return function(t){return function(){return n(t())}}},D_=function(n){return function(){return n}},y_=function(n){return function(t){return function(){return t(n())()}}};function At(n){return function(){return{value:n}}}var yt=function(n){return function(){return n.value}},g_=function(n){return function(t){return function(){var r=n(t.value);return t.value=r.state,r.value}}},ur=function(n){return function(t){return function(){return t.value=n}}};var qr=function(n){return function(t){return function(r){return b(n.Bind1())(t)(function(e){return b(n.Bind1())(r)(function(a){return D(n.Applicative0())(e(a))})})}}};var ac=function(n){return function(){return n}},b_=function(n){return function(t){return function(){return t(n())()}}};var T_=function(n,t,r){var e=0,a;return function(u){if(e===2)return a;if(e===1)throw new ReferenceError(n+" was needed before it finished initializing (module "+t+", line "+u+")",t,u);return e=1,a=r(),e=2,a}},to={Applicative0:function(){return ir},Bind1:function(){return ba}},ba={bind:b_,Apply0:function(){return oc(0)}},ir={pure:ac,Apply0:function(){return oc(0)}},C_=T_("functorEffect","Effect",function(){return{map:Ro(ir)}}),oc=T_("applyEffect","Effect",function(){return{apply:qr(to),Functor0:function(){return C_(0)}}}),xn=C_(20),Gn=oc(23),h_=function(n){return{append:Dr(Gn)(w(n))}},Kr=function(n){return{mempty:ac(En(n)),Semigroup0:function(){return h_(n.Semigroup0())}}};var E_=function(n){return function(){return{value:n}}};var ro=function(n){return function(){return n.value}},F_=function(n){return function(t){return function(){var r=n(t.value);return t.value=r.state,r.value}}};var tu=E_,fg=F_,M_=function(n){return fg(function(t){var r=n(t);return{state:r,value:r}})};var pg=function(n,t,r){var e=0,a;return function(u){if(e===2)return a;if(e===1)throw new ReferenceError(n+" was needed before it finished initializing (module "+t+", line "+u+")",t,u);return e=1,a=r(),e=2,a}},mg=g_,zt=function(n){return mg(function(t){var r=n(t);return{state:r,value:r}})},gt={map:d_},ii={Applicative0:function(){return fr},Bind1:function(){return fi}},fi={bind:y_,Apply0:function(){return ic(0)}},fr={pure:D_,Apply0:function(){return ic(0)}},ic=pg("applyST","Control.Monad.ST.Internal",function(){return{apply:qr(ii),Functor0:function(){return gt}}}),w_=ic(46);var A_={liftST:Q(z),Monad0:function(){return ii}},L_={liftST:v_,Monad0:function(){return to}},dn=function(n){return n.liftST};var vg=function(n){return function(t){if(n<1)return[];var r=new Array(n);return r.fill(t)}},dg=function(n){return function(t){for(var r=[],e=0,a=0;a<n;a++)r[e++]=t;return r}},fc=typeof Array.prototype.fill=="function"?vg:dg,Dg=function(){function n(a,u){this.head=a,this.tail=u}var t={};function r(a){return function(u){return new n(a,u)}}function e(a){for(var u=[],c=0,l=a;l!==t;)u[c++]=l.head,l=l.tail;return u}return function(a){return function(u){return e(a(r)(t)(u))}}}();var I_=function(n){return function(t){return function(r){return function(e){return e<0||e>=r.length?t:n(r[e])}}}},S_=function(n){return function(t){return function(r){return function(e){for(var a=0;a<e.length;a++){var u=r(e[a]);if(t(u))return u}return n}}}},$_=function(n){return function(t){return function(r){return function(e){for(var a=0,u=e.length;a<u;a++)if(r(e[a]))return n(a);return t}}}};var P_=function(n){return function(t){return function(r){return function(e){if(r<0||r>=e.length)return t;var a=e.slice();return a.splice(r,1),n(a)}}}};var eu=function(n){return function(t){return t.filter(n)}},li=function(n){return function(t){for(var r=[],e=[],a=0;a<t.length;a++){var u=t[a];n(u)?r.push(u):e.push(u)}return{yes:r,no:e}}};var yg=function(){function n(t,r,e,a,u,c){var l,_,f,i,d,m,o;for(l=u+(c-u>>1),l-u>1&&n(t,r,a,e,u,l),c-l>1&&n(t,r,a,e,l,c),_=u,f=l,i=u;_<l&&f<c;)d=a[_],m=a[f],o=r(t(d)(m)),o>0?(e[i++]=m,++f):(e[i++]=d,++_);for(;_<l;)e[i++]=a[_++];for(;f<c;)e[i++]=a[f++]}return function(t){return function(r){return function(e){var a;return e.length<2?e:(a=e.slice(0),n(t,r,a,e.slice(0),0,e.length),a)}}}}();function Ta(){return[]}var cc=function(n){return function(t){return function(){return t.push.apply(t,n)}}};var me=function(n){return function(){return n}};function bg(n){return function(){return n.slice()}}var lc=bg,Tg=function(){function n(t,r,e,a,u,c){var l,_,f,i,d,m,o;for(l=u+(c-u>>1),l-u>1&&n(t,r,a,e,u,l),c-l>1&&n(t,r,a,e,l,c),_=u,f=l,i=u;_<l&&f<c;)d=a[_],m=a[f],o=r(t(d)(m)),o>0?(e[i++]=m,++f):(e[i++]=d,++_);for(;_<l;)e[i++]=a[_++];for(;f<c;)e[i++]=a[f++]}return function(t){return function(r){return function(e){return function(){return e.length<2||n(t,r,e,e.slice(0),0,e.length),e}}}}}();var O_=function(n){return function(t){return function(){var e=lc(t)();return n(e)(),me(e)()}}};var Le=function(n){return cc([n])};var Eg=function(){function n(t,r){this.value0=t,this.value1=r}return n.create=function(t){return function(r){return new n(t,r)}},n}();var Fg=function(n){return function(){var r=yt(n.value1)();return zt(function(e){return e+1|0})(n.value1)(),n.value0(r)}};var si=function(n){return s(gt)(Eg.create(n))(At(0))},_i=function(n){return function(t){return function(){for(var e=At(!1)();s(gt)(Hr(tr))(yt(e))();)(function(){var u=Fg(n)();if(u instanceof v)return t(u.value0)();if(u instanceof y)return Z(gt)(ur(!0)(e))();throw new Error("Failed pattern match at Data.Array.ST.Iterator (line 42, column 5 - line 44, column 47): "+[u.constructor.name])})();return{}}}};var _c=function(n){return function(t){return O_(Le(t))(n)()}},z_=function(n){return[n]};var eo=function(){return I_(v.create)(y.value)}();var pi=function(){return S_(y.value)(Hu)}();var V_=function(){return $_(v.create)(y.value)}();var J_=function(){return P_(v.create)(y.value)}(),pc=function(n){return function(t){return function(r){return r.length===0?[]:Kn(r)(function(e){return gr()(J_(e)(r))})(V_(n(t))(r))}}};var uu=function(n){return function(t){return w(Tt)([n])(t)}};var Ig=ot(b(Ru)),mc=function(n){return Ig(function(){var t=Kn([])(z_);return function(r){return t(n(r))}}())};var tn=function(){function n(){}return n.value=new n,n}(),mn=function(){function n(t,r,e,a){this.value0=t,this.value1=r,this.value2=e,this.value3=a}return n.create=function(t){return function(r){return function(e){return function(a){return new n(t,r,e,a)}}}},n}(),Pn=function(){function n(t,r,e,a,u,c,l){this.value0=t,this.value1=r,this.value2=e,this.value3=a,this.value4=u,this.value5=c,this.value6=l}return n.create=function(t){return function(r){return function(e){return function(a){return function(u){return function(c){return function(l){return new n(t,r,e,a,u,c,l)}}}}}}},n}(),Xe=function(){function n(t,r,e){this.value0=t,this.value1=r,this.value2=e}return n.create=function(t){return function(r){return function(e){return new n(t,r,e)}}},n}(),Ie=function(){function n(t,r,e){this.value0=t,this.value1=r,this.value2=e}return n.create=function(t){return function(r){return function(e){return new n(t,r,e)}}},n}(),Qe=function(){function n(t,r,e,a,u,c){this.value0=t,this.value1=r,this.value2=e,this.value3=a,this.value4=u,this.value5=c}return n.create=function(t){return function(r){return function(e){return function(a){return function(u){return function(c){return new n(t,r,e,a,u,c)}}}}}},n}(),ve=function(){function n(t,r,e,a,u,c){this.value0=t,this.value1=r,this.value2=e,this.value3=a,this.value4=u,this.value5=c}return n.create=function(t){return function(r){return function(e){return function(a){return function(u){return function(c){return new n(t,r,e,a,u,c)}}}}}},n}(),Ye=function(){function n(t,r,e,a,u,c){this.value0=t,this.value1=r,this.value2=e,this.value3=a,this.value4=u,this.value5=c}return n.create=function(t){return function(r){return function(e){return function(a){return function(u){return function(c){return new n(t,r,e,a,u,c)}}}}}},n}(),vi=function(){function n(t,r,e,a){this.value0=t,this.value1=r,this.value2=e,this.value3=a}return n.create=function(t){return function(r){return function(e){return function(a){return new n(t,r,e,a)}}}},n}();var di=function(n){return function(t){var r=ln(n),e=function(a){var u=!1,c;function l(_){if(_ instanceof tn)return u=!0,y.value;if(_ instanceof mn){var f=r(t)(_.value1);if(f instanceof sn)return u=!0,new v(_.value2);if(f instanceof en){a=_.value0;return}a=_.value3;return}if(_ instanceof Pn){var i=r(t)(_.value1);if(i instanceof sn)return u=!0,new v(_.value2);var d=r(t)(_.value4);if(d instanceof sn)return u=!0,new v(_.value5);if(i instanceof en){a=_.value0;return}if(d instanceof pn){a=_.value6;return}a=_.value3;return}throw new Error("Failed pattern match at Data.Map.Internal (line 241, column 5 - line 241, column 22): "+[_.constructor.name])}for(;!u;)c=l(a);return c};return e}};var ht=function(n){return function(t){return function(r){var e=n,a=t,u=!1,c;function l(_,f,i){if(f instanceof ct)return u=!0,i;if(f instanceof nn){if(f.value0 instanceof Xe){e=_,a=f.value1,r=new mn(i,f.value0.value0,f.value0.value1,f.value0.value2);return}if(f.value0 instanceof Ie){e=_,a=f.value1,r=new mn(f.value0.value0,f.value0.value1,f.value0.value2,i);return}if(f.value0 instanceof Qe){e=_,a=f.value1,r=new Pn(i,f.value0.value0,f.value0.value1,f.value0.value2,f.value0.value3,f.value0.value4,f.value0.value5);return}if(f.value0 instanceof ve){e=_,a=f.value1,r=new Pn(f.value0.value0,f.value0.value1,f.value0.value2,i,f.value0.value3,f.value0.value4,f.value0.value5);return}if(f.value0 instanceof Ye){e=_,a=f.value1,r=new Pn(f.value0.value0,f.value0.value1,f.value0.value2,f.value0.value3,f.value0.value4,f.value0.value5,i);return}throw new Error("Failed pattern match at Data.Map.Internal (line 462, column 3 - line 467, column 88): "+[f.value0.constructor.name])}throw new Error("Failed pattern match at Data.Map.Internal (line 459, column 1 - line 459, column 80): "+[f.constructor.name,i.constructor.name])}for(;!u;)c=l(e,a,r);return c}}},Di=function(n){return function(t){return function(r){var e=function(c){return function(l){var _=c,f=!1,i;function d(m,o){if(m instanceof ct)return f=!0,new mn(o.value0,o.value1,o.value2,o.value3);if(m instanceof nn){if(m.value0 instanceof Xe)return f=!0,ht(n)(m.value1)(new Pn(o.value0,o.value1,o.value2,o.value3,m.value0.value0,m.value0.value1,m.value0.value2));if(m.value0 instanceof Ie)return f=!0,ht(n)(m.value1)(new Pn(m.value0.value0,m.value0.value1,m.value0.value2,o.value0,o.value1,o.value2,o.value3));if(m.value0 instanceof Qe){_=m.value1,l=new vi(new mn(o.value0,o.value1,o.value2,o.value3),m.value0.value0,m.value0.value1,new mn(m.value0.value2,m.value0.value3,m.value0.value4,m.value0.value5));return}if(m.value0 instanceof ve){_=m.value1,l=new vi(new mn(m.value0.value0,m.value0.value1,m.value0.value2,o.value0),o.value1,o.value2,new mn(o.value3,m.value0.value3,m.value0.value4,m.value0.value5));return}if(m.value0 instanceof Ye){_=m.value1,l=new vi(new mn(m.value0.value0,m.value0.value1,m.value0.value2,m.value0.value3),m.value0.value4,m.value0.value5,new mn(o.value0,o.value1,o.value2,o.value3));return}throw new Error("Failed pattern match at Data.Map.Internal (line 498, column 5 - line 503, column 108): "+[m.value0.constructor.name,o.constructor.name])}throw new Error("Failed pattern match at Data.Map.Internal (line 495, column 3 - line 495, column 56): "+[m.constructor.name,o.constructor.name])}for(;!f;)i=d(_,l);return i}},a=ln(n),u=function(c){return function(l){var _=c,f=!1,i;function d(m,o){if(o instanceof tn)return f=!0,e(m)(new vi(tn.value,t,r,tn.value));if(o instanceof mn){var p=a(t)(o.value1);if(p instanceof sn)return f=!0,ht(n)(m)(new mn(o.value0,t,r,o.value3));if(p instanceof en){_=new nn(new Xe(o.value1,o.value2,o.value3),m),l=o.value0;return}_=new nn(new Ie(o.value0,o.value1,o.value2),m),l=o.value3;return}if(o instanceof Pn){var H=a(t)(o.value1);if(H instanceof sn)return f=!0,ht(n)(m)(new Pn(o.value0,t,r,o.value3,o.value4,o.value5,o.value6));var Hn=a(t)(o.value4);if(Hn instanceof sn)return f=!0,ht(n)(m)(new Pn(o.value0,o.value1,o.value2,o.value3,t,r,o.value6));if(H instanceof en){_=new nn(new Qe(o.value1,o.value2,o.value3,o.value4,o.value5,o.value6),m),l=o.value0;return}if(H instanceof pn&&Hn instanceof en){_=new nn(new ve(o.value0,o.value1,o.value2,o.value4,o.value5,o.value6),m),l=o.value3;return}_=new nn(new Ye(o.value0,o.value1,o.value2,o.value3,o.value4,o.value5),m),l=o.value6;return}throw new Error("Failed pattern match at Data.Map.Internal (line 478, column 3 - line 478, column 55): "+[m.constructor.name,o.constructor.name])}for(;!f;)i=d(_,l);return i}};return u(ct.value)}}},Yg=function(n){return function(t){var r=function(l){return function(_){var f=l,i=!1,d;function m(o,p){if(o instanceof ct)return i=!0,p;if(o instanceof nn){if(o.value0 instanceof Xe&&o.value0.value2 instanceof tn&&p instanceof tn)return i=!0,ht(n)(o.value1)(new mn(tn.value,o.value0.value0,o.value0.value1,tn.value));if(o.value0 instanceof Ie&&o.value0.value0 instanceof tn&&p instanceof tn)return i=!0,ht(n)(o.value1)(new mn(tn.value,o.value0.value1,o.value0.value2,tn.value));if(o.value0 instanceof Xe&&o.value0.value2 instanceof mn){f=o.value1,_=new Pn(p,o.value0.value0,o.value0.value1,o.value0.value2.value0,o.value0.value2.value1,o.value0.value2.value2,o.value0.value2.value3);return}if(o.value0 instanceof Ie&&o.value0.value0 instanceof mn){f=o.value1,_=new Pn(o.value0.value0.value0,o.value0.value0.value1,o.value0.value0.value2,o.value0.value0.value3,o.value0.value1,o.value0.value2,p);return}return o.value0 instanceof Xe&&o.value0.value2 instanceof Pn?(i=!0,ht(n)(o.value1)(new mn(new mn(p,o.value0.value0,o.value0.value1,o.value0.value2.value0),o.value0.value2.value1,o.value0.value2.value2,new mn(o.value0.value2.value3,o.value0.value2.value4,o.value0.value2.value5,o.value0.value2.value6)))):o.value0 instanceof Ie&&o.value0.value0 instanceof Pn?(i=!0,ht(n)(o.value1)(new mn(new mn(o.value0.value0.value0,o.value0.value0.value1,o.value0.value0.value2,o.value0.value0.value3),o.value0.value0.value4,o.value0.value0.value5,new mn(o.value0.value0.value6,o.value0.value1,o.value0.value2,p)))):o.value0 instanceof Qe&&o.value0.value2 instanceof tn&&o.value0.value5 instanceof tn&&p instanceof tn?(i=!0,ht(n)(o.value1)(new Pn(tn.value,o.value0.value0,o.value0.value1,tn.value,o.value0.value3,o.value0.value4,tn.value))):o.value0 instanceof ve&&o.value0.value0 instanceof tn&&o.value0.value5 instanceof tn&&p instanceof tn?(i=!0,ht(n)(o.value1)(new Pn(tn.value,o.value0.value1,o.value0.value2,tn.value,o.value0.value3,o.value0.value4,tn.value))):o.value0 instanceof Ye&&o.value0.value0 instanceof tn&&o.value0.value3 instanceof tn&&p instanceof tn?(i=!0,ht(n)(o.value1)(new Pn(tn.value,o.value0.value1,o.value0.value2,tn.value,o.value0.value4,o.value0.value5,tn.value))):o.value0 instanceof Qe&&o.value0.value2 instanceof mn?(i=!0,ht(n)(o.value1)(new mn(new Pn(p,o.value0.value0,o.value0.value1,o.value0.value2.value0,o.value0.value2.value1,o.value0.value2.value2,o.value0.value2.value3),o.value0.value3,o.value0.value4,o.value0.value5))):o.value0 instanceof ve&&o.value0.value0 instanceof mn?(i=!0,ht(n)(o.value1)(new mn(new Pn(o.value0.value0.value0,o.value0.value0.value1,o.value0.value0.value2,o.value0.value0.value3,o.value0.value1,o.value0.value2,p),o.value0.value3,o.value0.value4,o.value0.value5))):o.value0 instanceof ve&&o.value0.value5 instanceof mn?(i=!0,ht(n)(o.value1)(new mn(o.value0.value0,o.value0.value1,o.value0.value2,new Pn(p,o.value0.value3,o.value0.value4,o.value0.value5.value0,o.value0.value5.value1,o.value0.value5.value2,o.value0.value5.value3)))):o.value0 instanceof Ye&&o.value0.value3 instanceof mn?(i=!0,ht(n)(o.value1)(new mn(o.value0.value0,o.value0.value1,o.value0.value2,new Pn(o.value0.value3.value0,o.value0.value3.value1,o.value0.value3.value2,o.value0.value3.value3,o.value0.value4,o.value0.value5,p)))):o.value0 instanceof Qe&&o.value0.value2 instanceof Pn?(i=!0,ht(n)(o.value1)(new Pn(new mn(p,o.value0.value0,o.value0.value1,o.value0.value2.value0),o.value0.value2.value1,o.value0.value2.value2,new mn(o.value0.value2.value3,o.value0.value2.value4,o.value0.value2.value5,o.value0.value2.value6),o.value0.value3,o.value0.value4,o.value0.value5))):o.value0 instanceof ve&&o.value0.value0 instanceof Pn?(i=!0,ht(n)(o.value1)(new Pn(new mn(o.value0.value0.value0,o.value0.value0.value1,o.value0.value0.value2,o.value0.value0.value3),o.value0.value0.value4,o.value0.value0.value5,new mn(o.value0.value0.value6,o.value0.value1,o.value0.value2,p),o.value0.value3,o.value0.value4,o.value0.value5))):o.value0 instanceof ve&&o.value0.value5 instanceof Pn?(i=!0,ht(n)(o.value1)(new Pn(o.value0.value0,o.value0.value1,o.value0.value2,new mn(p,o.value0.value3,o.value0.value4,o.value0.value5.value0),o.value0.value5.value1,o.value0.value5.value2,new mn(o.value0.value5.value3,o.value0.value5.value4,o.value0.value5.value5,o.value0.value5.value6)))):o.value0 instanceof Ye&&o.value0.value3 instanceof Pn?(i=!0,ht(n)(o.value1)(new Pn(o.value0.value0,o.value0.value1,o.value0.value2,new mn(o.value0.value3.value0,o.value0.value3.value1,o.value0.value3.value2,o.value0.value3.value3),o.value0.value3.value4,o.value0.value3.value5,new mn(o.value0.value3.value6,o.value0.value4,o.value0.value5,p)))):(i=!0,Yr("The impossible happened in partial function `up`."))}throw new Error("Failed pattern match at Data.Map.Internal (line 552, column 5 - line 573, column 86): "+[o.constructor.name])}for(;!i;)d=m(f,_);return d}},e=function(l){return function(_){var f=l,i=!1,d;function m(o,p){if(p instanceof mn&&p.value0 instanceof tn&&p.value3 instanceof tn)return i=!0,r(o)(tn.value);if(p instanceof mn){f=new nn(new Ie(p.value0,p.value1,p.value2),o),_=p.value3;return}if(p instanceof Pn&&p.value0 instanceof tn&&p.value3 instanceof tn&&p.value6 instanceof tn)return i=!0,r(new nn(new Ie(tn.value,p.value1,p.value2),o))(tn.value);if(p instanceof Pn){f=new nn(new Ye(p.value0,p.value1,p.value2,p.value3,p.value4,p.value5),o),_=p.value6;return}return i=!0,Yr("The impossible happened in partial function `removeMaxNode`.")}for(;!i;)d=m(f,_);return d}},a=function(l){var _=!1,f;function i(d){if(d instanceof mn&&d.value3 instanceof tn)return _=!0,{key:d.value1,value:d.value2};if(d instanceof mn){l=d.value3;return}if(d instanceof Pn&&d.value6 instanceof tn)return _=!0,{key:d.value4,value:d.value5};if(d instanceof Pn){l=d.value6;return}return _=!0,Yr("The impossible happened in partial function `maxNode`.")}for(;!_;)f=i(l);return f},u=ln(n),c=function(l){return function(_){var f=l,i=!1,d;function m(o,p){if(p instanceof tn)return i=!0,y.value;if(p instanceof mn){var H=u(t)(p.value1);if(p.value3 instanceof tn&&H instanceof sn)return i=!0,new v(new C(p.value2,r(o)(tn.value)));if(H instanceof sn){var Hn=a(p.value0);return i=!0,new v(new C(p.value2,e(new nn(new Xe(Hn.key,Hn.value,p.value3),o))(p.value0)))}if(H instanceof en){f=new nn(new Xe(p.value1,p.value2,p.value3),o),_=p.value0;return}f=new nn(new Ie(p.value0,p.value1,p.value2),o),_=p.value3;return}if(p instanceof Pn){var Qt=function(){return p.value0 instanceof tn&&p.value3 instanceof tn&&p.value6 instanceof tn}(),H=u(t)(p.value4),Rn=u(t)(p.value1);if(Qt&&Rn instanceof sn)return i=!0,new v(new C(p.value2,ht(n)(o)(new mn(tn.value,p.value4,p.value5,tn.value))));if(Qt&&H instanceof sn)return i=!0,new v(new C(p.value5,ht(n)(o)(new mn(tn.value,p.value1,p.value2,tn.value))));if(Rn instanceof sn){var Hn=a(p.value0);return i=!0,new v(new C(p.value2,e(new nn(new Qe(Hn.key,Hn.value,p.value3,p.value4,p.value5,p.value6),o))(p.value0)))}if(H instanceof sn){var Hn=a(p.value3);return i=!0,new v(new C(p.value5,e(new nn(new ve(p.value0,p.value1,p.value2,Hn.key,Hn.value,p.value6),o))(p.value3)))}if(Rn instanceof en){f=new nn(new Qe(p.value1,p.value2,p.value3,p.value4,p.value5,p.value6),o),_=p.value0;return}if(Rn instanceof pn&&H instanceof en){f=new nn(new ve(p.value0,p.value1,p.value2,p.value4,p.value5,p.value6),o),_=p.value3;return}f=new nn(new Ye(p.value0,p.value1,p.value2,p.value3,p.value4,p.value5),o),_=p.value6;return}throw new Error("Failed pattern match at Data.Map.Internal (line 525, column 16 - line 548, column 80): "+[p.constructor.name])}for(;!i;)d=m(f,_);return d}};return c(ct.value)}};var oo=function(){return tn.value}();var np=function(n){return function(t){return function(r){return Kn(r)(Rt)(Yg(n)(t)(r))}}};var uo=function(n){return function(t){return function(r){return function(e){var a=t(di(n)(r)(e));if(a instanceof y)return np(n)(r)(e);if(a instanceof v)return Di(n)(r)(a.value0)(e);throw new Error("Failed pattern match at Data.Map.Internal (line 596, column 15 - line 598, column 25): "+[a.constructor.name])}}}};var tp={compact:function(n){return function(){var r=Ta(),e=si(function(a){return eo(n)(a)})();return _i(e)(function(){var a=Z(gt);return function(u){return a(function(c){if(c instanceof y)return D(fr)(0);if(c instanceof v)return Le(c.value0)(r);throw new Error("Failed pattern match at Data.Compactable (line 111, column 34 - line 113, column 35): "+[c.constructor.name])}(u))}}())(),me(r)()}()},separate:function(n){return function(){var r=Ta(),e=Ta(),a=si(function(u){return eo(n)(u)})();return _i(a)(function(){var u=Z(gt);return function(c){return u(function(l){if(l instanceof k)return Le(l.value0)(r);if(l instanceof P)return Le(l.value0)(e);throw new Error("Failed pattern match at Data.Compactable (line 122, column 34 - line 124, column 31): "+[l.constructor.name])}(c))}}())(),Tn(w_)(s(gt)(function(u){return function(c){return{left:u,right:c}}})(me(r)))(me(e))()}()}};var ha=function(n){return n.compact};var rp={partitionMap:function(n){var t=function(r){return function(e){var a=n(e);if(a instanceof k)return{left:w(Tt)(r.left)([a.value0]),right:r.right};if(a instanceof P)return{right:w(Tt)(r.right)([a.value0]),left:r.left};throw new Error("Failed pattern match at Data.Filterable (line 149, column 16 - line 151, column 50): "+[a.constructor.name])}};return ft($n)(t)({left:[],right:[]})},partition:li,filterMap:mc,filter:eu,Compactable0:function(){return tp},Functor1:function(){return ut}};var cr=function(n){return n.filterMap};var ep=function(n){return n.filter};var lr={dimap:function(n){return function(t){return function(r){return function(e){return t(r(n(e)))}}}}},ap=function(n){return n.dimap},Cr=function(n){return function(t){return ap(n)(t)(Q(z))}};var fo=function(n){return n.keepLatest},Ke=function(n){return n.fold};var Ea=function(n){return function(t){return function(r){return function(e){return cr(n.Filterable1())(Rt)(Ke(n)(function(a){return function(u){return s(ma)(D(Nt))(t(a)(u.value0))}})(r)(new C(e,y.value)))}}}};var na=function(n){return n.bang};function gc(n){return function(t){return n===t}}var up=gc;var sb=function(n){return n};var Vt=function(n){return function(t){return n(t)}},_b=function(n){return function(t){return function(r){return function(e){return function(a){return b(n.Monad0().Bind1())(dn(n)(At(y.value)))(function(u){return b(n.Monad0().Bind1())(r(function(c){return dn(n)(Z(gt)(ur(new v(c))(u)))}))(function(c){return b(n.Monad0().Bind1())(e(function(l){return b(n.Monad0().Bind1())(dn(n)(yt(u)))(xr(t)(Ct)(function(_){return a(l(_))}))}))(function(l){return D(t)(K(t.Apply0())(c)(l))})})})}}}}},sr=sb,pb=function(n){return function(t){return function(r){return b(n.Monad0().Bind1())(dn(n)(At(y.value)))(function(e){return b(n.Monad0().Bind1())(t(function(a){return Vn(Jn)(n.Monad0().Bind1())(b(n.Monad0().Bind1())(dn(n)(yt(e)))(Gu(n.Monad0().Applicative0())(Ct)))(function(){return b(n.Monad0().Bind1())(Vt(a)(r))(function(u){return dn(n)(Z(gt)(ur(new v(u))(e)))})})}))(function(a){return D(n.Monad0().Applicative0())(Vn(Jn)(n.Monad0().Bind1())(b(n.Monad0().Bind1())(dn(n)(yt(e)))(Gu(n.Monad0().Applicative0())(Ct)))(function(){return a}))})})}}},Qn={map:function(n){return function(t){return function(r){return t(function(e){return r(n(e))})}}}};var mb=function(n){return function(t){return function(r){return function(e){return function(a){return b(n.Monad0().Bind1())(dn(n)(At(e)))(function(u){return r(function(c){return b(n.Monad0().Bind1())(dn(n)(zt(t(c))(u)))(a)})})}}}}},fu=function(n){return function(t){return function(r){return function(e){return r(function(a){var u=t(a);if(u instanceof v)return e(u.value0);if(u instanceof y)return D(n)(void 0);throw new Error("Failed pattern match at FRP.Event (line 126, column 13 - line 128, column 27): "+[u.constructor.name])})}}}},bc=function(n){return function(t){return fu(n)(function(r){var e=t(r);if(e)return new v(r);if(!e)return y.value;throw new Error("Failed pattern match at FRP.Event (line 84, column 13 - line 86, column 25): "+[e.constructor.name])})}};var Tc=function(n){return function(t){return b(n.Monad0().Bind1())(dn(n)(At([])))(function(r){return D(n.Monad0().Applicative0())({event:function(e){return b(t.Monad0().Bind1())(dn(t)(zt(function(a){return w(Tt)(a)([e])})(r)))(function(){return D(t.Monad0().Applicative0())(b(t.Monad0().Bind1())(dn(t)(zt(pc(up)(e))(r)))(function(){return D(t.Monad0().Applicative0())(void 0)}))})},push:function(e){return b(t.Monad0().Bind1())(dn(t)(yt(r)))(xr(t.Monad0().Applicative0())($n)(function(a){return a(e)}))}})})}},vb=function(n){return function(t){return function(r){return function(e){return b(t.Bind1())(Tc(n)(n))(function(a){var u=r(a.event);return b(t.Bind1())(Vt(u.input)(a.push))(function(c){return b(t.Bind1())(Vt(u.output)(e))(function(l){return D(t.Applicative0())(K(t.Bind1().Apply0())(c)(l))})})})}}}},ip=function(n){return function(t){return function(r){return sr(function(e){return b(n.Monad0().Bind1())(Tc(n)(n))(function(a){return Vn(Jn)(n.Monad0().Bind1())(e(r(a.event)))(function(){return Vt(t)(a.push)})})})}}},cu=function(n){return{compact:fu(n)(Q(z)),separate:function(t){return{left:fu(n)(function(r){if(r instanceof k)return new v(r.value0);if(r instanceof P)return y.value;throw new Error("Failed pattern match at FRP.Event (line 67, column 13 - line 69, column 33): "+[r.constructor.name])})(t),right:fu(n)(function(r){if(r instanceof P)return new v(r.value0);if(r instanceof k)return y.value;throw new Error("Failed pattern match at FRP.Event (line 74, column 13 - line 76, column 32): "+[r.constructor.name])})(t)}}}},ae=function(n){return{filter:bc(n),filterMap:fu(n),partition:function(t){return function(r){return{yes:bc(n)(t)(r),no:bc(n)(function(){var e=Hr(tr);return function(a){return e(t(a))}}())(r)}}},partitionMap:function(t){return function(r){return{left:cr(ae(n))(function(){var e=Ur(v.create)(L(y.value));return function(a){return e(t(a))}}())(r),right:cr(ae(n))(function(e){return xf(t(e))})(r)}}},Compactable0:function(){return cu(n)},Functor1:function(){return Qn}}},Cc=function(n){return function(t){return sr(function(r){return b(n.Monad0().Bind1())(Tc(n)(n))(function(e){return Vn(Jn)(n.Monad0().Bind1())(r(t(e.push)(e.event)))(function(){return D(n.Monad0().Applicative0())(D(n.Monad0().Applicative0())(void 0))})})})}},$=function(n){return function(t){return function(r){return s(n.Apply0().Functor0())(function(e){return D(n)(void 0)})(r(t))}}},An=function(n){return{alt:function(t){return function(r){return function(e){return Tn(n.Apply0())(s(n.Apply0().Functor0())(function(a){return function(u){return K(n.Apply0())(a)(u)}})(t(e)))(r(e))}}},Functor0:function(){return Qn}}},Dn=function(n){return{empty:function(t){return D(n)(D(n)(void 0))},Alt0:function(){return An(n)}}},Et=function(n){return{fold:mb(n),keepLatest:pb(n),sampleOn:_b(n)(n.Monad0().Applicative0()),fix:vb(n)(n.Monad0()),bang:$(n.Monad0().Applicative0()),Plus0:function(){return Dn(n.Monad0().Applicative0())},Filterable1:function(){return ae(n.Monad0().Applicative0())}}};var fp="_____$__$_$$_vbus";function hc(n){return()=>{for(let t in n)delete n[t]}}function Ec(n){return()=>{let t=(u,c,l,_)=>{let f=Object.keys(_);for(var i=0;i<f.length;i++)if(_[f[i]]instanceof Object&&_[f[i]][fp]===fp){let d={},m={};t(u,d,m,_[f[i]]),c[f[i]]=d,l[f[i]]=m}else{let d=`${Math.random()}`;u[d]={},c[f[i]]=m=>()=>{let o=Object.keys(u[d]);for(var p=0;p<o.length;p++)u[d][o[p]](m)()},l[f[i]]=m=>()=>{let o=`${Math.random()}`;return u[d][o]=m,()=>{delete u[d][o]}}}},r={},e={},a={};return t(r,e,a,n),{p:e,e:a,s:r}}}var Fc=function(n){return function(){return function(){return function(t){return function(r){return function(e){return be(Pt(n)(t))(r)(e)}}}}}},Mc=function(n){return function(){return function(t){return function(r){return Fr(Pt(n)(t))(r)}}}};var bi={vb:function(n){return function(t){return function(r){return{}}}}},cp=function(n){return n.vb},wc=function(){return function(n){return function(t){return function(r){return function(e){var a=cp(t)(M.value)(M.value)(M.value);return sr(function(u){return b(n.Monad0().Bind1())(Ec(a))(function(c){return Vn(Jn)(n.Monad0().Bind1())(u(e(c.p)(c.e)))(function(){return D(n.Monad0().Applicative0())(hc(c.s))})})})}}}}};var co=function(n){return function(){return function(){return function(t){return function(){return function(){return function(){return function(){return{vb:function(r){return function(e){return function(a){return Fc(n)()()(M.value)(void 0)(cp(t)(M.value)(M.value)(M.value))}}}}}}}}}}}};var ta=function(){function n(t){this.value0=t}return n.create=function(t){return new n(t)},n}(),Ac=function(){function n(){}return n.value=new n,n}();var lu=function(){function n(t){this.value0=t}return n.create=function(t){return new n(t)},n}(),su=function(){function n(){}return n.value=new n,n}(),Ci=function(){function n(t){this.value0=t}return n.create=function(t){return new n(t)},n}(),hi=function(){function n(t){this.value0=t}return n.create=function(t){return new n(t)},n}(),Ei=function(){function n(t){this.value0=t}return n.create=function(t){return new n(t)},n}(),lo=function(){function n(t){this.value0=t}return n.create=function(t){return new n(t)},n}(),gn=function(){function n(t){this.value0=t}return n.create=function(t){return new n(t)},n}();var Fa={eq:function(n){return function(t){return n instanceof ta&&t instanceof ta?n.value0===t.value0:n instanceof Ac&&t instanceof Ac}}};var at=function(n){return new Ei(n)};var Ma=function(n){return new hi(n)};var Fi={Always0:function(){return Va(Kr(Br))},Always1:function(){return Va(Kr(Kr(Br)))},Always2:function(){return Va(Kr(Br))},Always3:function(){return Va(da(z))},Always4:function(){return Va(da(z))},MonadST5:function(){return A_}},Mi={Always0:function(){return Ja(Kr(Br))},Always1:function(){return Ja(Kr(Kr(Br)))},Always2:function(){return Ja(Kr(Br))},Always3:function(){return Ja(da(z))},Always4:function(){return Ja(da(z))},MonadST5:function(){return L_}},xi=function(){return function(n){return function(){return function(t){return function(r){return function(e){return function(a){return new lo(wc()(n.MonadST5())(r)(e)(Cr(lr)(m_(__()(t)))(a)))}}}}}}},lp=function(){return new Ci(void 0)}(),sp=function(){return su.value}(),so=function(){return lu.create}(),xa=function(n){return function(t){return function(r){return Cc(n.MonadST5())(Cr(lr)(s(Nr)(Qo(t)))(r))}}},_o=function(n){return function(t){return function(r){return new lo(xa(n)(t)(r))}}};function _p(n){return()=>n.slice()}function pp(n){return t=>r=>()=>{r[n]=t}}function mp(n){return()=>n.slice()}var de=function(n){return n.reflectType};var po={map:function(n){return function(t){return s(ut)(n)(t)}}};var hb=function(n){return de(n)},wi=function(){return function(n){return n}};var Lc=function(){return function(){return function(){return function(){return function(){return function(n){return function(t){return function(r){return r[hb(n)(t)]}}}}}}}};var dp=[];var Ic=function(){return function(){return function(n){return function(t){return uu(n)(t)}}}};function Dp(n){return function(){var t={};for(var r in n)hasOwnProperty.call(n,r)&&(t[r]=n[r]);return t}}var ra={};function $c(n){return n()}function yp(n){return function(t){return function(r){return function(e){var a=r;function u(l){return function(_){return t(_)(l)(e[l])}}for(var c in e)hasOwnProperty.call(e,c)&&(a=n(a)(u(c)));return a}}}}function Ai(n){return function(t){var r=[];for(var e in t)hasOwnProperty.call(t,e)&&r.push(n(e)(t[e]));return r}}var Eb=Object.keys||Ai(function(n){return function(){return n}});function Pc(n){return function(t){return function(r){return function(){return r[n]=t,r}}}}var Nc=function(n){return function(t){return function(){return delete t[n],t}}};var Sb=Ai(function(n){return function(t){return t}});var $b=Dp;var gp=function(n){return function(t){return $c(function(){var e=$b(t)();return n(e)(),e})}};var mo=function(n){return function(t){return gp(Pc(n)(t))}};var bp=yp(Tf),Pb=function(n){return function(t){return bp(function(r){return function(e){return function(a){return w(n.Semigroup0())(r)(t(e)(a))}}})(En(n))}},Tp={foldl:function(n){return bp(function(t){return function(r){return n(t)}})},foldr:function(n){return function(t){return function(r){return it($n)(n)(t)(Sb(r))}}},foldMap:function(n){return function(t){return Pb(n)(L(t))}}};var Rc=function(n){return gp(Nc(n))};var Cp=function(){function n(){}return n.value=new n,n}(),Oc=function(){function n(){}return n.value=new n,n}(),Nb=function(){function n(){}return n.value=new n,n}();var _u=function(n){return function(t){return function(r){var e=function(a){var u=function(c){return function(l){return new C(l+1|0,new C(c,l))}};return Ea(Et(n))(u)(a)(0)};return new hi(fo(Et(n))(ip(n)(e(r))(function(a){return s(Qn)(function(u){return U(An(n.Monad0().Applicative0()))(na(Et(n))(new lu(t(u.value0))))(s(Qn)(L(su.value))(ep(ae(n.Monad0().Applicative0()))(function(){var c=rn(Oo)(u.value1+1|0);return function(l){return c(Rt(l))}}())(a)))})(a)})))}}},De=function(n){return function(t){return function(r){return function(e){return function(a){var u=function(c){return c(e)(a)};return function(c){if(c instanceof Ei)return ce($n)(Dn(n))(De(n)(t)(r)(e)(a))(c.value0);if(c instanceof lo)return fo(Et(t))(s(Qn)(De(n)(t)(r)(e)(a))(c.value0));if(c instanceof gn)return u(r.toElt(c.value0));if(c instanceof hi)return sr(function(l){return b(t.Monad0().Bind1())(dn(t)(At(ra)))(function(_){return b(t.Monad0().Bind1())(Vt(c.value0)(function(f){return b(t.Monad0().Bind1())(r.ids(a))(function(i){return b(t.Monad0().Bind1())(dn(t)(At(D(n)(void 0))))(function(d){return b(t.Monad0().Bind1())(r.ids(a))(function(m){return b(t.Monad0().Bind1())(dn(t)(At(D(n)(void 0))))(function(o){return b(t.Monad0().Bind1())(dn(t)(At(y.value)))(function(p){return b(t.Monad0().Bind1())(dn(t)(At(D(n)(void 0))))(function(H){return b(t.Monad0().Bind1())(s(n.Apply0().Functor0())(ta.create)(r.ids(a)))(function(Hn){return b(t.Monad0().Bind1())(dn(t)(At(Cp.value)))(function(Qt){return b(t.Monad0().Bind1())(Vt(f)(function(Rn){return b(t.Monad0().Bind1())(dn(t)(yt(Qt)))(function(Vr){return Rn instanceof Ci&&Vr instanceof Oc?b(t.Monad0().Bind1())(dn(t)(yt(p)))(xr(n)(Ct)(function(){var mr=r.doLogic(Rn.value0)(a);return function(W){return l(mr(W))}}())):Rn instanceof su&&Vr instanceof Oc?Vn(Jn)(t.Monad0().Bind1())(Z(n.Apply0().Functor0())(dn(t)(ur(Nb.value)(Qt))))(function(){var mr=K(n.Apply0())(K(n.Apply0())(K(n.Apply0())(K(n.Apply0())(b(t.Monad0().Bind1())(dn(t)(yt(p)))(xr(n)(Ct)(function(W){return rr(n)(Ct)(e.parent)(function(Yt){return l(r.disconnectElement(a)({id:W,parent:Yt,scope:Hn}))})})))(sa(t.Monad0().Bind1())(dn(t)(yt(d)))))(sa(t.Monad0().Bind1())(dn(t)(yt(o)))))(Z(n.Apply0().Functor0())(dn(t)(zt(Rc(i))(_)))))(Z(n.Apply0().Functor0())(dn(t)(zt(Rc(m))(_))));return K(n.Apply0())(Z(n.Apply0().Functor0())(dn(t)(ur(mr)(H))))(mr)}):Rn instanceof lu&&Vr instanceof Cp?Vn(Jn)(t.Monad0().Bind1())(Z(n.Apply0().Functor0())(dn(t)(ur(Oc.value)(Qt))))(function(){return b(t.Monad0().Bind1())(Vt(De(n)(t)(r)({parent:e.parent,scope:Hn,raiseId:function(mr){return Z(n.Apply0().Functor0())(dn(t)(ur(new v(mr))(p)))}})(a)(function(){return Rn.value0 instanceof gn?Rn.value0:r.wrapElt(Rn.value0)}()))(l))(function(mr){return Vn(Jn)(t.Monad0().Bind1())(Z(n.Apply0().Functor0())(dn(t)(zt(mo(m)(mr))(_))))(function(){return Z(n.Apply0().Functor0())(dn(t)(ur(mr)(o)))})})}):D(n)(void 0)})}))(function(Rn){return Vn(Jn)(t.Monad0().Bind1())(Z(n.Apply0().Functor0())(dn(t)(ur(Rn)(d))))(function(){return Vn(Jn)(t.Monad0().Bind1())(Z(n.Apply0().Functor0())(dn(t)(zt(mo(i)(Rn))(_))))(function(){return sa(t.Monad0().Bind1())(dn(t)(yt(H)))})})})})})})})})})})})}))(function(f){return D(n)(Vn(Jn)(t.Monad0().Bind1())(b(t.Monad0().Bind1())(dn(t)(yt(_)))(ft(Tp)(K(n.Apply0()))(D(n)(void 0))))(function(){return f}))})})});throw new Error("Failed pattern match at Bolson.Control (line 209, column 17 - line 294, column 20): "+[c.constructor.name])}}}}}};var Rb=h,kb=function(){return function(n){return function(t){return function(r){return function(e){return function(a){return function(u){return function(c){var l=function(_){return function(f){return sr(function(i){return b(n.Monad0().Bind1())(_p(s(ut)(L(""))(wi()(u))))(function(d){var m=za($n)(Dn(n.Monad0().Applicative0()))(xe(Yo)(function(o){return wf(Es)(function(p){return function(H){return H instanceof gn?function(Hn){return Hn({parent:y.value,scope:r(_.scope),raiseId:function(Qt){return pp(o)(Qt)(d)}})(f)}(e.toElt(H.value0)):p(e.wrapElt(H))}})})(wi()(u)));return b(n.Monad0().Bind1())(Vt(m)(i))(function(o){return b(n.Monad0().Bind1())(dn(n)(At(D(n.Monad0().Applicative0())(void 0))))(function(p){return b(n.Monad0().Bind1())(s(n.Monad0().Bind1().Apply0().Functor0())(h)(mp(d)))(function(H){var Hn=s(po)(function(Rn){return function(Vr){return new gn(a.fromElt(function(mr){return function(W){return sr(function(Yt){return Vn(Jn)(n.Monad0().Bind1())(mr.raiseId(Rn))(function(){return Vn(Jn)(n.Monad0().Bind1())(rr(n.Monad0().Applicative0())(Ct)(mr.parent)(function(So){return Yt(a.giveNewParent(W)({id:Rn,parent:So,scope:mr.scope})(Vr))}))(function(){return D(n.Monad0().Applicative0())(D(n.Monad0().Applicative0())(void 0))})})})}}))}})(H),Qt=De(n.Monad0().Applicative0())(n)(e)(_)(f)(Rb(c(Hn)(h)));return b(n.Monad0().Bind1())(Vt(Qt)(i))(function(Rn){return Vn(Jn)(n.Monad0().Bind1())(Z(n.Monad0().Bind1().Apply0().Functor0())(dn(n)(ur(Rn)(p))))(function(){return D(n.Monad0().Applicative0())(Vn(Jn)(n.Monad0().Bind1())(o)(function(){return Vn(Jn)(n.Monad0().Bind1())(Ce(n.Monad0().Applicative0())(!t)(rr(n.Monad0().Applicative0())($n)(wi()(H))(function(Vr){return i(a.deleteFromCache(f)({id:Vr}))})))(function(){return sa(n.Monad0().Bind1())(dn(n)(yt(p)))})}))})})})})})})})}};return new gn(a.fromElt(l))}}}}}}}};var hp=function(){return function(n){return function(t){return function(r){return function(e){return function(a){return kb()(n)(!1)(Q(z))(t)(r)(e)(a)}}}}}};var Ob=function(n){return n},mu=function(){function n(t){this.value0=t}return n.create=function(t){return new n(t)},n}(),vu=function(){function n(t){this.value0=t}return n.create=function(t){return new n(t)},n}(),Wb=function(n){return n},Li=Da(),lt=Wb;var Jt=function(){return mu.create}();var wa=function(){return vu.create}(),Yn=function(){var n=s(Nr)(s(xn)(L(!0)));return function(t){return Ob(n(t))}}(),an=function(n){return n.attr};var Ub=function(n){return n.makeText},Hb=function(n){return function(t){return function(r){return s(Qn)(function(e){return n.setText(function(a){return{id:t,text:a}}(e))})(r)}}},Bb=function(n){return function(t){return function(r){return s(Qn)(function(e){return function(a){if(a.value instanceof mu)return n.setProp({id:t,key:a.key,value:a.value.value0});if(a.value instanceof vu)return n.setCb({id:t,key:a.key,value:a.value.value0});throw new Error("Failed pattern match at Deku.Control (line 68, column 26 - line 70, column 45): "+[a.value.constructor.name])}(Li(e))})(r)}}},qb=function(n){return n.makeElement},Ir=function(n){return function(t){var r=function(e){return function(a){return sr(function(u){return b(n.Bind1())(a.ids)(function(c){return Vn(Jn)(n.Bind1())(e.raiseId(c))(function(){return s(n.Bind1().Apply0().Functor0())(K(n.Bind1().Apply0())(u(a.deleteFromCache({id:c}))))(Vt(za($n)(Dn(n.Applicative0()))([$(n.Applicative0())(Ub(a)({id:c,parent:e.parent,scope:e.scope})),Hb(a)(c)(t)]))(u))})})})}};return new gn(r)}},wn=function(n){return function(t){return Ir(n)($(n.Applicative0())(t))}},Un=function(n){return function(t){return function(r){return function(e){var a=function(u){return function(c){return sr(function(l){return b(n.MonadST5().Monad0().Bind1())(c.ids)(function(_){return Vn(Jn)(n.MonadST5().Monad0().Bind1())(u.raiseId(_))(function(){return s(n.MonadST5().Monad0().Bind1().Apply0().Functor0())(K(n.MonadST5().Monad0().Bind1().Apply0())(l(c.deleteFromCache({id:_}))))(Vt(U(An(n.MonadST5().Monad0().Applicative0()))(za($n)(Dn(n.MonadST5().Monad0().Applicative0()))([$(n.MonadST5().Monad0().Applicative0())(qb(c)({id:_,parent:u.parent,scope:u.scope,tag:t})),Bb(c)(_)(r)]))(zb(n)({parent:new v(_),scope:u.scope,raiseId:function(f){return D(n.MonadST5().Monad0().Applicative0())(void 0)}})(c)(e)))(l))})})})}};return a}}}},zb=function(n){return De(n.MonadST5().Monad0().Applicative0())(n.MonadST5())({doLogic:function(t){return function(r){return function(e){return r.sendToTop({id:e})}}},ids:function(){var t=mt();return function(r){return function(e){return e.ids}(t(r))}}(),disconnectElement:function(t){return function(r){return t.disconnectElement({id:r.id,scope:r.scope,parent:r.parent,scopeEq:rn(Fa)})}},wrapElt:function(){var t=Un(n)("div")(un(Dn(n.MonadST5().Monad0().Applicative0())));return function(r){return gn.create(t(r))}}(),toElt:function(t){return t}})};var Ep=function(){return function(n){return function(t){return function(r){return hp()(n.MonadST5())({doLogic:function(e){return function(a){return function(u){return a.sendToTop({id:u})}}},ids:function(){var e=mt();return function(a){return function(u){return u.ids}(e(a))}}(),disconnectElement:function(e){return function(a){return e.disconnectElement({id:a.id,scope:a.scope,parent:a.parent,scopeEq:rn(Fa)})}},wrapElt:function(){var e=Un(n)("div")(un(Dn(n.MonadST5().Monad0().Applicative0())));return function(a){return gn.create(e(a))}}(),toElt:function(e){return e}})({fromElt:function(e){return e},giveNewParent:function(e){return function(a){return function(u){return mt()(e).giveNewParent(a)}}},deleteFromCache:function(){var e=mt();return function(a){return function(u){return u.deleteFromCache}(e(a))}}()})(t)(Cr(lr)(s(po)(function(e){return e(void 0)}))(Da()(r)))}}}};var Ii=function(){function n(){}return n.value=new n,n}();var Si={attr:function(n){return function(t){return lt({key:"href",value:Jt(t)})}}};var nt=function(){function n(){}return n.value=new n,n}(),vo={attr:function(n){return function(t){return lt({key:"click",value:wa(L(Pr(xn)(t)(!0)))})}}};var _t={attr:function(n){return function(t){return lt({key:"click",value:wa(t)})}}};var ar=function(){function n(){}return n.value=new n,n}();var Do={attr:function(n){return function(t){return lt({key:"style",value:Jt(t)})}}};var Mp={attr:function(n){return function(t){return lt({key:"style",value:Jt(t)})}}};var xp={attr:function(n){return function(t){return lt({key:"style",value:Jt(t)})}}};var Wc={attr:function(n){return function(t){return lt({key:"style",value:Jt(t)})}}};var $i={attr:function(n){return function(t){return lt({key:"style",value:Jt(t)})}}};var wp={attr:function(n){return function(t){return lt({key:"style",value:Jt(t)})}}};var Pi=function(n){return function(t){return function(r){return new gn(Un(n)("a")(t)(at(r)))}}};var Uc=function(n){return function(t){return function(r){return new gn(Un(n)("div")(t)(at(r)))}}},Nn=function(n){return Uc(n)(un(Dn(n.MonadST5().Monad0().Applicative0())))};var Aa=function(n){return function(t){return function(r){return new gn(Un(n)("span")(t)(at(r)))}}},Du=function(n){return Aa(n)(un(Dn(n.MonadST5().Monad0().Applicative0())))};var yo=function(){function n(){}return n.value=new n,n}();var Lp={attr:function(n){return function(t){return lt({key:"type",value:Jt(t)})}}};var Ri={attr:function(n){return function(t){return lt({key:"type",value:Jt(t)})}}};var _r=function(n){return function(t){return function(r){return new gn(Un(n)("button")(t)(at(r)))}}},Ip=function(n){return _r(n)(un(Dn(n.MonadST5().Monad0().Applicative0())))};var Vb=function(n){return function(t){return function(r){return new gn(Un(n)("code")(t)(at(r)))}}},Mt=function(n){return Vb(n)(un(Dn(n.MonadST5().Monad0().Applicative0())))};var Jb=function(n){return function(t){return function(r){return new gn(Un(n)("i")(t)(at(r)))}}},Sp=function(n){return Jb(n)(un(Dn(n.MonadST5().Monad0().Applicative0())))};var aa=function(n){return function(t){return function(r){return new gn(Un(n)("input")(t)(at(r)))}}};var Gb=function(n){return function(t){return function(r){return new gn(Un(n)("li")(t)(at(r)))}}},$p=function(n){return Gb(n)(un(Dn(n.MonadST5().Monad0().Applicative0())))};var Qb=function(n){return function(t){return function(r){return new gn(Un(n)("pre")(t)(at(r)))}}},xt=function(n){return Qb(n)(un(Dn(n.MonadST5().Monad0().Applicative0())))};var Yb=function(n){return function(t){return function(r){return new gn(Un(n)("ul")(t)(at(r)))}}},Pp=function(n){return Yb(n)(un(Dn(n.MonadST5().Monad0().Applicative0())))};var Oi=function(){function n(){}return n.value=new n,n}(),go=function(){function n(){}return n.value=new n,n}(),bo=function(){function n(){}return n.value=new n,n}(),To=function(){function n(){}return n.value=new n,n}(),Co=function(){function n(){}return n.value=new n,n}(),ho=function(){function n(){}return n.value=new n,n}(),Eo=function(){function n(){}return n.value=new n,n}(),Fo=function(){function n(){}return n.value=new n,n}(),Mo=function(){function n(){}return n.value=new n,n}(),xo=function(){function n(){}return n.value=new n,n}(),Np=function(n){return n==="Intro"?D(Nt)(Oi.value):n==="HelloWorld"?D(Nt)(go.value):n==="SimpleComponent"?D(Nt)(bo.value):n==="PURSX1"?D(Nt)(To.value):n==="PURSX2"?D(Nt)(Co.value):n==="Events"?D(Nt)(ho.value):n==="Effects"?D(Nt)(Eo.value):n==="Events2"?D(Nt)(Fo.value):n==="Portals"?D(Nt)(Mo.value):n==="SSR"?D(Nt)(xo.value):un(Ts)};function Bc(){window.scrollTo(0,0)}var jt=Bc;var nT=function(n){return n};var wt=function(n){return{pursxToElement:function(t){return function(r){return function(e){return{cache:ra,element:function(a){return function(u){return un(Dn(n))}}}}}}}},qc=function(n){return n.pursxToElement},Ot=function(){return function(n){return function(t){return function(r){return function(e){return{pursxToElement:function(a){return function(u){return function(c){var l=qc(n)(a)(M.value)(c);return{cache:mo(de(t)(M.value))(!0)(l.cache),element:function(_){return function(f){return U(An(e.MonadST5().Monad0().Applicative0()))(s(Qn)(Cr(lr)(Li)(function(i){if(i.value instanceof mu)return f.setProp({id:de(t)(M.value)+a,key:i.key,value:i.value.value0});if(i.value instanceof vu)return f.setCb({id:de(t)(M.value)+a,key:i.key,value:i.value.value0});throw new Error("Failed pattern match at Deku.Pursx (line 4475, column 38 - line 4485, column 24): "+[i.value.constructor.name])}))(Mc(r)()(M.value)(c)))(l.element(_)(f))}}}}}}}}}}}};var qn=nT,zc=function(n){return function(t){return function(){return function(){return function(r){return function(e){return function(a){return function(u){return function(c){var l=function(_){return function(f){return sr(function(i){return b(r.MonadST5().Monad0().Bind1())(f.ids)(function(d){return b(r.MonadST5().Monad0().Bind1())(f.ids)(function(m){return Vn(Jn)(r.MonadST5().Monad0().Bind1())(_.raiseId(d))(function(){var o=qc(e)(m)(M.value)(c);return s(r.MonadST5().Monad0().Bind1().Apply0().Functor0())(K(r.MonadST5().Monad0().Bind1().Apply0())(i(f.deleteFromCache({id:d}))))(Vt(U(An(r.MonadST5().Monad0().Applicative0()))($(r.MonadST5().Monad0().Applicative0())(f.makePursx({id:d,parent:_.parent,cache:o.cache,pxScope:m,scope:_.scope,html:de(n)(u),verb:de(t)(a)})))(o.element(_)(f)))(i))})})})})}};return new gn(l)}}}}}}}}},It=function(n){return function(){return function(){return function(t){return function(r){return zc(n)({reflectType:function(){return"~"}})()()(r)(t)(M.value)}}}}},Rp=function(n){return function(){return function(t){return function(r){return function(e){return It(n)()()(r)(t)(e)({})}}}}},tT=function(n){return De(n.MonadST5().Monad0().Applicative0())(n.MonadST5())({doLogic:function(t){return function(r){return function(e){return r.sendToTop({id:e})}}},ids:function(){var t=mt();return function(r){return function(e){return e.ids}(t(r))}}(),disconnectElement:function(t){return function(r){return t.disconnectElement({id:r.id,scope:r.scope,parent:r.parent,scopeEq:rn(Fa)})}},wrapElt:function(){var t=Un(n)("div")(un(Dn(n.MonadST5().Monad0().Applicative0())));return function(r){return gn.create(t(r))}}(),toElt:function(t){return t}})},zn=function(){return function(n){return function(t){return function(r){return function(e){return{pursxToElement:function(a){return function(u){return function(c){var l=Mc(r)()(M.value)(c),_=qc(n)(a)(M.value)(c);return{cache:mo(de(t)(M.value))(!1)(_.cache),element:function(f){return function(i){return U(An(e.MonadST5().Monad0().Applicative0()))(tT(e)({parent:new v(de(t)(M.value)+a),scope:f.scope,raiseId:function(d){return D(e.MonadST5().Monad0().Applicative0())(void 0)}})(i)(l))(_.element(f)(i))}}}}}}}}}}}};function kp(n){return n.target}function St(n){return function(){return n.preventDefault()}}function Op(n,t,r){return n==null?t:r(n)}function Vc(n){return n}var wo=Kn(null)(Vc),Wt=function(n){return Op(n,y.value,v.create)};var Hi=function(n){return Wt(kp(n))};var oT=function(){return M.value}(),Up=function(n){return function(t){return It({reflectType:function(){return`<div>
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
  <p>In this section, we built a simple component. In the next section, we'll recreate the exact same element using a different input syntax called <a href="/pursx1.html" ~next~ style="cursor:pointer;">Pursx</a>.</p>
</div>`}})()()(zn()(Ot()(zn()(wt(t.MonadST5().Monad0().Applicative0()))({reflectType:function(){return"result"}})({reflectSymbol:function(){return"result"}})(t))({reflectType:function(){return"next"}})({reflectSymbol:function(){return"next"}})(t))({reflectType:function(){return"code"}})({reflectSymbol:function(){return"code"}})(t))(t)(oT)({code:qn(xt(t)([Mt(t)([wn(t.MonadST5().Monad0())(`module Main where

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
  )`)])])),result:qn(Nn(t)([Ip(t)([wn(t.MonadST5().Monad0())("I do nothing")]),Pp(t)(s(ut)(function(){var r=$p(t),e=D(ko),a=wn(t.MonadST5().Monad0());return function(u){return r(e(a(u)))}}())(["A","B","C"])),Nn(t)([Pi(t)($(t.MonadST5().Monad0().Applicative0())(an(Si)(Ii.value)("https://example.com")))([wn(t.MonadST5().Monad0())("foo ")]),Sp(t)([wn(t.MonadST5().Monad0())(" bar ")]),Aa(t)($(t.MonadST5().Monad0().Applicative0())(an(Do)(ar.value)("font-weight: 800;")))([wn(t.MonadST5().Monad0())(" baz")])]),Nn(t)([Nn(t)([Nn(t)([aa(t)($(t.MonadST5().Monad0().Applicative0())(an(Ri)(yo.value)("range")))([])])])])])),next:$(t.MonadST5().Monad0().Applicative0())(an(_t)(nt.value)(Yn(function(r){return K(Gn)(K(Gn)(St(r))(n(To.value)))(jt)})))})}};function Hp(n,t,r,e,a){return function(u,c){var l=n.newXHR(),_=n.fixupUrl(a.url,l);if(l.open(a.method||"GET",_,!0,a.username,a.password),a.headers)try{for(var f=0,i;(i=a.headers[f])!=null;f++)l.setRequestHeader(i.field,i.value)}catch(m){u(m)}var d=function(m){return function(){u(new Error(m))}};return l.onerror=d(r),l.ontimeout=d(t),l.onload=function(){c({status:l.status,statusText:l.statusText,headers:l.getAllResponseHeaders().split(`\r
`).filter(function(m){return m.length>0}).map(function(m){var o=m.indexOf(":");return e(m.substring(0,o))(m.substring(o+2))}),body:l.response})},l.responseType=a.responseType,l.withCredentials=a.withCredentials,l.timeout=a.timeout,l.send(a.content),function(m,o,p){try{l.abort()}catch(H){return o(H)}return p()}}}var Bi="application/json",Bp="application/x-www-form-urlencoded";var zp=function(){function n(t){this.value0=t}return n.create=function(t){return new n(t)},n}(),Vp=function(){function n(t){this.value0=t}return n.create=function(t){return new n(t)},n}(),Jp=function(){function n(t){this.value0=t}return n.create=function(t){return new n(t)},n}(),jp=function(){function n(t){this.value0=t}return n.create=function(t){return new n(t)},n}(),Gp=function(){function n(t){this.value0=t}return n.create=function(t){return new n(t)},n}(),Jc=function(){function n(t){this.value0=t}return n.create=function(t){return new n(t)},n}(),jc=function(){function n(t){this.value0=t}return n.create=function(t){return new n(t)},n}(),Xp=function(n){return n instanceof Jc?new v(Bp):n instanceof jc?new v(Bi):y.value};var qi=function(){function n(t){this.value0=t}return n.create=function(t){return new n(t)},n}(),zi=function(){function n(t){this.value0=t}return n.create=function(t){return new n(t)},n}(),Qp=function(){function n(t,r){this.value0=t,this.value1=r}return n.create=function(t){return function(r){return new n(t,r)}},n}(),Yp=function(n){if(n instanceof qi)return mt()(n.value0);if(n instanceof zi)return mt()(n.value0);if(n instanceof Qp)return n.value1;throw new Error("Failed pattern match at Affjax.RequestHeader (line 26, column 1 - line 26, column 33): "+[n.constructor.name])};var Gc=function(n){if(n instanceof qi)return"Accept";if(n instanceof zi)return"Content-Type";if(n instanceof Qp)return n.value0;throw new Error("Failed pattern match at Affjax.RequestHeader (line 21, column 1 - line 21, column 32): "+[n.constructor.name])};var Xc=function(){function n(t){this.value0=t}return n.create=function(t){return new n(t)},n}(),Qc=function(){function n(t){this.value0=t}return n.create=function(t){return new n(t)},n}(),Yc=function(){function n(t){this.value0=t}return n.create=function(t){return new n(t)},n}(),yu=function(){function n(t){this.value0=t}return n.create=function(t){return new n(t)},n}(),Zc=function(){function n(t){this.value0=t}return n.create=function(t){return new n(t)},n}(),Vi=function(){function n(t){this.value0=t}return n.create=function(t){return new n(t)},n}(),Zp=function(n){if(n instanceof Xc)return"arraybuffer";if(n instanceof Qc)return"blob";if(n instanceof Yc)return"document";if(n instanceof yu||n instanceof Zc)return"text";if(n instanceof Vi)return"";throw new Error("Failed pattern match at Affjax.ResponseFormat (line 44, column 3 - line 50, column 19): "+[n.constructor.name])},Kp=function(n){return n instanceof yu?new v(Bi):y.value};var nm=function(){return new yu(Q(z))}(),tm=function(){return new Vi(Q(z))}();var em=function(){function n(t,r){this.value0=t,this.value1=r}return n.create=function(t){return function(r){return new n(t,r)}},n}();function gu(n){return n.message}var ie=function(n){return n.throwError};var ke=function(n){return n.catchError};var Ji=function(n){return function(t){return ke(n)(s(n.MonadThrow0().Monad0().Bind1().Apply0().Functor0())(P.create)(t))(function(){var r=D(n.MonadThrow0().Monad0().Applicative0());return function(e){return r(k.create(e))}}())}};var ge=function(n){return n.state};var Ao=function(n){return function(t){return ge(n)(function(r){var e=t(r);return new C(e,e)})}};var fe=function(n){return n.liftEffect};var tl=function(n){return n};var rl=function(n){return n};var Yi=function(n){return function(t){return n(t)}},um=function(n){return{map:function(t){return Yi(s(n)(s(Oa)(t)))}}};var el=function(n){return{Applicative0:function(){return Sa(n)},Bind1:function(){return al(n)}}},al=function(n){return{bind:function(t){return function(r){return b(n.Bind1())(t)(Ur(function(){var e=D(n.Applicative0());return function(a){return e(k.create(a))}}())(function(e){var a=r(e);return a}))}},Apply0:function(){return im(n)}}},im=function(n){return{apply:qr(el(n)),Functor0:function(){return um(n.Bind1().Apply0().Functor0())}}},Sa=function(n){return{pure:function(){var t=D(n.Applicative0());return function(r){return tl(t(P.create(r)))}}(),Apply0:function(){return im(n)}}};var fm=function(n){return{throwError:function(){var t=D(n.Applicative0());return function(r){return tl(t(k.create(r)))}}(),Monad0:function(){return el(n)}}};var ol=function(n){return function(t){return{alt:function(r){return function(e){return b(t.Bind1())(r)(function(a){if(a instanceof P)return D(t.Applicative0())(new P(a.value0));if(a instanceof k)return b(t.Bind1())(e)(function(u){if(u instanceof P)return D(t.Applicative0())(new P(u.value0));if(u instanceof k)return D(t.Applicative0())(new k(w(n)(a.value0)(u.value0)));throw new Error("Failed pattern match at Control.Monad.Except.Trans (line 86, column 9 - line 88, column 49): "+[u.constructor.name])});throw new Error("Failed pattern match at Control.Monad.Except.Trans (line 82, column 5 - line 88, column 49): "+[a.constructor.name])})}},Functor0:function(){return um(t.Bind1().Apply0().Functor0())}}}};var cm=function(){var n=mt();return function(t){return n(rl(t))}}();function ul(n){return JSON.stringify(n)}function il(n){return function(t){return JSON.stringify(t,null,n)}}var lm=ra;function _m(n,t,r){try{return t(JSON.parse(r))}catch(e){return n(e.message)}}var pm=function(n){return _m(k.create,P.create,n)};var fl=function(n){return function(t){return t.join(n)}};function hT(n){return n.replace(/[!'()*]/g,function(t){return"%"+t.charCodeAt(0).toString(16)})}var dm=function(t,r,e){try{return r(hT(encodeURIComponent(e)).replace(/%20/g,"+"))}catch(a){return t(a)}};var nf=function(){return nc(dm)(L(y.value))(v.create)}();var MT=function(n){return n};var Dm=function(){var n=function(e){if(e.value1 instanceof y)return nf(e.value0);if(e.value1 instanceof v)return Tn(pa)(s(tt)(function(a){return function(u){return a+("="+u)}})(nf(e.value0)))(nf(e.value1.value0));throw new Error("Failed pattern match at Data.FormURLEncoded (line 37, column 16 - line 39, column 114): "+[e.constructor.name])},t=s(tt)(fl("&")),r=or(je)(Nt)(n);return function(e){return t(r(MT(e)))}}();var wT=function(){function n(){}return n.value=new n,n}(),Fu=function(){function n(){}return n.value=new n,n}(),AT=function(){function n(){}return n.value=new n,n}(),ym=function(){function n(){}return n.value=new n,n}(),gm=function(){function n(){}return n.value=new n,n}(),bm=function(){function n(){}return n.value=new n,n}(),LT=function(){function n(){}return n.value=new n,n}(),IT=function(){function n(){}return n.value=new n,n}(),ST=function(){function n(){}return n.value=new n,n}(),$T=function(){function n(){}return n.value=new n,n}(),PT=function(){function n(){}return n.value=new n,n}(),NT=function(){function n(){}return n.value=new n,n}(),RT=function(){function n(){}return n.value=new n,n}(),kT=function(){function n(){}return n.value=new n,n}(),OT=function(){function n(){}return n.value=new n,n}(),Tm=function(){function n(){}return n.value=new n,n}();var WT=function(n){return n},UT={show:function(n){if(n instanceof wT)return"OPTIONS";if(n instanceof Fu)return"GET";if(n instanceof AT)return"HEAD";if(n instanceof ym)return"POST";if(n instanceof gm)return"PUT";if(n instanceof bm)return"DELETE";if(n instanceof LT)return"TRACE";if(n instanceof IT)return"CONNECT";if(n instanceof ST)return"PROPFIND";if(n instanceof $T)return"PROPPATCH";if(n instanceof PT)return"MKCOL";if(n instanceof NT)return"COPY";if(n instanceof RT)return"MOVE";if(n instanceof kT)return"LOCK";if(n instanceof OT)return"UNLOCK";if(n instanceof Tm)return"PATCH";throw new Error("Failed pattern match at Data.HTTP.Method (line 43, column 1 - line 59, column 23): "+[n.constructor.name])}};var Cm=Ur(R(UT))(WT);var Fm=function(){var n=ei(Zf);return function(t){return ai(n(t))}}();var Mm=function(n){return n.value0};var hr=function(){var n={},t="Pure",r="Throw",e="Catch",a="Sync",u="Async",c="Bind",l="Bracket",_="Fork",f="Sequential",i="Map",d="Apply",m="Alt",o="Cons",p="Resume",H="Release",Hn="Finalizer",Qt="Finalized",Rn="Forked",Vr="Fiber",mr="Thunk";function W(S,Sn,vt,Bn){this.tag=S,this._1=Sn,this._2=vt,this._3=Bn}function Yt(S){var Sn=function(vt,Bn,B){return new W(S,vt,Bn,B)};return Sn.tag=S,Sn}function So(S){return new W(t,void 0)}function Td(S){try{S()}catch(Sn){setTimeout(function(){throw Sn},0)}}function Cd(S,Sn,vt){try{return Sn(vt())}catch(Bn){return S(Bn)}}function hd(S,Sn,vt){try{return Sn(vt)()}catch(Bn){return vt(S(Bn))(),So}}var Su=function(){var S=1024,Sn=0,vt=0,Bn=new Array(S),B=!1;function x(){var kn;for(B=!0;Sn!==0;)Sn--,kn=Bn[vt],Bn[vt]=void 0,vt=(vt+1)%S,kn();B=!1}return{isDraining:function(){return B},enqueue:function(kn){var yn,pt;Sn===S&&(pt=B,x(),B=pt),Bn[(vt+Sn)%S]=kn,Sn++,B||x()}}}();function Ed(S){var Sn={},vt=0,Bn=0;return{register:function(B){var x=vt++;B.onComplete({rethrow:!0,handler:function(kn){return function(){Bn--,delete Sn[x]}}})(),Sn[x]=B,Bn++},isEmpty:function(){return Bn===0},killAll:function(B,x){return function(){if(Bn===0)return x();var kn=0,yn={};function pt(Xn){yn[Xn]=Sn[Xn].kill(B,function(bt){return function(){delete yn[Xn],kn--,S.isLeft(bt)&&S.fromLeft(bt)&&setTimeout(function(){throw S.fromLeft(bt)},0),kn===0&&x()}})()}for(var Ht in Sn)Sn.hasOwnProperty(Ht)&&(kn++,pt(Ht));return Sn={},vt=0,Bn=0,function(Xn){return new W(a,function(){for(var bt in yn)yn.hasOwnProperty(bt)&&yn[bt]()})}}}}}var Pa=0,vr=1,$u=2,Pu=3,Nu=4,Er=5,$o=6;function gf(S,Sn,vt){var Bn=0,B=Pa,x=vt,kn=null,yn=null,pt=null,Ht=null,Xn=null,bt=0,ca=0,$r=null,Ue=!0;function He(q){for(var V,Fn,Ln;;)switch(V=null,Fn=null,Ln=null,B){case $u:B=vr;try{x=pt(x),Ht===null?pt=null:(pt=Ht._1,Ht=Ht._2)}catch(Gt){B=Er,kn=S.left(Gt),x=null}break;case Pu:S.isLeft(x)?(B=Er,kn=x,x=null):pt===null?B=Er:(B=$u,x=S.fromRight(x));break;case vr:switch(x.tag){case c:pt&&(Ht=new W(o,pt,Ht)),pt=x._2,B=vr,x=x._1;break;case t:pt===null?(B=Er,x=S.right(x._1)):(B=$u,x=x._1);break;case a:B=Pu,x=Cd(S.left,S.right,x._1);break;case u:B=Nu,x=hd(S.left,x._1,function(Gt){return function(){Bn===q&&(Bn++,Su.enqueue(function(){Bn===q+1&&(B=Pu,x=Gt,He(Bn))}))}});return;case r:B=Er,kn=S.left(x._1),x=null;break;case e:pt===null?Xn=new W(o,x,Xn,yn):Xn=new W(o,x,new W(o,new W(p,pt,Ht),Xn,yn),yn),pt=null,Ht=null,B=vr,x=x._1;break;case l:bt++,pt===null?Xn=new W(o,x,Xn,yn):Xn=new W(o,x,new W(o,new W(p,pt,Ht),Xn,yn),yn),pt=null,Ht=null,B=vr,x=x._1;break;case _:B=Pu,V=gf(S,Sn,x._2),Sn&&Sn.register(V),x._1&&V.run(),x=S.right(V);break;case f:B=vr,x=Md(S,Sn,x._1);break}break;case Er:if(pt=null,Ht=null,Xn===null)B=$o,x=yn||kn||x;else switch(V=Xn._3,Ln=Xn._1,Xn=Xn._2,Ln.tag){case e:yn&&yn!==V&&bt===0?B=Er:kn&&(B=vr,x=Ln._2(S.fromLeft(kn)),kn=null);break;case p:yn&&yn!==V&&bt===0||kn?B=Er:(pt=Ln._1,Ht=Ln._2,B=$u,x=S.fromRight(x));break;case l:bt--,kn===null&&(Fn=S.fromRight(x),Xn=new W(o,new W(H,Ln._2,Fn),Xn,V),(yn===V||bt>0)&&(B=vr,x=Ln._3(Fn)));break;case H:Xn=new W(o,new W(Qt,x,kn),Xn,yn),B=vr,yn&&yn!==V&&bt===0?x=Ln._1.killed(S.fromLeft(yn))(Ln._2):kn?x=Ln._1.failed(S.fromLeft(kn))(Ln._2):x=Ln._1.completed(S.fromRight(x))(Ln._2),kn=null,bt++;break;case Hn:bt++,Xn=new W(o,new W(Qt,x,kn),Xn,yn),B=vr,x=Ln._1;break;case Qt:bt--,B=Er,x=Ln._1,kn=Ln._2;break}break;case $o:for(var Dt in $r)$r.hasOwnProperty(Dt)&&(Ue=Ue&&$r[Dt].rethrow,Td($r[Dt].handler(x)));$r=null,yn&&kn?setTimeout(function(){throw S.fromLeft(kn)},0):S.isLeft(x)&&Ue&&setTimeout(function(){if(Ue)throw S.fromLeft(x)},0);return;case Pa:B=vr;break;case Nu:return}}function dt(q){return function(){if(B===$o)return Ue=Ue&&q.rethrow,q.handler(x)(),function(){};var V=ca++;return $r=$r||{},$r[V]=q,function(){$r!==null&&delete $r[V]}}}function X(q,V){return function(){if(B===$o)return V(S.right(void 0))(),function(){};var Fn=dt({rethrow:!1,handler:function(){return V(S.right(void 0))}})();switch(B){case Pa:yn=S.left(q),B=$o,x=yn,He(Bn);break;case Nu:yn===null&&(yn=S.left(q)),bt===0&&(B===Nu&&(Xn=new W(o,new W(Hn,x(q)),Xn,yn)),B=Er,x=null,kn=null,He(++Bn));break;default:yn===null&&(yn=S.left(q)),bt===0&&(B=Er,x=null,kn=null)}return Fn}}function bn(q){return function(){var V=dt({rethrow:!1,handler:q})();return B===Pa&&He(Bn),V}}return{kill:X,join:bn,onComplete:dt,isSuspended:function(){return B===Pa},run:function(){B===Pa&&(Su.isDraining()?He(Bn):Su.enqueue(function(){He(Bn)}))}}}function Fd(S,Sn,vt,Bn){var B=0,x={},kn=0,yn={},pt=new Error("[ParAff] Early exit"),Ht=null,Xn=n;function bt(dt,X,bn){var q=X,V=null,Fn=null,Ln=0,Dt={},Gt,Po;n:for(;;)switch(Gt=null,q.tag){case Rn:if(q._3===n&&(Gt=x[q._1],Dt[Ln++]=Gt.kill(dt,function(xd){return function(){Ln--,Ln===0&&bn(xd)()}})),V===null)break n;q=V._2,Fn===null?V=null:(V=Fn._1,Fn=Fn._2);break;case i:q=q._2;break;case d:case m:V&&(Fn=new W(o,V,Fn)),V=q,q=q._1;break}if(Ln===0)bn(S.right(void 0))();else for(Po=0,Gt=Ln;Po<Gt;Po++)Dt[Po]=Dt[Po]();return Dt}function ca(dt,X,bn){var q,V,Fn,Ln,Dt,Gt;S.isLeft(dt)?(q=dt,V=null):(V=dt,q=null);n:for(;;){if(Fn=null,Ln=null,Dt=null,Gt=null,Ht!==null)return;if(X===null){Bn(q||V)();return}if(X._3!==n)return;switch(X.tag){case i:q===null?(X._3=S.right(X._1(S.fromRight(V))),V=X._3):X._3=q;break;case d:if(Fn=X._1._3,Ln=X._2._3,q){if(X._3=q,Dt=!0,Gt=kn++,yn[Gt]=bt(pt,q===Fn?X._2:X._1,function(){return function(){delete yn[Gt],Dt?Dt=!1:bn===null?ca(q,null,null):ca(q,bn._1,bn._2)}}),Dt){Dt=!1;return}}else{if(Fn===n||Ln===n)return;V=S.right(S.fromRight(Fn)(S.fromRight(Ln))),X._3=V}break;case m:if(Fn=X._1._3,Ln=X._2._3,Fn===n&&S.isLeft(Ln)||Ln===n&&S.isLeft(Fn))return;if(Fn!==n&&S.isLeft(Fn)&&Ln!==n&&S.isLeft(Ln))q=V===Fn?Ln:Fn,V=null,X._3=q;else if(X._3=V,Dt=!0,Gt=kn++,yn[Gt]=bt(pt,V===Fn?X._2:X._1,function(){return function(){delete yn[Gt],Dt?Dt=!1:bn===null?ca(V,null,null):ca(V,bn._1,bn._2)}}),Dt){Dt=!1;return}break}bn===null?X=null:(X=bn._1,bn=bn._2)}}function $r(dt){return function(X){return function(){delete x[dt._1],dt._3=X,ca(X,dt._2._1,dt._2._2)}}}function Ue(){var dt=vr,X=vt,bn=null,q=null,V,Fn;n:for(;;)switch(V=null,Fn=null,dt){case vr:switch(X.tag){case i:bn&&(q=new W(o,bn,q)),bn=new W(i,X._1,n,n),X=X._2;break;case d:bn&&(q=new W(o,bn,q)),bn=new W(d,n,X._2,n),X=X._1;break;case m:bn&&(q=new W(o,bn,q)),bn=new W(m,n,X._2,n),X=X._1;break;default:Fn=B++,dt=Er,V=X,X=new W(Rn,Fn,new W(o,bn,q),n),V=gf(S,Sn,V),V.onComplete({rethrow:!1,handler:$r(X)})(),x[Fn]=V,Sn&&Sn.register(V)}break;case Er:if(bn===null)break n;bn._1===n?(bn._1=X,dt=vr,X=bn._2,bn._2=n):(bn._2=X,X=bn,q===null?bn=null:(bn=q._1,q=q._2))}for(Xn=X,Fn=0;Fn<B;Fn++)x[Fn].run()}function He(dt,X){Ht=S.left(dt);var bn;for(var q in yn)if(yn.hasOwnProperty(q)){bn=yn[q];for(q in bn)bn.hasOwnProperty(q)&&bn[q]()}yn=null;var V=bt(dt,Xn,X);return function(Fn){return new W(u,function(Ln){return function(){for(var Dt in V)V.hasOwnProperty(Dt)&&V[Dt]();return So}})}}return Ue(),function(dt){return new W(u,function(X){return function(){return He(dt,X)}})}}function Md(S,Sn,vt){return new W(u,function(Bn){return function(){return Fd(S,Sn,vt,Bn)}})}return W.EMPTY=n,W.Pure=Yt(t),W.Throw=Yt(r),W.Catch=Yt(e),W.Sync=Yt(a),W.Async=Yt(u),W.Bind=Yt(c),W.Bracket=Yt(l),W.Fork=Yt(_),W.Seq=Yt(f),W.ParMap=Yt(i),W.ParApply=Yt(d),W.ParAlt=Yt(m),W.Fiber=gf,W.Supervisor=Ed,W.Scheduler=Su,W.nonCanceler=So,W}(),wm=hr.Pure,Am=hr.Throw;function Lm(n){return function(t){return hr.Catch(n,t)}}function Im(n){return function(t){return t.tag===hr.Pure.tag?hr.Pure(n(t._1)):hr.Bind(t,function(r){return hr.Pure(n(r))})}}function Sm(n){return function(t){return hr.Bind(n,t)}}var $m=hr.Sync;var Mu=hr.Async;function Pm(n,t){return function(){return hr.Fiber(n,null,t)}}var HT=function(){function n(r,e){return r===0&&typeof setImmediate<"u"?setImmediate(e):setTimeout(e,r)}function t(r,e){return r===0&&typeof clearImmediate<"u"?clearImmediate(e):clearTimeout(e)}return function(r,e){return hr.Async(function(a){return function(){var u=n(e,a(r()));return function(){return hr.Sync(function(){return r(t(e,u))})}}})}}(),BT=hr.Seq;var eC=function(n,t,r){var e=0,a;return function(u){if(e===2)return a;if(e===1)throw new ReferenceError(n+" was needed before it finished initializing (module "+t+", line "+u+")",t,u);return e=1,a=r(),e=2,a}};var _l={map:Im};var aC=function(){var n=function(e){if(e instanceof P)return e.value0;if(e instanceof k)return Yr("unsafeFromRight: Left");throw new Error("Failed pattern match at Effect.Aff (line 407, column 21 - line 409, column 54): "+[e.constructor.name])},t=function(e){if(e instanceof k)return e.value0;if(e instanceof P)return Yr("unsafeFromLeft: Right");throw new Error("Failed pattern match at Effect.Aff (line 402, column 20 - line 404, column 55): "+[e.constructor.name])},r=function(e){if(e instanceof k)return!0;if(e instanceof P)return!1;throw new Error("Failed pattern match at Effect.Aff (line 397, column 12 - line 399, column 21): "+[e.constructor.name])};return{isLeft:r,fromLeft:t,fromRight:n,left:k.create,right:P.create}}(),oC=function(n){return Pm(aC,n)},uC=function(n){return function(){var r=oC(n)();return r.run(),r}},Wm=function(){var n=Z(xn);return function(t){return n(uC(t))}}();var pl={Applicative0:function(){return tf},Bind1:function(){return ml}},ml={bind:Sm,Apply0:function(){return Um(0)}},tf={pure:wm,Apply0:function(){return Um(0)}},Um=eC("applyAff","Effect.Aff",function(){return{apply:qr(pl),Functor0:function(){return _l}}});var vl={liftEffect:$m,Monad0:function(){return pl}};var iC={throwError:Am,Monad0:function(){return pl}},Hm={catchError:Lm,MonadThrow0:function(){return iC}};var Bm=L(D(tf)(void 0));var jm=function(n){return Mu(function(t){return function(){var e=n(function(a){return t(k.create(a))()},function(a){return t(P.create(a))()});return function(a){return Mu(function(u){return function(){return e(a,function(l){return u(k.create(l))()},function(l){return u(P.create(l))()}),Bm}})}}})};function rf(n){return Object.prototype.toString.call(n).slice(8,-1)}var Gm=Array.isArray||function(n){return Object.prototype.toString.call(n)==="[object Array]"};var Xm=function(n){return function(t){return function(r){return(r|0)===r?n(r):t}}},pr=function(n){return n};var ef=isFinite;var gl=Math.floor;var xu=function(n){return function(t){return n%t}};var af=function(){return Xm(v.create)(y.value)}(),IC=function(n){if(!ef(n))return 0;if(n>=pr(kr(_a)))return kr(_a);if(n<=pr(Gr(_a)))return Gr(_a);if(Zt)return nr(0)(af(n));throw new Error("Failed pattern match at Data.Int (line 72, column 1 - line 72, column 29): "+[n.constructor.name])};var Tl=function(n){return IC(gl(n))};var Cl=function(){function n(t){this.value0=t}return n.create=function(t){return new n(t)},n}(),av=function(){function n(t,r){this.value0=t,this.value1=r}return n.create=function(t){return function(r){return new n(t,r)}},n}(),OC=function(){function n(t,r){this.value0=t,this.value1=r}return n.create=function(t){return function(r){return new n(t,r)}},n}(),WC=function(){function n(t,r){this.value0=t,this.value1=r}return n.create=function(t){return function(r){return new n(t,r)}},n}(),ua=h,UC=h;var uf=function(n){if(n instanceof Cl)return n.value0;if(n instanceof OC)return"Error at array index "+(R(Wr)(n.value0)+(": "+uf(n.value1)));if(n instanceof WC)return"Error at property "+(R(Or)(n.value0)+(": "+uf(n.value1)));if(n instanceof av)return"Type mismatch: expected "+(n.value0+(", found "+n.value1));throw new Error("Failed pattern match at Foreign (line 78, column 1 - line 78, column 45): "+[n.constructor.name])};var hl=function(n){var t=ie(fm(n));return function(r){return t(Fm(r))}};var ia=function(n){return function(t){return function(r){if(rf(r)===t)return D(Sa(n))(UC(r));if(Zt)return hl(n)(new av(t,rf(r)));throw new Error("Failed pattern match at Foreign (line 123, column 1 - line 123, column 104): "+[t.constructor.name,r.constructor.name])}}};var El=function(){function n(t){this.value0=t}return n.create=function(t){return new n(t)},n}(),Fl=function(){function n(t,r){this.value0=t,this.value1=r}return n.create=function(t){return function(r){return new n(t,r)}},n}(),Ml=function(){function n(){}return n.value=new n,n}(),xl=function(){function n(){}return n.value=new n,n}(),wl=function(){function n(t){this.value0=t}return n.create=function(t){return new n(t)},n}(),ov=function(n){return function(t){var r=function(i){return i===""?D(Sa(et))(lm):Ur(function(){var d=hl(et);return function(m){return d(Cl.create(m))}}())(D(Sa(et)))(pm(i))},e=function(){if(t.responseFormat instanceof Xc)return ia(et)("ArrayBuffer");if(t.responseFormat instanceof Qc)return ia(et)("Blob");if(t.responseFormat instanceof Yc)return function(i){return U(ol(Yf)(et))(ia(et)("Document")(i))(U(ol(Yf)(et))(ia(et)("XMLDocument")(i))(ia(et)("HTMLDocument")(i)))};if(t.responseFormat instanceof yu)return ku(al(et))(function(i){return t.responseFormat.value0(r(i))})(ia(et)("String"));if(t.responseFormat instanceof Zc)return ia(et)("String");if(t.responseFormat instanceof Vi)return L(t.responseFormat.value0(D(Sa(et))(void 0)));throw new Error("Failed pattern match at Affjax (line 274, column 18 - line 283, column 57): "+[t.responseFormat.constructor.name])}(),a=function(i){if(i instanceof zp)return new P(i.value0(ua));if(i instanceof Vp)return new P(ua(i.value0));if(i instanceof Jp)return new P(ua(i.value0));if(i instanceof jp)return new P(ua(i.value0));if(i instanceof Gp)return new P(ua(i.value0));if(i instanceof Jc)return Mf("Body contains values that cannot be encoded as application/x-www-form-urlencoded")(s(tt)(ua)(Dm(i.value0)));if(i instanceof jc)return new P(ua(ul(i.value0)));throw new Error("Failed pattern match at Affjax (line 235, column 20 - line 250, column 69): "+[i.constructor.name])},u=function(i){return function(d){return i instanceof v&&!Je($n)(tr)(bf(rn(qe))(Gc)(i.value0))(d)?_c(d)(i.value0):d}},c=function(i){return u(s(tt)(zi.create)(he(br)(Xp)(i)))(u(s(tt)(qi.create)(Kp(t.responseFormat)))(t.headers))},l=function(i){return{method:Cm(t.method),url:t.url,headers:s(ut)(function(d){return{field:Gc(d),value:Yp(d)}})(c(t.content)),content:i,responseType:Zp(t.responseFormat),username:wo(t.username),password:wo(t.password),withCredentials:t.withCredentials,timeout:nr(0)(s(tt)(function(d){return d})(t.timeout))}},_=function(i){return Jr(_l)(Ji(Hm)(jm(Hp(n,"AffjaxTimeoutErrorMessageIdent","AffjaxRequestFailedMessageIdent",em.create,l(i)))))(function(d){if(d instanceof P){var m=cm(e(d.value0.body));if(m instanceof k)return new k(new Fl(Mm(m.value0),d.value0));if(m instanceof P)return new P({body:m.value0,headers:d.value0.headers,status:d.value0.status,statusText:d.value0.statusText});throw new Error("Failed pattern match at Affjax (line 209, column 9 - line 211, column 52): "+[m.constructor.name])}if(d instanceof k)return new k(function(){var o=gu(d.value0),p=o==="AffjaxTimeoutErrorMessageIdent";if(p)return Ml.value;var H=o==="AffjaxRequestFailedMessageIdent";return H?xl.value:new wl(d.value0)}());throw new Error("Failed pattern match at Affjax (line 207, column 144 - line 219, column 28): "+[d.constructor.name])})};if(t.content instanceof y)return _(wo(y.value));if(t.content instanceof v){var f=a(t.content.value0);if(f instanceof P)return _(wo(new v(f.value0)));if(f instanceof k)return D(tf)(new k(new El(f.value0)));throw new Error("Failed pattern match at Affjax (line 199, column 7 - line 203, column 48): "+[f.constructor.name])}throw new Error("Failed pattern match at Affjax (line 195, column 3 - line 203, column 48): "+[t.content.constructor.name])}},Al=function(n){if(n instanceof El)return"There was a problem with the request content: "+n.value0;if(n instanceof Fl)return"There was a problem with the response body: "+uf(n.value0);if(n instanceof Ml)return"There was a problem making the request: timeout";if(n instanceof xl)return"There was a problem making the request: request failed";if(n instanceof wl)return"There was a problem making the request: "+gu(n.value0);throw new Error("Failed pattern match at Affjax (line 113, column 14 - line 123, column 66): "+[n.constructor.name])},fa=function(){return{method:new k(Fu.value),url:"/",headers:[],content:y.value,username:y.value,password:y.value,withCredentials:!1,responseFormat:tm,timeout:y.value}}();var Ll={newXHR:function(){return new XMLHttpRequest},fixupUrl:function(n){return n||"/"}};var iv=ov(Ll);var cv=function(){function n(){}return n.value=new n,n}(),Il=function(){function n(t){this.value0=t}return n.create=function(t){return new n(t)},n}(),zC=function(){return M.value}(),fv="Click to get some random user data.",VC=function(n){return Yn(L(function(){return n(cv.value)(),Wm(b(ml)(iv({method:new k(Fu.value),url:"https://randomuser.me/api/",headers:fa.headers,content:fa.content,username:fa.username,password:fa.password,withCredentials:fa.withCredentials,responseFormat:nm,timeout:fa.timeout}))(function(r){if(r instanceof k)return fe(vl)(n(new Il("GET /api response failed to decode: "+Al(r.value0))));if(r instanceof P)return fe(vl)(n(new Il(il(2)(r.value0.body))));throw new Error("Failed pattern match at Deku.Example.Docs.Effects (line 42, column 9 - line 49, column 48): "+[r.constructor.name])}))()}))},lv=function(n){return function(t){return It({reflectType:function(){return`<div>
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
  <p>It is also possible to handle events (and by extension effectful actions in events, like network calls) in Pursx. Let's see how in the <a href="/pursx2.html" ~next~ style="cursor:pointer;">second Pursx section</a>.</p>
</div>`}})()()(zn()(Ot()(zn()(wt(t.MonadST5().Monad0().Applicative0()))({reflectType:function(){return"result"}})({reflectSymbol:function(){return"result"}})(t))({reflectType:function(){return"next"}})({reflectSymbol:function(){return"next"}})(t))({reflectType:function(){return"code"}})({reflectSymbol:function(){return"code"}})(t))(t)(zC)({code:qn(xt(t)([Mt(t)([wn(t.MonadST5().Monad0())(`module Main where

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
`)])])),result:qn(_o(t)(t.Always2())(function(r){return function(e){var a=cr(ae(t.MonadST5().Monad0().Applicative0()))(function(l){return l instanceof cv?new v(new k(void 0)):l instanceof Il?new v(new P(l.value0)):y.value})(e),u=cr(ae(t.MonadST5().Monad0().Applicative0()))(function(l){return l instanceof P?new v(l.value0):y.value})(a),c=cr(ae(t.MonadST5().Monad0().Applicative0()))(function(l){return l instanceof k?new v(void 0):y.value})(a);return Nn(t)([Nn(t)([_r(t)($(t.MonadST5().Monad0().Applicative0())(an(_t)(nt.value)(VC(r))))([Ir(t.MonadST5().Monad0())(U(An(t.MonadST5().Monad0().Applicative0()))($(t.MonadST5().Monad0().Applicative0())(fv))(U(An(t.MonadST5().Monad0().Applicative0()))(Pr(Qn)(c)("Loading..."))(Pr(Qn)(u)(fv))))])]),Uc(t)(U(An(t.MonadST5().Monad0().Applicative0()))($(t.MonadST5().Monad0().Applicative0())(an(Wc)(ar.value)("display: none;")))(Pr(Qn)(ha(cu(t.MonadST5().Monad0().Applicative0()))(Ea(Et(t.MonadST5()))(function(l){return function(_){return new C(_&&!1,function(){return _?new v(void 0):y.value}())}})(u)(!0)))(an(Wc)(ar.value)("display: block;"))))([xt(t)([Mt(t)([Ir(t.MonadST5().Monad0())(U(An(t.MonadST5().Monad0().Applicative0()))($(t.MonadST5().Monad0().Applicative0())(""))(u))])])])])}})),next:$(t.MonadST5().Monad0().Applicative0())(an(_t)(nt.value)(Yn(function(r){return K(Gn)(K(Gn)(St(r))(n(Co.value)))(jt)})))})}};var ff=function(){function n(){}return n.value=new n,n}();var cf={attr:function(n){return function(t){return lt({key:"input",value:wa(t)})}}};function Sl(n){return function(){return n.value}}function $l(n){return function(){return n.valueAsNumber}}function pv(n,t,r,e){if(typeof window<"u"){var a=window[r];if(a!=null&&e instanceof a)return t(e)}for(var u=e;u!=null;){var c=Object.getPrototypeOf(u),l=c.constructor.name;if(l===r)return t(e);if(l==="Object")return n;u=c}return n}var A=function(n){return function(t){return pv(y.value,v.create,n,t)}};var lf=A("HTMLInputElement");var sf=function(n){var t=U(An(n))($(n)(an(Ri)(yo.value)("range"))),r=s(Qn)(function(e){return an(cf)(ff.value)(Yn(function(a){return rr(ir)(Ct)(b(br)(Hi(a))(lf))(Ou(ba)($l)(e))}))});return function(e){return t(r(e))}},_f=function(n){return function(t){return function(r){return s(n)(function(){var e=an(r)(nt.value);return function(a){return e(function(u){return u(En(t))}(a))}}())}}};var QC=function(){return M.value}(),dv=function(n){return function(t){return It({reflectType:function(){return`<div>
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
  <p>In this section, saw how to react to events. In the next section, we'll use a similar mechanism to deal with arbitrary <a href="/effects.html" ~next~ style="cursor:pointer;">effects</a>.</p>
</div>`}})()()(zn()(Ot()(zn()(wt(t.MonadST5().Monad0().Applicative0()))({reflectType:function(){return"result"}})({reflectSymbol:function(){return"result"}})(t))({reflectType:function(){return"next"}})({reflectSymbol:function(){return"next"}})(t))({reflectType:function(){return"code"}})({reflectSymbol:function(){return"code"}})(t))(t)(QC)({code:qn(xt(t)([Mt(t)([wn(t.MonadST5().Monad0())(`module Main where

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
`)])])),result:qn(xi()(t)()(Za({reflectSymbol:function(){return"buttonClicked"}})(Ka(no(t.Always2())))(Za({reflectSymbol:function(){return"sliderMoved"}})(Ka(no(t.Always2())))(oi)()())()())(co({reflectSymbol:function(){return"buttonClicked"}})()()(co({reflectSymbol:function(){return"sliderMoved"}})()()(bi)()()()())()()()())(M.value)(function(r){return function(e){return Nn(t)([_r(t)(_f(Qn)(Br)(vo)($(t.MonadST5().Monad0().Applicative0())(r.buttonClicked)))([wn(t.MonadST5().Monad0())("Click")]),Nn(t)([Ir(t.MonadST5().Monad0())(U(An(t.MonadST5().Monad0().Applicative0()))($(t.MonadST5().Monad0().Applicative0())("Val: 0"))(s(Qn)(function(){var a=w(Te)("Val: "),u=R(Wr);return function(c){return a(u(c))}}())(Ke(Et(t.MonadST5()))(L($t(Mr)(1)))(U(An(t.MonadST5().Monad0().Applicative0()))($(t.MonadST5().Monad0().Applicative0())(void 0))(e.buttonClicked))(-1))))]),Nn(t)([aa(t)(sf(t.MonadST5().Monad0().Applicative0())($(t.MonadST5().Monad0().Applicative0())(r.sliderMoved)))([]),Nn(t)([Ir(t.MonadST5().Monad0())(U(An(t.MonadST5().Monad0().Applicative0()))($(t.MonadST5().Monad0().Applicative0())("Val: 50"))(s(Qn)(function(){var a=w(Te)("Val: "),u=R(Ho);return function(c){return a(u(c))}}())(e.sliderMoved)))])])])}})),next:$(t.MonadST5().Monad0().Applicative0())(an(_t)(nt.value)(Yn(function(r){return K(Gn)(K(Gn)(St(r))(n(Eo.value)))(jt)})))})}};var Dv=function(){function n(){}return n.value=new n,n}();var yv={attr:function(n){return function(t){return lt({key:"keyup",value:wa(t)})}}};function Pl(n){return n.code}var gv=A("KeyboardEvent");var rh=function(){function n(){}return n.value=new n,n}(),Nl=function(){function n(){}return n.value=new n,n}(),bv=function(){function n(t){this.value0=t}return n.create=function(t){return new n(t)},n}(),eh=function(){return M.value}(),Tv=function(n){return function(t){return It({reflectType:function(){return`<div>
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
</div>`}})()()(zn()(Ot()(zn()(wt(t.MonadST5().Monad0().Applicative0()))({reflectType:function(){return"result"}})({reflectSymbol:function(){return"result"}})(t))({reflectType:function(){return"next"}})({reflectSymbol:function(){return"next"}})(t))({reflectType:function(){return"code"}})({reflectSymbol:function(){return"code"}})(t))(t)(eh)({code:qn(xt(t)([Mt(t)([wn(t.MonadST5().Monad0())(`module Main where

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
`)])])),result:qn(_o(t)(t.Always2())(function(r){return Cr(lr)(function(e){return U(An(t.MonadST5().Monad0().Applicative0()))($(t.MonadST5().Monad0().Applicative0())(rh.value))(e)})(function(e){return Nn(t)([Nn(t)([aa(t)(ce($n)(Dn(t.MonadST5().Monad0().Applicative0()))($(t.MonadST5().Monad0().Applicative0()))([an(xp)(ar.value)("border-style:solid;border-width: 1px;border-color: black;"),an(cf)(ff.value)(Yn(function(a){return rr(ir)(Ct)(b(br)(Hi(a))(lf))(Ou(ba)(Sl)(function(u){return r(bv.create(u))}))})),an(yv)(Dv.value)(Yn(function(a){return rr(ir)(Ct)(gv(a))(function(u){return Ce(ir)(Pl(u)==="Enter")(r(Nl.value))})}))]))([]),_r(t)(U(An(t.MonadST5().Monad0().Applicative0()))($(t.MonadST5().Monad0().Applicative0())(an($i)(ar.value)("margin: 5px;")))($(t.MonadST5().Monad0().Applicative0())(an(_t)(nt.value)(Yn(L(r(Nl.value)))))))([wn(t.MonadST5().Monad0())("Add")])]),Nn(t)([Ma(s(Qn)(function(a){return fo(Et(t.MonadST5()))(xa(t)(t.Always2())(function(u){return function(c){return U(An(t.MonadST5().Monad0().Applicative0()))($(t.MonadST5().Monad0().Applicative0())(so(Nn(t)([Aa(t)($(t.MonadST5().Monad0().Applicative0())(an(Do)(ar.value)("margin: 5px;")))([wn(t.MonadST5().Monad0())(a)]),_r(t)(U(An(t.MonadST5().Monad0().Applicative0()))($(t.MonadST5().Monad0().Applicative0())(an($i)(ar.value)("margin: 5px;")))($(t.MonadST5().Monad0().Applicative0())(an(_t)(nt.value)(Yn(L(u(lp)))))))([wn(t.MonadST5().Monad0())("Prioritize")]),_r(t)(U(An(t.MonadST5().Monad0().Applicative0()))($(t.MonadST5().Monad0().Applicative0())(an($i)(ar.value)("margin: 5px;")))($(t.MonadST5().Monad0().Applicative0())(an(_t)(nt.value)(Yn(L(u(sp)))))))([wn(t.MonadST5().Monad0())("Delete")])]))))(c)}}))})(cr(ae(t.MonadST5().Monad0().Applicative0()))(function(a){return a.value0?new v(a.value1):y.value})(Ea(Et(t.MonadST5()))(function(a){return function(u){return a instanceof bv?new C(a.value0,new C(!1,a.value0)):a instanceof Nl?new C(u,new C(!0,u)):new C("",new C(!1,""))}})(e)(""))))])])})})),next:$(t.MonadST5().Monad0().Applicative0())(an(_t)(nt.value)(Yn(function(r){return K(Gn)(K(Gn)(St(r))(n(Mo.value)))(jt)})))})}};var oh=function(){return M.value}(),Cv=function(n){return function(t){return It({reflectType:function(){return`<div>
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
  <p>Now that we have our setup running, let's make a more interesting <a href="/simple.html" ~next~ style="cursor:pointer;">component</a>.</p>
</div>`}})()()(zn()(Ot()(zn()(wt(t.MonadST5().Monad0().Applicative0()))({reflectType:function(){return"result"}})({reflectSymbol:function(){return"result"}})(t))({reflectType:function(){return"next"}})({reflectSymbol:function(){return"next"}})(t))({reflectType:function(){return"code"}})({reflectSymbol:function(){return"code"}})(t))(t)(oh)({code:qn(xt(t)([Mt(t)([wn(t.MonadST5().Monad0())(`module Main where

import Prelude

import Deku.Control (text_)
import Deku.Toplevel (runInBody)
import Effect (Effect)

main :: Effect Unit
main = runInBody (text_ "Hello world")
`)])])),result:qn(Nn(t)([wn(t.MonadST5().Monad0())("Hello world")])),next:na(Et(t.MonadST5()))(an(_t)(nt.value)(Yn(function(r){return K(Gn)(K(Gn)(St(r))(n(bo.value)))(jt)})))})}};var ih=function(){return M.value}(),hv=function(n){return function(t){return It({reflectType:function(){return`<div>
  <h1>Deku</h1>

  <h3>A web micro-framework written in PureScript</h3>

  <p>Hi! You've found <a href="https://github.com/mikesol/purescript-deku">Deku</a>.</p>

  <p>Deku is the coolest web micro-framework that no one knows about yet. Except you, of course, as you're here. So welcome!</p>

  <p>The main goal of Deku is speed. I made it for the purpose of creating interactive web-based musical instruments, but it's equally useful as a general-purpose web framework. Its standard event-handling patterns tend to outperform those of React and Vue by a factor of 1.5-2x.</p>

  <p>This documentation is written in Deku and can be found <a href="https://github.com/mikesol/purescript-deku/tree/main/examples/docs">here</a>. One good way to follow along is by using the Deku starter repo, which you can clone <a href="https://github.com/mikesol/purescript-deku-starter">here</a>.</p>

  <p>And now, without further ado, check out the <a href="/hello.html" ~next~ style="cursor:pointer;">hello world section</a>!</p>
</div>`}})()()(Ot()(wt(t.MonadST5().Monad0().Applicative0()))({reflectType:function(){return"next"}})({reflectSymbol:function(){return"next"}})(t))(t)(ih)({next:na(Et(t.MonadST5()))(an(_t)(nt.value)(Yn(function(r){return K(Gn)(K(Gn)(St(r))(n(go.value)))(jt)})))})}};var Ev=function(){function n(){}return n.value=new n,n}(),Fv={attr:function(n){return function(t){return lt({key:"controls",value:Jt(t)})}}};var Mv=function(){function n(){}return n.value=new n,n}();var xv={attr:function(n){return function(t){return lt({key:"src",value:Jt(t)})}}};var wv=function(){function n(){}return n.value=new n,n}(),Av={attr:function(n){return function(t){return lt({key:"width",value:Jt(t)})}}};var Lv=function(n){return function(t){return function(r){return new gn(Un(n)("source")(t)(at(r)))}}};var Iv=function(n){return function(t){return function(r){return new gn(Un(n)("video")(t)(at(r)))}}};var mh=function(){return M.value}(),Sv=function(n){return function(t){return It({reflectType:function(){return`<div>
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
  <p>In this section, we used portals to move an element to different areas of the DOM. In the next section, we'll learn how to do <a href="/ssr.html" ~next~ style="cursor:pointer;">static site rendering</a>.</p>
</div>`}})()()(zn()(Ot()(zn()(wt(t.MonadST5().Monad0().Applicative0()))({reflectType:function(){return"result"}})({reflectSymbol:function(){return"result"}})(t))({reflectType:function(){return"next"}})({reflectSymbol:function(){return"next"}})(t))({reflectType:function(){return"code"}})({reflectSymbol:function(){return"code"}})(t))(t)(mh)({code:qn(xt(t)([Mt(t)([wn(t.MonadST5().Monad0())(`module Main where

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
`)])])),result:qn(Ma(xa(t)(t.Always2())(function(r){return Cr(lr)(U(An(t.MonadST5().Monad0().Applicative0()))($(t.MonadST5().Monad0().Applicative0())(void 0)))(function(e){return $(t.MonadST5().Monad0().Applicative0())(so(Ep()(t)(s(po)(function(a){return Iv(t)(ce($n)(Dn(t.MonadST5().Monad0().Applicative0()))($(t.MonadST5().Monad0().Applicative0()))([an(Fv)(Ev.value)("true"),an(Av)(wv.value)("250")]))([Lv(t)(ce($n)(Dn(t.MonadST5().Monad0().Applicative0()))($(t.MonadST5().Monad0().Applicative0()))([an(xv)(Mv.value)(a),an(Lp)(yo.value)("video/mp4")]))([])])})(Ic()()("https://interactive-examples.mdn.mozilla.net/media/cc0-videos/flower.mp4")(Ic()()("https://www.w3schools.com/jsref/movie.mp4")(dp))))(function(a){return function(u){var c=Lc()()()()()({reflectType:function(){return 1}})(M.value)(a),l=Lc()()()()()({reflectType:function(){return 0}})(M.value)(a),_=Ke(Et(t.MonadST5()))(L(Hr(tr)))(e),f=function(){var i=_u(t.MonadST5())(function(d){return d?l:c});return function(d){return i(_(d))}}();return Nn(t)([_r(t)($(t.MonadST5().Monad0().Applicative0())(an(_t)(nt.value)(Yn(L(r(void 0))))))([wn(t.MonadST5().Monad0())("Switch videos")]),Nn(t)([Du(t)([f(!0)]),Du(t)([f(!1)])])])}})))})}))),next:$(t.MonadST5().Monad0().Applicative0())(an(_t)(nt.value)(Yn(function(r){return K(Gn)(K(Gn)(St(r))(n(xo.value)))(jt)})))})}};var dh=function(){return M.value}(),Dh=function(){return M.value}(),$v=function(n){return function(t){return It({reflectType:function(){return`<div>
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
  <p>In this section, we used PursX to build the same component as the previous section. In the next section, we'll learn how to respond to <a href="/events1.html" ~next~ style="cursor:pointer;">events</a>.</p>
</div>`}})()()(zn()(Ot()(zn()(wt(t.MonadST5().Monad0().Applicative0()))({reflectType:function(){return"result"}})({reflectSymbol:function(){return"result"}})(t))({reflectType:function(){return"next"}})({reflectSymbol:function(){return"next"}})(t))({reflectType:function(){return"code"}})({reflectSymbol:function(){return"code"}})(t))(t)(dh)({code:qn(xt(t)([Mt(t)([wn(t.MonadST5().Monad0())(`module Main where

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
`)])])),result:qn(Rp({reflectType:function(){return`<div>
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
`}})()(t)(wt(t.MonadST5().Monad0().Applicative0()))(Dh)),next:na(Et(t.MonadST5()))(an(_t)(nt.value)(Yn(function(r){return K(Gn)(K(Gn)(St(r))(n(ho.value)))(jt)})))})}};var gh=function(){return M.value}(),bh=function(){return M.value}(),Pv=function(n){return function(t){return zc({reflectType:function(){return`<div>
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
  <p>In more complicated apps, like this documentation, we'll need dynamic logic that allows for components to replace each other, for example in a navigation bar. In the next section, we'll see one way to do this by using <a href="/events2.html" ?next? style="cursor:pointer;">events to control the presence and absence of elements</a>.</p>
</div>`}})({reflectType:function(){return"?"}})()()(t)(zn()(Ot()(zn()(wt(t.MonadST5().Monad0().Applicative0()))({reflectType:function(){return"result"}})({reflectSymbol:function(){return"result"}})(t))({reflectType:function(){return"next"}})({reflectSymbol:function(){return"next"}})(t))({reflectType:function(){return"code"}})({reflectSymbol:function(){return"code"}})(t))(M.value)(gh)({code:qn(xt(t)([Mt(t)([wn(t.MonadST5().Monad0())(`module Main where

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
  )`)])])),result:qn(Ma(xa(t)(t.Always2())(function(r){return function(e){return $(t.MonadST5().Monad0().Applicative0())(so(It({reflectType:function(){return`<div>
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
`}})()()(Ot()(zn()(wt(t.MonadST5().Monad0().Applicative0()))({reflectType:function(){return"somethingNew"}})({reflectSymbol:function(){return"somethingNew"}})(t))({reflectType:function(){return"myli"}})({reflectSymbol:function(){return"myli"}})(t))(t)(bh)({myli:$(t.MonadST5().Monad0().Applicative0())(an(Mp)(ar.value)("background-color:rgb(200,240,210);")),somethingNew:qn(_r(t)($(t.MonadST5().Monad0().Applicative0())(an(vo)(nt.value)(r(new v(void 0)))))([Ir(t.MonadST5().Monad0())(U(An(t.MonadST5().Monad0().Applicative0()))(Pr(Qn)(ha(cu(t.MonadST5().Monad0().Applicative0()))(e))("Thanks for clicking me!"))($(t.MonadST5().Monad0().Applicative0())("I was dynamically inserted")))]))})))}}))),next:$(t.MonadST5().Monad0().Applicative0())(an(_t)(nt.value)(Yn(function(r){return K(Gn)(K(Gn)(St(r))(n(Fo.value)))(jt)})))})}};var Ch=function(n){return function(t){return function(r){return new gn(Un(n)("p")(t)(at(r)))}}},Nv=function(n){return Ch(n)(un(Dn(n.MonadST5().Monad0().Applicative0())))};var Rl=(n,t,r,e)=>{n(a=>e.units[a].main.appendChild(e.units[t].main))(r)},Rv=n=>t=>r=>e=>()=>{var a,u=r.id;e.scopes[r.scope]||(e.scopes[r.scope]=[]),e.scopes[r.scope].push(u),n&&r.parent.value0&&(a=document.body.querySelectorAll("[data-deku-ssr-"+u+"]").item(0))?e.units[u]={listeners:{},parent:r.parent,scope:r.scope,main:a}:(e.units[u]={listeners:{},parent:r.parent,scope:r.scope,main:document.createElement(r.tag)},Rl(t,u,r.parent,e))},kv=n=>t=>r=>e=>()=>{var a=r.id,u;e.scopes[r.scope]||(e.scopes[r.scope]=[]),e.scopes[r.scope].push(a),n&&r.parent.value0&&(u=document.body.querySelectorAll("[data-deku-ssr-"+r.parent.value0+"]").item(0))?e.units[a]={main:u.childNodes[0],parent:r.parent,scope:r.scope}:(e.units[a]={main:document.createTextNode(""),parent:r.parent,scope:r.scope},Rl(t,a,r.parent,e))};function kl(){return{units:{},scopes:{}}}var Ov=n=>t=>r=>()=>{var e=t.id,a=t.value;n&&!r.units[e]&&(dom=document.body.querySelectorAll("[data-deku-ssr-"+e+"]").item(0))&&(r.units[e]={listeners:{},parent:t.parent,scope:t.scope,main:dom},r.scopes[t.scope]||(r.scopes[t.scope]=[]),r.scopes[t.scope].push(e)),r.units[e].main.tagName==="INPUT"&&t.key==="value"?r.units[e].main.value=a:r.units[e].main.tagName==="INPUT"&&t.key==="checked"?r.units[e].main.checked=a==="true":r.units[e].main.setAttribute(t.key,a)},Wv=n=>t=>r=>()=>{var e=t.id,a=t.value;if(n&&!r.units[e]&&(dom=document.body.querySelectorAll("[data-deku-ssr-"+e+"]").item(0))&&(r.units[e]={listeners:{},parent:t.parent,scope:t.scope,main:dom},r.scopes[t.scope]||(r.scopes[t.scope]=[]),r.scopes[t.scope].push(e)),t.key==="@self@")a(r.units[e].main)();else{r.units[e].listeners[t.key]&&r.units[e].main.removeEventListener(t.key,r.units[e].listeners[t.key]);var u=c=>a(c)();r.units[e].main.addEventListener(t.key,u),r.units[e].listeners[t.key]=u}},Uv=n=>t=>()=>{var r=n.id;t.units[r].main.nodeValue=n.text},Hv=n=>t=>r=>e=>()=>{var a,u,c=r.id,l=r.html,_=r.verb,f=r.cache,i=r.parent,d=r.scope,m=r.pxScope;if(n&&r.parent.value0&&(a=document.body.querySelectorAll("[data-deku-ssr-"+c+"]").item(0)))e.units[c]={listeners:{},scope:d,parent:i,main:a};else{let p=Object.entries(f);for(var o=0;o<p.length;o++){let H=p[o][0];p[o][1]===!0?l=l.replace(_+H+_,'data-deku-attr-internal="'+H+'"'):l=l.replace(_+H+_,'<span style="display:contents;" data-deku-elt-internal="'+H+'"></span>')}u=document.createElement("div"),u.innerHTML=l.trim(),e.units[c]={listeners:{},scope:d,parent:i,main:u.firstChild}}e.scopes[d]||(e.scopes[d]=[]),e.scopes[d].push(c),u||(u=a),u.querySelectorAll("[data-deku-attr-internal]").forEach(function(p){var H=p.getAttribute("data-deku-attr-internal");let Hn=H+m;e.units[Hn]={listeners:{},main:p,scope:d},e.scopes[d].push(Hn)}),u.querySelectorAll("[data-deku-elt-internal]").forEach(function(p){var H=p.getAttribute("data-deku-elt-internal");let Hn=H+m;e.units[H+m]={listeners:{},main:p,scope:d},e.scopes[d].push(Hn)}),a||Rl(t,c,i,e)},Bv=n=>t=>()=>{var r=n.id;t.units[r]={main:n.root}},qv=n=>t=>()=>{var r=n.id,e=n.parent;t.units[r].containingScope=n.scope,t.units[e].main.prepend(t.units[r].main)},zv=n=>t=>()=>{var r=n.id;t.units[r].noop||t.units[r].containingScope&&!n.scopeEq(t.units[r].containingScope)(n.scope)||t.units[r].main.remove()},Vv=n=>t=>()=>{delete t.units[n.id]},Jv=n=>t=>()=>{var r=n.id;t.units[r].main.parentNode.prepend(t.units[r].main)};var jv=function(n){return n};var wh=1,Ol=2147483647,Ah=function(){return Ol-1|0}(),Wl=function(n){var t=function(r){return function(e){return function(a){var u=e-r|0,c=Bu(Af)(a)(u),l=c<r;return l?c+e|0:c}}};return t(wh)(Ah)(n)};var Lh=0,Ih=48271,Gv=function(n){return function(t){return gr()(af(xu(pr(Ih)*pr(t)+pr(n))(pr(Ol))))}},Xv=Gv(Lh);var Oh=function(){function n(c){this.fn=c}var t={},r=function(c,l){this.head=c,this.tail=l};function e(c){return new r(c,t)}function a(c){return function(l){return new r(c,l)}}function u(c){for(var l=[],_=c;_!==t;)l.push(_.head),_=_.tail;return l}return function(c){return function(l){return function(_){var f=function(d,m){return c(l(a)(_(d)))(m)},i=function(d,m,o){if(m===0)return d;var p=o[m-1];return new n(function(){var H=i(f(p,d),m-1,o);return H})};return function(d){for(var m=l(e)(_(d[d.length-1])),o=i(m,d.length-1,d);o instanceof n;)o=o.fn();return l(u)(o)}}}}}();var Io=function(n){return{map:function(t){return function(r){return function(e){return s(n)(function(a){return new C(t(a.value0),a.value1)})(r(e))}}}}};var Bl=function(n){return{Applicative0:function(){return $a(n)},Bind1:function(){return pf(n)}}},pf=function(n){return{bind:function(t){return function(r){return function(e){return b(n.Bind1())(t(e))(function(a){var u=r(a.value0);return u(a.value1)})}}},Apply0:function(){return mf(n)}}},mf=function(n){return{apply:qr(Bl(n)),Functor0:function(){return Io(n.Bind1().Apply0().Functor0())}}},$a=function(n){return{pure:function(t){return function(r){return D(n.Applicative0())(new C(t,r))}},Apply0:function(){return mf(n)}}};var Au=function(n){return{state:function(t){var r=D(n.Applicative0());return function(e){return r(t(e))}},Monad0:function(){return Bl(n)}}};var ed=function(n){return function(t){var r=n(t);return r.value1}},ad=function(n){return function(t){var r=n(t);return r.value0}};var n0=function(n){return n};var t0=function(){var n=function(t){return new C(jv(t.newSeed),function(){var r={};for(var e in t)({}).hasOwnProperty.call(t,e)&&(r[e]=t[e]);return r.newSeed=Xv(t.newSeed),r}())};return ge(Au(et))(n)}();var Lu=Io(se);var zl=function(n){return ad(n0(n))};var id=mf(et),ud=function(n){return function(t){var r=pr(t),e=pr(n),a=function(l){return e+xu(l)(r-e+1)},u=s(Lu)(pr)(t0),c=Tn(id)(s(Lu)($t(Wo))(u))(s(Lu)(jr(Wo)(2))(u));return s(Lu)(function(l){return Tl(a(l))})(c)}},fd=function(n){return function(t){var r=n<=t;return r?ud(n)(t):ud(t)(n)}};var Vl=function(n){return n.arbitrary};var Jl=function(){return{arbitrary:fd(-1e6)(1e6)}}();var vf=function(){function n(t){this.value0=t}return n.create=function(t){return new n(t)},n}(),df=function(){function n(t){this.value0=t}return n.create=function(t){return new n(t)},n}(),Df=function(){function n(t){this.value0=t}return n.create=function(t){return new n(t)},n}(),yf=function(){function n(t){this.value0=t}return n.create=function(t){return new n(t)},n}(),Iu=function(){function n(t){this.value0=t}return n.create=function(t){return new n(t)},n}(),e0=function(n){return function(t){return Z(gt)(zt(function(r){return w(Tt)(r)([new Iu(n)])})(t))}},a0=function(n){return function(t){return Z(gt)(zt(function(r){return w(Tt)(r)([new yf(n)])})(t))}},o0=function(n){return function(t){return Z(gt)(zt(function(r){return w(Tt)(r)([new df(n)])})(t))}},u0=function(n){return function(t){return Z(gt)(zt(function(r){return w(Tt)(r)([new Df(n)])})(t))}},i0=function(n){return function(t){return Z(gt)(zt(function(r){return w(Tt)(r)([new vf(n)])})(t))}},ld=function(n){return{ids:function(){var r=yt(n)(),e=R(Wr)(zl(Vl(Jl))({newSeed:Wl(r),size:5}));return Z(gt)(zt($t(Mr)(1))(n))(),e},makeElement:i0,makeRoot:function(t){return function(r){return D(fr)(void 0)}},makeText:o0,makePursx:u0,setProp:a0,setCb:function(t){return function(r){return D(fr)(void 0)}},setText:e0,sendToTop:function(t){return function(r){return D(fr)(void 0)}},deleteFromCache:function(t){return function(r){return D(fr)(void 0)}},giveNewParent:function(t){return function(r){return D(fr)(void 0)}},disconnectElement:function(t){return function(r){return D(fr)(void 0)}}}},sd=function(n){return{ids:function(){var r=ro(n)(),e=R(Wr)(zl(Vl(Jl))({newSeed:Wl(r),size:5}));return Z(xn)(M_($t(Mr)(1))(n))(),e},makeElement:Rv(!0)(Kn(void 0)),makeRoot:Bv,makeText:kv(!0)(Kn(void 0)),makePursx:Hv(!0)(Kn(void 0)),setProp:Ov(!0),setCb:Wv(!0),setText:Uv,sendToTop:Jv,deleteFromCache:Vv,giveNewParent:qv,disconnectElement:zv}};var jl=({id:n,html:t,pxScope:r,cache:e,verb:a})=>{let u=t,c=Object.entries(e);for(var l=0;l<c.length;l++){let d=c[l][0];c[l][1]===!0?u=u.replace(a+d+a,'data-deku-attr-internal="'+d+'" data-deku-ssr-'+d+r+'="true"'):u=u.replace(a+d+a,'<span style="display:contents;" data-deku-elt-internal="'+d+'" data-deku-ssr-'+d+r+'="true"></span>')}let _=u.indexOf(">"),f=u.indexOf("/>"),i=f==_-1?f:_;return u.slice(0,i)+" data-deku-ssr-"+n+'="true" '+u.slice(i)};var pd=function(n){return function(t){var r=function(f){return function(i){return Z(Io(se))(Ao(Au(et))(function(d){var m={};for(var o in d)({}).hasOwnProperty.call(d,o)&&(m[o]=d[o]);return m.idToActions=uo(qt)(function(p){if(p instanceof v)return new v(w(Tt)(p.value0)([i]));if(p instanceof y)return new v([i]);throw new Error("Failed pattern match at Deku.SSR (line 43, column 17 - line 45, column 45): "+[p.constructor.name])})(f)(d.idToActions),m}))}},e=function(f){return function(i){return function(d){return Vn(Jn)(pf(et))(Z(Io(se))(Ao(Au(et))(function(m){var o={};for(var p in m)({}).hasOwnProperty.call(m,p)&&(o[p]=m[p]);return o.parentToChild=uo(qt)(function(H){if(H instanceof v)return new v(w(Tt)(H.value0)([i]));if(H instanceof y)return new v([i]);throw new Error("Failed pattern match at Deku.SSR (line 30, column 17 - line 32, column 41): "+[H.constructor.name])})(f)(m.parentToChild),o})))(function(){return r(i)(d)})}}},a=ed(or(je)($a(et))(function(f){if(f instanceof vf)return rr($a(et))(Ct)(f.value0.parent)(function(i){return e(i)(f.value0.id)(f)});if(f instanceof df)return rr($a(et))(Ct)(f.value0.parent)(function(i){return e(i)(f.value0.id)(f)});if(f instanceof Df)return rr($a(et))(Ct)(f.value0.parent)(function(i){return e(i)(f.value0.id)(f)});if(f instanceof yf||f instanceof Iu)return r(f.value0.id)(f);throw new Error("Failed pattern match at Deku.SSR (line 53, column 17 - line 60, column 43): "+[f.constructor.name])})(t))({parentToChild:oo,idToActions:oo}),u=function(f){return nr("")(pi(function(i){return i instanceof vf?new v(i.value0.tag):y.value})(f))},c=function(f){return Fe($n)(qo)(" ")(cr(rp)(function(i){return i instanceof yf?new v(i.value0.key+('="'+(i.value0.value+'"'))):y.value})(f))},l=function(f){return Kn("")(function(i){var d=function(p){return nr("")(pi(function(H){return H instanceof Iu?new v(H.value0.text):y.value})(i))},m=function(p){var H=u(i),Hn=c(i);return"<"+(H+(" "+(Hn+(" data-deku-ssr-"+(f+('="true">'+(_(f)+("</"+(H+">")))))))))},o=eo(i)(0);return o instanceof v&&o.value0 instanceof Iu?d(void 0):o instanceof v&&o.value0 instanceof df?d(void 0):o instanceof v&&o.value0 instanceof Df?jl(o.value0.value0):m(void 0)})(di(qt)(f)(a.idToActions))},_=function(f){var i=nr([])(di(qt)(f)(a.parentToChild));return er($n)(qo)(l)(i)};return"<"+(n+(' data-deku-ssr-deku-root="true">'+(_("deku-root")+("</"+(n+">")))))}};var md=function(n){return De(n.MonadST5().Monad0().Applicative0())(n.MonadST5())({doLogic:function(t){return function(r){return function(e){return r.sendToTop({id:e})}}},ids:function(){var t=mt();return function(r){return function(e){return e.ids}(t(r))}}(),disconnectElement:function(t){return function(r){return t.disconnectElement({id:r.id,scope:r.scope,parent:r.parent,scopeEq:rn(Fa)})}},wrapElt:function(){var t=Un(n)("div")(un(Dn(n.MonadST5().Monad0().Applicative0())));return function(r){return gn.create(t(r))}}(),toElt:function(t){return t}})},V0=function(n){return function(){var r=kl(),e=Jr(xn)(tu(0))(sd)();return Vt(md(Mi)({parent:new v("deku-root"),scope:new ta("rootScope"),raiseId:function(a){return D(ir)(void 0)}})(e)(n))(function(a){return a(r)})()}},vd=function(n){return Z(xn)(V0(n))},J0=function(n){return function(t){return function(r){return function(e){return s(n.MonadST5().Monad0().Bind1().Apply0().Functor0())(function(){var a=pd(t);return function(u){return function(c){return r.head+c}(function(c){return c+r.tail}(a(u)))}}())(dn(n.MonadST5())(function(){var u=At(0)(),c=At([])(),l=ld(u);return Z(gt)(Vt(md(Fi)({parent:new v("deku-root"),scope:new ta("rootScope"),raiseId:function(_){return D(fr)(void 0)}})(l)(e))(function(_){return _(c)}))(),yt(c)()}))}}}},dd=function(n){return J0(n)("body")};var j0=function(){return M.value}(),yd=function(n){return xi()(n)()(Za({reflectSymbol:function(){return"buttonClicked"}})(Ka(no(n.Always2())))(Za({reflectSymbol:function(){return"sliderMoved"}})(Ka(no(n.Always2())))(oi)()())()())(co({reflectSymbol:function(){return"buttonClicked"}})()()(co({reflectSymbol:function(){return"sliderMoved"}})()()(bi)()()()())()()()())(M.value)(function(t){return function(r){return Nn(n)([Nv(n)([wn(n.MonadST5().Monad0())(`Here's an example of SSR in deku.
All of the static bits are rendered as HTML,
and all of the dynamic bits are hydrated on page load.`)]),_r(n)(_f(Qn)(Br)(vo)($(n.MonadST5().Monad0().Applicative0())(t.buttonClicked)))([wn(n.MonadST5().Monad0())("Click")]),Nn(n)([Ir(n.MonadST5().Monad0())(U(An(n.MonadST5().Monad0().Applicative0()))($(n.MonadST5().Monad0().Applicative0())("Val: 0"))(s(Qn)(function(){var e=w(Te)("Val: "),a=R(Wr);return function(u){return e(a(u))}}())(Ke(Et(n.MonadST5()))(L($t(Mr)(1)))(U(An(n.MonadST5().Monad0().Applicative0()))($(n.MonadST5().Monad0().Applicative0())(void 0))(r.buttonClicked))(-1))))]),Nn(n)([aa(n)(sf(n.MonadST5().Monad0().Applicative0())($(n.MonadST5().Monad0().Applicative0())(t.sliderMoved)))([]),Nn(n)([Ir(n.MonadST5().Monad0())(U(An(n.MonadST5().Monad0().Applicative0()))($(n.MonadST5().Monad0().Applicative0())("Val: 50"))(s(Qn)(function(){var e=w(Te)("Val: "),a=R(Ho);return function(u){return e(a(u))}}())(r.sliderMoved)))])])])}})},gd=function(n){return function(t){return It({reflectType:function(){return`<div>
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
</div>`}})()()(zn()(zn()(zn()(zn()(zn()(wt(t.MonadST5().Monad0().Applicative0()))({reflectType:function(){return"result"}})({reflectSymbol:function(){return"result"}})(t))({reflectType:function(){return"codegen"}})({reflectSymbol:function(){return"codegen"}})(t))({reflectType:function(){return"code2"}})({reflectSymbol:function(){return"code2"}})(t))({reflectType:function(){return"code1"}})({reflectSymbol:function(){return"code1"}})(t))({reflectType:function(){return"code0"}})({reflectSymbol:function(){return"code0"}})(t))(t)(j0)({code2:qn(xt(t)([Mt(t)([wn(t.MonadST5().Monad0())(`module Live where

import Prelude

import App (app)
import Deku.Toplevel (hydrate)
import Effect (Effect)

main :: Effect Unit
main = hydrate app`)])])),code1:qn(xt(t)([Mt(t)([wn(t.MonadST5().Monad0())(`module Build where

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
    app >>= log`)])])),code0:qn(xt(t)([Mt(t)([wn(t.MonadST5().Monad0())(`module App where

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
`)])])),result:qn(yd(t)),codegen:qn(xt(t)([Mt(t)([Ir(t.MonadST5().Monad0())(sr(function(r){return K(t.MonadST5().Monad0().Bind1().Apply0())(b(t.MonadST5().Monad0().Bind1())(dd(t)({head:'<!DOCTYPE html><html><head><script src="bundle.js" defer><\/script></head>',tail:"</html>"})(yd(Fi)))(r))(D(t.MonadST5().Monad0().Applicative0())(D(t.MonadST5().Monad0().Applicative0())(void 0)))}))])]))})}};var bd=function(n){return function(t){var r=function(e){return function(a){if(a instanceof Oi)return hv(e)(t);if(a instanceof go)return Cv(e)(t);if(a instanceof bo)return Up(e)(t);if(a instanceof To)return $v(e)(t);if(a instanceof ho)return dv(e)(t);if(a instanceof Eo)return lv(e)(t);if(a instanceof Co)return Pv(e)(t);if(a instanceof Fo)return Tv(e)(t);if(a instanceof Mo)return Sv(e)(t);if(a instanceof xo)return gd(e)(t);throw new Error("Failed pattern match at Deku.Example.Docs.Scene (line 95, column 3 - line 95, column 39): "+[e.constructor.name,a.constructor.name])}};return _o(t)(t.Always2())(function(e){return Cr(lr)(function(a){return U(An(t.MonadST5().Monad0().Applicative0()))($(t.MonadST5().Monad0().Applicative0())(n))(a)})(function(a){return Nn(t)([Nn(t)(s(ut)(function(u){return Du(t)([Pi(t)(ce($n)(Dn(t.MonadST5().Monad0().Applicative0()))($(t.MonadST5().Monad0().Applicative0()))([an(_t)(nt.value)(Yn(function(c){return K(Gn)(St(c))(e(u.value0))})),an(wp)(ar.value)("cursor:pointer;"),an(Si)(Ii.value)("/"+(u.value1.value1.value0+".html"))]))([wn(t.MonadST5().Monad0())(u.value1.value0)]),Aa(t)($(t.MonadST5().Monad0().Applicative0())(an(Do)(ar.value)(function(){return u.value1.value1.value1?"":"display:none;"}())))([wn(t.MonadST5().Monad0())(" | ")])])})([new C(Oi.value,new C("Home",new C("index",!0))),new C(go.value,new C("Hello world",new C("hello",!0))),new C(bo.value,new C("Component",new C("simple",!0))),new C(To.value,new C("Pursx 1",new C("pursx1",!0))),new C(ho.value,new C("Events 1",new C("events1",!0))),new C(Eo.value,new C("Effects",new C("effects",!0))),new C(Co.value,new C("Pursx 2",new C("pursx2",!0))),new C(Fo.value,new C("Events 2",new C("events2",!0))),new C(Mo.value,new C("Portals",new C("portals",!0))),new C(xo.value,new C("SSR",new C("ssr",!1)))])),Nn(t)([_u(t.MonadST5())(r(e))(a)])])})})}};var S7=function(n){return xr(ir)(Ct)(function(t){return vd(bd(t)(Mi))})(Np(n))};export{S7 as main};
