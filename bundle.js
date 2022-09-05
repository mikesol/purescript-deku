var Ip=function(t){return function(r){for(var e=t.length,n=r.length,u=new Array(e*n),o=0,c=0;c<e;c++)for(var l=t[c],m=0;m<n;m++)u[o++]=l(r[m]);return u}};var Ya={compose:function(t){return function(r){return function(e){return t(r(e))}}}},Za=function(t){return t.compose};var Et=function(t){return t.identity},$t={identity:function(t){return t},Semigroupoid0:function(){return Ya}};var ce=!0;var Wf=function(t){return function(r){return function(e){return function(n){return t(r(e))(r(n))}}}},kr=function(t){return function(r){return function(e){return t(e)(r)}}},C=function(t){return function(r){return t}};var to=function(t){return function(r){return r(t)}};var Lp=function(t){return function(r){for(var e=r.length,n=new Array(e),u=0;u<e;u++)n[u]=t(r[u]);return n}};var J=function(){function t(){}return t.value=new t,t}();var g=function(t){return t.map},pn=function(t){return function(r){return function(e){return g(t)(e)(r)}}},at=function(t){return g(t)(C(void 0))},R=function(t){return function(r){return function(e){return g(t)(C(e))(r)}}};var xu={map:Za(Ya)},Dr={map:Lp};var ro={apply:Ip,Functor0:function(){return Dr}},It=function(t){return t.apply};var Rt=function(t){return function(r){return function(e){return It(t)(g(t.Functor0())(C(Et($t)))(r))(e)}}};var _=function(t){return t.pure};var Bn=function(t){return function(r){return function(e){if(r)return e;if(!r)return _(t)(void 0);throw new Error("Failed pattern match at Control.Applicative (line 63, column 1 - line 63, column 63): "+[r.constructor.name,e.constructor.name])}}},eo=function(t){return function(r){return function(e){return It(t.Apply0())(_(t)(r))(e)}}};var no={pure:function(t){return[t]},Apply0:function(){return ro}};var Op=function(t){return function(r){return t+r}},Rp=function(t){return function(r){return t.length===0?r:r.length===0?t:t.concat(r)}};var le=function(t){return t.reflectSymbol};var Ke=function(t){return function(r){return r[t]}},Wn=function(t){return function(r){return function(e){var n={};for(var u in e)({}).hasOwnProperty.call(e,u)&&(n[u]=e[u]);return n[t]=r,n}}};var Hp={append:function(t){return function(r){return void 0}}},Un={append:Op};var or={append:Rp};var B=function(t){return t.append};var nt=function(t){return t.alt};var Db=String.fromCharCode(65535),bb=String.fromCharCode(0),db=Number.POSITIVE_INFINITY,Ab=Number.NEGATIVE_INFINITY;var Bp=function(t){return function(r){return function(e){return function(n){return function(u){return n<u?t:n===u?r:e}}}}};var Wp=Bp;var Up=Bp;var qp=function(t){return function(r){return t===r}};var zp=qp;var Vp=qp;var cu={eq:Vp};var uo={eq:zp};var gt=function(t){return t.eq};var dt=function(){function t(){}return t.value=new t,t}(),Tt=function(){function t(){}return t.value=new t,t}(),St=function(){function t(){}return t.value=new t,t}();var Jp=function(t){return function(r){return t-r|0}};var jp=function(t){return function(r){return t+r|0}},Xp=function(t){return function(r){return t*r|0}},Gp=function(t){return function(r){return t+r}},Kp=function(t){return function(r){return t*r}};var ao={add:Gp,zero:0,mul:Kp,one:1},he={add:jp,zero:0,mul:Xp,one:1};var Re=function(t){return t.mul};var wr=function(t){return t.add};var Uf={sub:Jp,Semiring0:function(){return he}};var Zr=function(){return{compare:Up(dt.value)(St.value)(Tt.value),Eq0:function(){return cu}}}();var pe=function(){return{compare:Wp(dt.value)(St.value)(Tt.value),Eq0:function(){return uo}}}();var Ct=function(t){return t.compare};var Qe=function(t){return t.top};var Iu={top:2147483647,bottom:-2147483648,Ord0:function(){return pe}};var vn=function(t){return t.bottom};var Yp=function(t){return t.toString()},Zp=function(t){var r=t.toString();return isNaN(r+".0")?r:r+".0"};var t_=function(t){var r=t.length;return'"'+t.replace(/[\0-\x1F\x7F"\\]/g,function(e,n){switch(e){case'"':case"\\":return"\\"+e;case"\x07":return"\\a";case"\b":return"\\b";case"\f":return"\\f";case`
`:return"\\n";case"\r":return"\\r";case"	":return"\\t";case"\v":return"\\v"}var u=n+1,o=u<r&&t[u]>="0"&&t[u]<="9"?"\\&":"";return"\\"+e.charCodeAt(0).toString(10)+o})+'"'};var r_=function(t){return function(r){return[t].concat(r)}},ni=function(t){return function(r){return r.join(t)}};var Ee={show:t_},e_={showRecordFields:function(t){return function(r){return[]}}},n_=function(t){return t.showRecordFields},u_=function(){return function(){return function(t){return{show:function(r){var e=n_(t)(J.value)(r);return e.length===0?"{}":ni(" ")(["{",ni(", ")(e),"}"])}}}}};var io={show:Zp},Ne={show:Yp};var Y=function(t){return t.show};var zf=function(t){return function(r){return function(e){return{showRecordFields:function(n){return function(u){var o=n_(r)(J.value)(u),c=le(t)(J.value),l=Ke(c)(u);return r_(ni(": ")([c,Y(e)(l)]))(o)}}}}}};var I=function(){function t(){}return t.value=new t,t}(),k=function(){function t(r){this.value0=r}return t.create=function(r){return new t(r)},t}();var Xt=function(t){return function(r){return function(e){if(e instanceof I)return t;if(e instanceof k)return r(e.value0);throw new Error("Failed pattern match at Data.Maybe (line 237, column 1 - line 237, column 51): "+[t.constructor.name,r.constructor.name,e.constructor.name])}}};var oa=Xt(!1)(C(!0));var _r={map:function(t){return function(r){return r instanceof k?new k(t(r.value0)):I.value}}};var ne=function(t){return Xt(t)(Et($t))},De=function(){return function(t){if(t instanceof k)return t.value0;throw new Error("Failed pattern match at Data.Maybe (line 288, column 1 - line 288, column 46): "+[t.constructor.name])}};var Lu={apply:function(t){return function(r){if(t instanceof k)return g(_r)(t.value0)(r);if(t instanceof I)return I.value;throw new Error("Failed pattern match at Data.Maybe (line 67, column 1 - line 69, column 30): "+[t.constructor.name,r.constructor.name])}},Functor0:function(){return _r}},be={bind:function(t){return function(r){if(t instanceof k)return r(t.value0);if(t instanceof I)return I.value;throw new Error("Failed pattern match at Data.Maybe (line 125, column 1 - line 127, column 28): "+[t.constructor.name,r.constructor.name])}},Apply0:function(){return Lu}};var Hr=function(){return{pure:k.create,Apply0:function(){return Lu}}}();var Rb={alt:function(t){return function(r){return t instanceof I?r:t}},Functor0:function(){return _r}},i_=function(){return{empty:I.value,Alt0:function(){return Rb}}}();var f_=function(t){return function(r){return function(e){for(var n=r,u=e.length,o=u-1;o>=0;o--)n=t(e[o])(n);return n}}},c_=function(t){return function(r){return function(e){for(var n=r,u=e.length,o=0;o<u;o++)n=t(n)(e[o]);return n}}};var l_=function(t){return function(r){for(var e=[],n=0,u=t.length;n<u;n++)Array.prototype.push.apply(e,r(t[n]));return e}};var ia=function(t){return t.discard};var ai={bind:l_,Apply0:function(){return ro}},it=function(t){return t.bind},zn=function(t){return kr(it(t))},oi=function(t){return function(r){return function(e){return function(n){return zn(t)(r)(e(n))}}}},ii=function(t){return function(r){return function(e){return function(n){return it(t)(r(n))(e)}}}};var fa={discard:function(t){return it(t)}};var A=function(t){return t.empty};var ut=function(){function t(r){this.value0=r}return t.create=function(r){return new t(r)},t}(),et=function(){function t(r){this.value0=r}return t.create=function(r){return new t(r)},t}();var Jf=function(t){return Xt(new ut(t))(et.create)};var ca={map:function(t){return function(r){if(r instanceof ut)return new ut(r.value0);if(r instanceof et)return new et(t(r.value0));throw new Error("Failed pattern match at Data.Either (line 31, column 1 - line 31, column 52): "+[r.constructor.name])}}};var He=function(t){return function(r){return function(e){if(e instanceof ut)return t(e.value0);if(e instanceof et)return r(e.value0);throw new Error("Failed pattern match at Data.Either (line 208, column 1 - line 208, column 64): "+[t.constructor.name,r.constructor.name,e.constructor.name])}}},jf=function(){return He(C(I.value))(k.create)}();var qb=function(t,r,e){var n=0,u;return function(o){if(n===2)return u;if(n===1)throw new ReferenceError(t+" was needed before it finished initializing (module "+r+", line "+o+")",r,o);return n=1,u=e(),n=2,u}};var s_={defer:function(t){return function(r){return t(void 0)(r)}}},la=function(t){return t.defer},Xf=function(t){return function(r){var e=qb("go","Control.Lazy",function(){return la(t)(function(u){return r(e(25))})}),n=e(25);return n}};var v_=function(t){return function(r){return t&&r}},m_=function(t){return function(r){return t||r}},D_=function(t){return!t};var Be=function(t){return t.not};var _a=function(t){return t.ff};var Pu=function(t){return t.disj},ue={ff:!1,tt:!0,implies:function(t){return function(r){return Pu(ue)(Be(ue)(t))(r)}},conj:v_,disj:m_,not:D_};var b_=function(t){return Math.min(Math.abs(t),2147483647)},d_=function(t){return function(r){return r===0?0:r>0?Math.floor(t/r):-Math.floor(t/-r)}},A_=function(t){return function(r){if(r===0)return 0;var e=Math.abs(r);return(t%e+e)%e}};var k_={Ring0:function(){return Uf}};var fo=function(t){return t.mod};var fi={degree:b_,div:d_,mod:A_,CommutativeRing0:function(){return k_}};var co={mempty:void 0,Semigroup0:function(){return Hp}},lo={mempty:"",Semigroup0:function(){return Un}};var Pt=function(t){return t.mempty};var H=function(){function t(r,e){this.value0=r,this.value1=e}return t.create=function(r){return function(e){return new t(r,e)}},t}();var Br=function(t){return t.value1};var Ou={map:function(t){return function(r){return new H(r.value0,t(r.value1))}}};var vo=function(t){return t};var nd=function(t){return{append:function(r){return function(e){return Pu(t)(r)(e)}}}};var Yf=function(t){return{mempty:_a(t),Semigroup0:function(){return nd(t)}}};var U=function(t){return t};var Dn=function(){return U};var $r=Dn;var mi=function(){return function(){return function(){return function(){return function(t){return Dn()}}}}};var nr=function(t){return t.foldr};var ma=function(t){return function(r){return nr(t)(nt(r.Alt0()))(A(r))}},mr=function(t){return function(r){return function(e){return nr(t)(function(){var n=nt(r.Alt0());return function(u){return n(e(u))}}())(A(r))}}},Da=function(t){return function(r){return function(e){return nr(r)(function(){var n=Rt(t.Apply0());return function(u){return n(e(u))}}())(_(t)(void 0))}}},Ir=function(t){return function(r){return kr(Da(t)(r))}};var ur=function(t){return t.foldl};var Vn=function(t){return function(r){return function(e){return function(n){var u=function(o){return function(c){return o.init?{init:!1,acc:c}:{init:!1,acc:B(r.Semigroup0())(o.acc)(B(r.Semigroup0())(e)(c))}}};return ur(t)(u)({init:!0,acc:Pt(r)})(n).acc}}}};var Kr={foldr:function(t){return function(r){return function(e){if(e instanceof I)return r;if(e instanceof k)return t(e.value0)(r);throw new Error("Failed pattern match at Data.Foldable (line 138, column 1 - line 144, column 27): "+[t.constructor.name,r.constructor.name,e.constructor.name])}}},foldl:function(t){return function(r){return function(e){if(e instanceof I)return r;if(e instanceof k)return t(r)(e.value0);throw new Error("Failed pattern match at Data.Foldable (line 138, column 1 - line 144, column 27): "+[t.constructor.name,r.constructor.name,e.constructor.name])}}},foldMap:function(t){return function(r){return function(e){if(e instanceof I)return Pt(t);if(e instanceof k)return r(e.value0);throw new Error("Failed pattern match at Data.Foldable (line 138, column 1 - line 144, column 27): "+[r.constructor.name,e.constructor.name])}}}};var T_=function(t){return function(r){return function(e){return nr(t)(function(n){return function(u){return B(r.Semigroup0())(e(n))(u)}})(Pt(r))}}},Dt={foldr:f_,foldl:c_,foldMap:function(t){return T_(Dt)(t)}};var Lr=function(t){return t.foldMap};var pu=function(t){return function(r){return mi()()()()(vo)(Lr(t)(Yf(r)))}};var We={dimap:function(t){return function(r){return function(e){return function(n){return r(e(t(n)))}}}}},fd=function(t){return t.dimap},Ue=function(t){return function(r){return fd(t)(r)(Et($t))}};var S_=function(t){return function(){return t}},h_=function(t){return function(r){return function(){return r(t())()}}};var _u=function(t){return function(r){return function(){for(var e=0,n=t.length;e<n;e++)r(t[e])()}}};var qe=function(t){return function(r){return function(e){return it(t.Bind1())(r)(function(n){return it(t.Bind1())(e)(function(u){return _(t.Applicative0())(n(u))})})}}};var E_=function(t,r,e){var n=0,u;return function(o){if(n===2)return u;if(n===1)throw new ReferenceError(t+" was needed before it finished initializing (module "+r+", line "+o+")",r,o);return n=1,u=e(),n=2,u}},ba={Applicative0:function(){return br},Bind1:function(){return Hu}},Hu={bind:h_,Apply0:function(){return nc(0)}},br={pure:S_,Apply0:function(){return nc(0)}},$_=E_("functorEffect","Effect",function(){return{map:eo(br)}}),nc=E_("applyEffect","Effect",function(){return{apply:qe(ba),Functor0:function(){return $_(0)}}}),L=$_(20),tr=nc(23);var pd=function(t){return t},bo=function(){function t(r){this.value0=r}return t.create=function(r){return new t(r)},t}(),Ao=function(){function t(r){this.value0=r}return t.create=function(r){return new t(r)},t}(),_d=function(t){return t},Di=Dn(),i=_d;var S=function(){return bo.create}();var N=function(){return Ao.create}(),fr=function(){var t=g(xu)(g(L)(C(!0)));return function(r){return pd(t(r))}}(),Z=function(t){return t.attr};function F_(t){return()=>t.slice()}function M_(t){return r=>e=>()=>{e[t]=r}}function x_(t){return()=>t.slice()}var w_=U;var I_=function(t){return function(r){return function(){return t(r())}}},L_=function(t){return function(){return t}},P_=function(t){return function(r){return function(){return r(t())()}}};function Wr(t){return function(){return{value:t}}}var Pr=function(t){return function(){return t.value}},O_=function(t){return function(r){return function(){var e=t(r.value);return r.value=e.state,e.value}}},Ye=function(t){return function(r){return function(){return r.value=t}}};var dn=function(t){return t};var An={map:function(t){return function(r){return t(r)}}};var R_={apply:function(t){return function(r){return t(r)}},Functor0:function(){return An}},Dd={bind:function(t){return function(r){return r(t)}},Apply0:function(){return R_}},bd={pure:dn,Apply0:function(){return R_}},sr={Applicative0:function(){return bd},Bind1:function(){return Dd}};var N_=function(t){return function(){return{value:t}}};var ae=function(t){return function(){return t.value}},H_=function(t){return function(r){return function(){var e=t(r.value);return r.value=e.state,e.value}}},Ae=function(t){return function(r){return function(){r.value=t}}};var ke=N_,Ad=H_,Bu=function(t){return Ad(function(r){var e=t(r);return{state:e,value:e}})},ko=function(t){return function(r){return at(L)(Bu(t)(r))}};var Sd=function(t,r,e){var n=0,u;return function(o){if(n===2)return u;if(n===1)throw new ReferenceError(t+" was needed before it finished initializing (module "+r+", line "+o+")",r,o);return n=1,u=e(),n=2,u}},hd=O_,Ur=function(t){return hd(function(r){var e=t(r);return{state:e,value:e}})},Ht={map:I_},bi={Applicative0:function(){return Lt},Bind1:function(){return Jn}},Jn={bind:P_,Apply0:function(){return ac(0)}},Lt={pure:L_,Apply0:function(){return ac(0)}},ac=Sd("applyST","Control.Monad.ST.Internal",function(){return{apply:qe(bi),Functor0:function(){return Ht}}}),da=ac(46);var W_={liftST:Et($t),Monad0:function(){return bi}},xe={liftST:w_,Monad0:function(){return ba}},ye=function(t){return t.liftST};var Ed=function(t){return function(r){if(t<1)return[];var e=new Array(t);return e.fill(r)}},$d=function(t){return function(r){for(var e=[],n=0,u=0;u<t;u++)e[n++]=r;return e}},oc=typeof Array.prototype.fill=="function"?Ed:$d,Fd=function(){function t(u,o){this.head=u,this.tail=o}var r={};function e(u){return function(o){return new t(u,o)}}function n(u){for(var o=[],c=0,l=u;l!==r;)o[c++]=l.head,l=l.tail;return o}return function(u){return function(o){return n(u(e)(r)(o))}}}(),kn=function(t){return t.length};var q_=function(t){return function(r){return function(e){return function(n){return n<0||n>=e.length?r:t(e[n])}}}},z_=function(t){return function(r){return function(e){return function(n){for(var u=0;u<n.length;u++){var o=e(n[u]);if(r(o))return o}return t}}}},V_=function(t){return function(r){return function(e){return function(n){for(var u=0,o=n.length;u<o;u++)if(e(n[u]))return t(u);return r}}}};var J_=function(t){return function(r){return function(e){return function(n){if(e<0||e>=n.length)return r;var u=n.slice();return u.splice(e,1),t(u)}}}};var yo=function(t){return function(r){return r.filter(t)}},di=function(t){return function(r){for(var e=[],n=[],u=0;u<r.length;u++){var o=r[u];t(o)?e.push(o):n.push(o)}return{yes:e,no:n}}};var Md=function(){function t(r,e,n,u,o,c){var l,m,s,b,d,v,a;for(l=o+(c-o>>1),l-o>1&&t(r,e,u,n,o,l),c-l>1&&t(r,e,u,n,l,c),m=o,s=l,b=o;m<l&&s<c;)d=u[m],v=u[s],a=e(r(d)(v)),a>0?(n[b++]=v,++s):(n[b++]=d,++m);for(;m<l;)n[b++]=u[m++];for(;s<c;)n[b++]=u[s++]}return function(r){return function(e){return function(n){var u;return n.length<2?n:(u=n.slice(0),t(r,e,u,n.slice(0),0,n.length),u)}}}}();var j_=function(t){return function(r){return t[r]}};function yn(){return[]}var ic=function(t){return function(r){return function(){return r.push.apply(r,t)}}};var Ai=function(t){return function(r){return function(e){return function(n){return function(){return n.splice.apply(n,[t,r].concat(e))}}}}},gn=function(t){return function(){return t}};function X_(t){return function(){return t.slice()}}var ki=X_,fc=X_,wd=function(){function t(r,e,n,u,o,c){var l,m,s,b,d,v,a;for(l=o+(c-o>>1),l-o>1&&t(r,e,u,n,o,l),c-l>1&&t(r,e,u,n,l,c),m=o,s=l,b=o;m<l&&s<c;)d=u[m],v=u[s],a=e(r(d)(v)),a>0?(n[b++]=v,++s):(n[b++]=d,++m);for(;m<l;)n[b++]=u[m++];for(;s<c;)n[b++]=u[s++]}return function(r){return function(e){return function(n){return function(){return n.length<2||t(r,e,n,n.slice(0),0,n.length),n}}}}}();var Y_=function(t){return function(r){return function(){var n=fc(r)();return t(n)(),gn(n)()}}};var ze=function(t){return ic([t])};var Pd=function(){function t(r,e){this.value0=r,this.value1=e}return t.create=function(r){return function(e){return new t(r,e)}},t}();var Od=function(t){return function(){var e=Pr(t.value1)();return Ur(function(n){return n+1|0})(t.value1)(),t.value0(e)}};var gi=function(t){return g(Ht)(Pd.create(t))(Wr(0))},Ci=function(t){return function(r){return function(){for(var n=Wr(!1)();g(Ht)(Be(ue))(Pr(n))();)(function(){var o=Od(t)();if(o instanceof k)return r(o.value0)();if(o instanceof I)return at(Ht)(Ye(!0)(n))();throw new Error("Failed pattern match at Data.Array.ST.Iterator (line 42, column 5 - line 44, column 47): "+[o.constructor.name])})();return{}}}};var ts=function(){function t(u){return[u]}function r(u){return function(o){return[u,o]}}function e(u){return function(o){return function(c){return[u,o,c]}}}function n(u){return function(o){return u.concat(o)}}return function(u){return function(o){return function(c){return function(l){return function(m){function s(b,d){switch(d-b){case 0:return c([]);case 1:return o(t)(l(m[b]));case 2:return u(o(r)(l(m[b])))(l(m[b+1]));case 3:return u(u(o(e)(l(m[b])))(l(m[b+1])))(l(m[b+2]));default:var v=b+Math.floor((d-b)/4)*2;return u(o(n)(s(b,v)))(s(v,d))}}return s(0,m.length)}}}}}}();var ge=function(t){return t.traverse};var mA=function(t){return function(r){return ge(t)(r)(Et($t))}},Xn={traverse:function(t){return ts(It(t.Apply0()))(g(t.Apply0().Functor0()))(_(t))},sequence:function(t){return mA(Xn)(t)},Functor0:function(){return Dr},Foldable1:function(){return Dt}};var vs=function(){return j_};var Mi=function(t){return function(r){return Y_(ze(r))(t)()}},ms=function(t){return[t]};var qu=function(){return q_(k.create)(I.value)}(),dc=function(t){return qu(t)(kn(t)-1|0)};var xi=function(){return z_(I.value)(oa)}();var Ac=function(){return V_(k.create)(I.value)}();var kc=function(t){return function(r){return g(_r)(vs()(r))(Ac(t)(r))}};var Ds=function(){return J_(k.create)(I.value)}(),ga=function(t){return function(r){return function(e){return e.length===0?[]:Xt(e)(function(n){return De()(Ds(n)(e))})(Ac(t(r))(e))}}};var Co=function(t){return function(r){return B(or)([t])(r)}};var wA=kr(it(ai)),yc=function(t){return wA(function(){var r=Xt([])(ms);return function(e){return r(t(e))}}())};var bs=function(t){return function(r){for(var e=r.length,n=Array(e),u=0;u<e;u++)n[u]=t(u)(r[u]);return n}};var su=function(t){return t.mapWithIndex};var Ca={mapWithIndex:bs,Functor0:function(){return Dr}};var Cn=function(t){return t.foldrWithIndex};var Ve=function(t){return t.foldlWithIndex};var Kn=function(t){return t.foldMapWithIndex};var Tn=function(){function t(r,e){this.value0=r,this.value1=e}return t.create=function(r){return function(e){return new t(r,e)}},t}();var Ii=function(t){return function(r){return new Tn(r,A(t))}};var Tr=function(){function t(){}return t.value=new t,t}(),At=function(){function t(r,e){this.value0=r,this.value1=e}return t.create=function(r){return function(e){return new t(r,e)}},t}(),Li=function(t){return t},JA=function(t){return new At(t.value0,t.value1)};var jA=function(t){var r=function(e){return function(n){var u=e,o=!1,c;function l(m,s){if(s instanceof At&&s.value1 instanceof At&&s.value1.value1 instanceof At){u=new At(s,m),n=s.value1.value1.value1;return}var b=function(v){return v instanceof At&&v.value1 instanceof At&&v.value1.value1 instanceof Tr?new At(t(v.value0),new At(t(v.value1.value0),Tr.value)):v instanceof At&&v.value1 instanceof Tr?new At(t(v.value0),Tr.value):Tr.value},d=function(v){return function(a){var y=v,K=!1,vt;function Jt(lr,Rn){if(lr instanceof At&&lr.value0 instanceof At&&lr.value0.value1 instanceof At&&lr.value0.value1.value1 instanceof At){y=lr.value1,a=new At(t(lr.value0.value0),new At(t(lr.value0.value1.value0),new At(t(lr.value0.value1.value1.value0),Rn)));return}return K=!0,Rn}for(;!K;)vt=Jt(y,a);return vt}};return o=!0,d(m)(b(s))}for(;!o;)c=l(u,n);return c}};return r(Tr.value)},Cc={map:jA};var Je={foldr:function(t){return function(r){var e=function(){var u=function(o){return function(c){var l=o,m=!1,s;function b(d,v){if(v instanceof Tr)return m=!0,d;if(v instanceof At){l=new At(v.value0,d),c=v.value1;return}throw new Error("Failed pattern match at Data.List.Types (line 107, column 7 - line 107, column 23): "+[d.constructor.name,v.constructor.name])}for(;!m;)s=b(l,c);return s}};return u(Tr.value)}(),n=ur(Je)(kr(t))(r);return function(u){return n(e(u))}}},foldl:function(t){var r=function(e){return function(n){var u=e,o=!1,c;function l(m,s){if(s instanceof Tr)return o=!0,m;if(s instanceof At){u=t(m)(s.value0),n=s.value1;return}throw new Error("Failed pattern match at Data.List.Types (line 111, column 12 - line 113, column 30): "+[s.constructor.name])}for(;!o;)c=l(u,n);return c}};return r},foldMap:function(t){return function(r){return ur(Je)(function(e){var n=B(t.Semigroup0())(e);return function(u){return n(r(u))}})(Pt(t))}}};var To={append:function(t){return function(r){return nr(Je)(At.create)(r)(t)}}};var Tc={append:function(t){return function(r){return new Tn(t.value0,B(To)(t.value1)(JA(r)))}}};var ks={alt:B(To),Functor0:function(){return Cc}},Sc=function(){return{empty:Tr.value,Alt0:function(){return ks}}}();var hs=function(t){return t()};var Es=function(t){throw new Error(t)};var $s=function(){return Es};var _k=hs,Du=function(t){return _k(function(){return $s()(t)})};var tt=function(){function t(){}return t.value=new t,t}(),st=function(){function t(r,e,n,u){this.value0=r,this.value1=e,this.value2=n,this.value3=u}return t.create=function(r){return function(e){return function(n){return function(u){return new t(r,e,n,u)}}}},t}(),Ot=function(){function t(r,e,n,u,o,c,l){this.value0=r,this.value1=e,this.value2=n,this.value3=u,this.value4=o,this.value5=c,this.value6=l}return t.create=function(r){return function(e){return function(n){return function(u){return function(o){return function(c){return function(l){return new t(r,e,n,u,o,c,l)}}}}}}},t}(),bu=function(){function t(r,e,n){this.value0=r,this.value1=e,this.value2=n}return t.create=function(r){return function(e){return function(n){return new t(r,e,n)}}},t}(),Qn=function(){function t(r,e,n){this.value0=r,this.value1=e,this.value2=n}return t.create=function(r){return function(e){return function(n){return new t(r,e,n)}}},t}(),du=function(){function t(r,e,n,u,o,c){this.value0=r,this.value1=e,this.value2=n,this.value3=u,this.value4=o,this.value5=c}return t.create=function(r){return function(e){return function(n){return function(u){return function(o){return function(c){return new t(r,e,n,u,o,c)}}}}}},t}(),hn=function(){function t(r,e,n,u,o,c){this.value0=r,this.value1=e,this.value2=n,this.value3=u,this.value4=o,this.value5=c}return t.create=function(r){return function(e){return function(n){return function(u){return function(o){return function(c){return new t(r,e,n,u,o,c)}}}}}},t}(),Au=function(){function t(r,e,n,u,o,c){this.value0=r,this.value1=e,this.value2=n,this.value3=u,this.value4=o,this.value5=c}return t.create=function(r){return function(e){return function(n){return function(u){return function(o){return function(c){return new t(r,e,n,u,o,c)}}}}}},t}(),Oi=function(){function t(r,e,n,u){this.value0=r,this.value1=e,this.value2=n,this.value3=u}return t.create=function(r){return function(e){return function(n){return function(u){return new t(r,e,n,u)}}}},t}();var xs=function(t){return function(r){return new st(tt.value,t,r,tt.value)}};var Sa=function(t){return function(r){var e=Ct(t),n=function(u){var o=!1,c;function l(m){if(m instanceof tt)return o=!0,I.value;if(m instanceof st){var s=e(r)(m.value1);if(s instanceof St)return o=!0,new k(m.value2);if(s instanceof dt){u=m.value0;return}u=m.value3;return}if(m instanceof Ot){var b=e(r)(m.value1);if(b instanceof St)return o=!0,new k(m.value2);var d=e(r)(m.value4);if(d instanceof St)return o=!0,new k(m.value5);if(b instanceof dt){u=m.value0;return}if(d instanceof Tt){u=m.value6;return}u=m.value3;return}throw new Error("Failed pattern match at Data.Map.Internal (line 241, column 5 - line 241, column 22): "+[m.constructor.name])}for(;!o;)c=l(u);return c};return n}};var Fr=function(t){return function(r){return function(e){var n=t,u=r,o=!1,c;function l(m,s,b){if(s instanceof Tr)return o=!0,b;if(s instanceof At){if(s.value0 instanceof bu){n=m,u=s.value1,e=new st(b,s.value0.value0,s.value0.value1,s.value0.value2);return}if(s.value0 instanceof Qn){n=m,u=s.value1,e=new st(s.value0.value0,s.value0.value1,s.value0.value2,b);return}if(s.value0 instanceof du){n=m,u=s.value1,e=new Ot(b,s.value0.value0,s.value0.value1,s.value0.value2,s.value0.value3,s.value0.value4,s.value0.value5);return}if(s.value0 instanceof hn){n=m,u=s.value1,e=new Ot(s.value0.value0,s.value0.value1,s.value0.value2,b,s.value0.value3,s.value0.value4,s.value0.value5);return}if(s.value0 instanceof Au){n=m,u=s.value1,e=new Ot(s.value0.value0,s.value0.value1,s.value0.value2,s.value0.value3,s.value0.value4,s.value0.value5,b);return}throw new Error("Failed pattern match at Data.Map.Internal (line 462, column 3 - line 467, column 88): "+[s.value0.constructor.name])}throw new Error("Failed pattern match at Data.Map.Internal (line 459, column 1 - line 459, column 80): "+[s.constructor.name,b.constructor.name])}for(;!o;)c=l(n,u,e);return c}}},Ni=function(t){return function(r){return function(e){var n=function(c){return function(l){var m=c,s=!1,b;function d(v,a){if(v instanceof Tr)return s=!0,new st(a.value0,a.value1,a.value2,a.value3);if(v instanceof At){if(v.value0 instanceof bu)return s=!0,Fr(t)(v.value1)(new Ot(a.value0,a.value1,a.value2,a.value3,v.value0.value0,v.value0.value1,v.value0.value2));if(v.value0 instanceof Qn)return s=!0,Fr(t)(v.value1)(new Ot(v.value0.value0,v.value0.value1,v.value0.value2,a.value0,a.value1,a.value2,a.value3));if(v.value0 instanceof du){m=v.value1,l=new Oi(new st(a.value0,a.value1,a.value2,a.value3),v.value0.value0,v.value0.value1,new st(v.value0.value2,v.value0.value3,v.value0.value4,v.value0.value5));return}if(v.value0 instanceof hn){m=v.value1,l=new Oi(new st(v.value0.value0,v.value0.value1,v.value0.value2,a.value0),a.value1,a.value2,new st(a.value3,v.value0.value3,v.value0.value4,v.value0.value5));return}if(v.value0 instanceof Au){m=v.value1,l=new Oi(new st(v.value0.value0,v.value0.value1,v.value0.value2,v.value0.value3),v.value0.value4,v.value0.value5,new st(a.value0,a.value1,a.value2,a.value3));return}throw new Error("Failed pattern match at Data.Map.Internal (line 498, column 5 - line 503, column 108): "+[v.value0.constructor.name,a.constructor.name])}throw new Error("Failed pattern match at Data.Map.Internal (line 495, column 3 - line 495, column 56): "+[v.constructor.name,a.constructor.name])}for(;!s;)b=d(m,l);return b}},u=Ct(t),o=function(c){return function(l){var m=c,s=!1,b;function d(v,a){if(a instanceof tt)return s=!0,n(v)(new Oi(tt.value,r,e,tt.value));if(a instanceof st){var y=u(r)(a.value1);if(y instanceof St)return s=!0,Fr(t)(v)(new st(a.value0,r,e,a.value3));if(y instanceof dt){m=new At(new bu(a.value1,a.value2,a.value3),v),l=a.value0;return}m=new At(new Qn(a.value0,a.value1,a.value2),v),l=a.value3;return}if(a instanceof Ot){var K=u(r)(a.value1);if(K instanceof St)return s=!0,Fr(t)(v)(new Ot(a.value0,r,e,a.value3,a.value4,a.value5,a.value6));var vt=u(r)(a.value4);if(vt instanceof St)return s=!0,Fr(t)(v)(new Ot(a.value0,a.value1,a.value2,a.value3,r,e,a.value6));if(K instanceof dt){m=new At(new du(a.value1,a.value2,a.value3,a.value4,a.value5,a.value6),v),l=a.value0;return}if(K instanceof Tt&&vt instanceof dt){m=new At(new hn(a.value0,a.value1,a.value2,a.value4,a.value5,a.value6),v),l=a.value3;return}m=new At(new Au(a.value0,a.value1,a.value2,a.value3,a.value4,a.value5),v),l=a.value6;return}throw new Error("Failed pattern match at Data.Map.Internal (line 478, column 3 - line 478, column 55): "+[v.constructor.name,a.constructor.name])}for(;!s;)b=d(m,l);return b}};return o(Tr.value)}}},Ak=function(t){return function(r){var e=function(l){return function(m){var s=l,b=!1,d;function v(a,y){if(a instanceof Tr)return b=!0,y;if(a instanceof At){if(a.value0 instanceof bu&&a.value0.value2 instanceof tt&&y instanceof tt)return b=!0,Fr(t)(a.value1)(new st(tt.value,a.value0.value0,a.value0.value1,tt.value));if(a.value0 instanceof Qn&&a.value0.value0 instanceof tt&&y instanceof tt)return b=!0,Fr(t)(a.value1)(new st(tt.value,a.value0.value1,a.value0.value2,tt.value));if(a.value0 instanceof bu&&a.value0.value2 instanceof st){s=a.value1,m=new Ot(y,a.value0.value0,a.value0.value1,a.value0.value2.value0,a.value0.value2.value1,a.value0.value2.value2,a.value0.value2.value3);return}if(a.value0 instanceof Qn&&a.value0.value0 instanceof st){s=a.value1,m=new Ot(a.value0.value0.value0,a.value0.value0.value1,a.value0.value0.value2,a.value0.value0.value3,a.value0.value1,a.value0.value2,y);return}return a.value0 instanceof bu&&a.value0.value2 instanceof Ot?(b=!0,Fr(t)(a.value1)(new st(new st(y,a.value0.value0,a.value0.value1,a.value0.value2.value0),a.value0.value2.value1,a.value0.value2.value2,new st(a.value0.value2.value3,a.value0.value2.value4,a.value0.value2.value5,a.value0.value2.value6)))):a.value0 instanceof Qn&&a.value0.value0 instanceof Ot?(b=!0,Fr(t)(a.value1)(new st(new st(a.value0.value0.value0,a.value0.value0.value1,a.value0.value0.value2,a.value0.value0.value3),a.value0.value0.value4,a.value0.value0.value5,new st(a.value0.value0.value6,a.value0.value1,a.value0.value2,y)))):a.value0 instanceof du&&a.value0.value2 instanceof tt&&a.value0.value5 instanceof tt&&y instanceof tt?(b=!0,Fr(t)(a.value1)(new Ot(tt.value,a.value0.value0,a.value0.value1,tt.value,a.value0.value3,a.value0.value4,tt.value))):a.value0 instanceof hn&&a.value0.value0 instanceof tt&&a.value0.value5 instanceof tt&&y instanceof tt?(b=!0,Fr(t)(a.value1)(new Ot(tt.value,a.value0.value1,a.value0.value2,tt.value,a.value0.value3,a.value0.value4,tt.value))):a.value0 instanceof Au&&a.value0.value0 instanceof tt&&a.value0.value3 instanceof tt&&y instanceof tt?(b=!0,Fr(t)(a.value1)(new Ot(tt.value,a.value0.value1,a.value0.value2,tt.value,a.value0.value4,a.value0.value5,tt.value))):a.value0 instanceof du&&a.value0.value2 instanceof st?(b=!0,Fr(t)(a.value1)(new st(new Ot(y,a.value0.value0,a.value0.value1,a.value0.value2.value0,a.value0.value2.value1,a.value0.value2.value2,a.value0.value2.value3),a.value0.value3,a.value0.value4,a.value0.value5))):a.value0 instanceof hn&&a.value0.value0 instanceof st?(b=!0,Fr(t)(a.value1)(new st(new Ot(a.value0.value0.value0,a.value0.value0.value1,a.value0.value0.value2,a.value0.value0.value3,a.value0.value1,a.value0.value2,y),a.value0.value3,a.value0.value4,a.value0.value5))):a.value0 instanceof hn&&a.value0.value5 instanceof st?(b=!0,Fr(t)(a.value1)(new st(a.value0.value0,a.value0.value1,a.value0.value2,new Ot(y,a.value0.value3,a.value0.value4,a.value0.value5.value0,a.value0.value5.value1,a.value0.value5.value2,a.value0.value5.value3)))):a.value0 instanceof Au&&a.value0.value3 instanceof st?(b=!0,Fr(t)(a.value1)(new st(a.value0.value0,a.value0.value1,a.value0.value2,new Ot(a.value0.value3.value0,a.value0.value3.value1,a.value0.value3.value2,a.value0.value3.value3,a.value0.value4,a.value0.value5,y)))):a.value0 instanceof du&&a.value0.value2 instanceof Ot?(b=!0,Fr(t)(a.value1)(new Ot(new st(y,a.value0.value0,a.value0.value1,a.value0.value2.value0),a.value0.value2.value1,a.value0.value2.value2,new st(a.value0.value2.value3,a.value0.value2.value4,a.value0.value2.value5,a.value0.value2.value6),a.value0.value3,a.value0.value4,a.value0.value5))):a.value0 instanceof hn&&a.value0.value0 instanceof Ot?(b=!0,Fr(t)(a.value1)(new Ot(new st(a.value0.value0.value0,a.value0.value0.value1,a.value0.value0.value2,a.value0.value0.value3),a.value0.value0.value4,a.value0.value0.value5,new st(a.value0.value0.value6,a.value0.value1,a.value0.value2,y),a.value0.value3,a.value0.value4,a.value0.value5))):a.value0 instanceof hn&&a.value0.value5 instanceof Ot?(b=!0,Fr(t)(a.value1)(new Ot(a.value0.value0,a.value0.value1,a.value0.value2,new st(y,a.value0.value3,a.value0.value4,a.value0.value5.value0),a.value0.value5.value1,a.value0.value5.value2,new st(a.value0.value5.value3,a.value0.value5.value4,a.value0.value5.value5,a.value0.value5.value6)))):a.value0 instanceof Au&&a.value0.value3 instanceof Ot?(b=!0,Fr(t)(a.value1)(new Ot(a.value0.value0,a.value0.value1,a.value0.value2,new st(a.value0.value3.value0,a.value0.value3.value1,a.value0.value3.value2,a.value0.value3.value3),a.value0.value3.value4,a.value0.value3.value5,new st(a.value0.value3.value6,a.value0.value4,a.value0.value5,y)))):(b=!0,Du("The impossible happened in partial function `up`."))}throw new Error("Failed pattern match at Data.Map.Internal (line 552, column 5 - line 573, column 86): "+[a.constructor.name])}for(;!b;)d=v(s,m);return d}},n=function(l){return function(m){var s=l,b=!1,d;function v(a,y){if(y instanceof st&&y.value0 instanceof tt&&y.value3 instanceof tt)return b=!0,e(a)(tt.value);if(y instanceof st){s=new At(new Qn(y.value0,y.value1,y.value2),a),m=y.value3;return}if(y instanceof Ot&&y.value0 instanceof tt&&y.value3 instanceof tt&&y.value6 instanceof tt)return b=!0,e(new At(new Qn(tt.value,y.value1,y.value2),a))(tt.value);if(y instanceof Ot){s=new At(new Au(y.value0,y.value1,y.value2,y.value3,y.value4,y.value5),a),m=y.value6;return}return b=!0,Du("The impossible happened in partial function `removeMaxNode`.")}for(;!b;)d=v(s,m);return d}},u=function(l){var m=!1,s;function b(d){if(d instanceof st&&d.value3 instanceof tt)return m=!0,{key:d.value1,value:d.value2};if(d instanceof st){l=d.value3;return}if(d instanceof Ot&&d.value6 instanceof tt)return m=!0,{key:d.value4,value:d.value5};if(d instanceof Ot){l=d.value6;return}return m=!0,Du("The impossible happened in partial function `maxNode`.")}for(;!m;)s=b(l);return s},o=Ct(t),c=function(l){return function(m){var s=l,b=!1,d;function v(a,y){if(y instanceof tt)return b=!0,I.value;if(y instanceof st){var K=o(r)(y.value1);if(y.value3 instanceof tt&&K instanceof St)return b=!0,new k(new H(y.value2,e(a)(tt.value)));if(K instanceof St){var vt=u(y.value0);return b=!0,new k(new H(y.value2,n(new At(new bu(vt.key,vt.value,y.value3),a))(y.value0)))}if(K instanceof dt){s=new At(new bu(y.value1,y.value2,y.value3),a),m=y.value0;return}s=new At(new Qn(y.value0,y.value1,y.value2),a),m=y.value3;return}if(y instanceof Ot){var Jt=function(){return y.value0 instanceof tt&&y.value3 instanceof tt&&y.value6 instanceof tt}(),K=o(r)(y.value4),lr=o(r)(y.value1);if(Jt&&lr instanceof St)return b=!0,new k(new H(y.value2,Fr(t)(a)(new st(tt.value,y.value4,y.value5,tt.value))));if(Jt&&K instanceof St)return b=!0,new k(new H(y.value5,Fr(t)(a)(new st(tt.value,y.value1,y.value2,tt.value))));if(lr instanceof St){var vt=u(y.value0);return b=!0,new k(new H(y.value2,n(new At(new du(vt.key,vt.value,y.value3,y.value4,y.value5,y.value6),a))(y.value0)))}if(K instanceof St){var vt=u(y.value3);return b=!0,new k(new H(y.value5,n(new At(new hn(y.value0,y.value1,y.value2,vt.key,vt.value,y.value6),a))(y.value3)))}if(lr instanceof dt){s=new At(new du(y.value1,y.value2,y.value3,y.value4,y.value5,y.value6),a),m=y.value0;return}if(lr instanceof Tt&&K instanceof dt){s=new At(new hn(y.value0,y.value1,y.value2,y.value4,y.value5,y.value6),a),m=y.value3;return}s=new At(new Au(y.value0,y.value1,y.value2,y.value3,y.value4,y.value5),a),m=y.value6;return}throw new Error("Failed pattern match at Data.Map.Internal (line 525, column 16 - line 548, column 80): "+[y.constructor.name])}for(;!b;)d=v(s,m);return d}};return c(Tr.value)}},oe={foldr:function(t){return function(r){return function(e){if(e instanceof tt)return r;if(e instanceof st)return nr(oe)(t)(t(e.value2)(nr(oe)(t)(r)(e.value3)))(e.value0);if(e instanceof Ot)return nr(oe)(t)(t(e.value2)(nr(oe)(t)(t(e.value5)(nr(oe)(t)(r)(e.value6)))(e.value3)))(e.value0);throw new Error("Failed pattern match at Data.Map.Internal (line 133, column 17 - line 136, column 85): "+[e.constructor.name])}}},foldl:function(t){return function(r){return function(e){if(e instanceof tt)return r;if(e instanceof st)return ur(oe)(t)(t(ur(oe)(t)(r)(e.value0))(e.value2))(e.value3);if(e instanceof Ot)return ur(oe)(t)(t(ur(oe)(t)(t(ur(oe)(t)(r)(e.value0))(e.value2))(e.value3))(e.value5))(e.value6);throw new Error("Failed pattern match at Data.Map.Internal (line 137, column 17 - line 140, column 85): "+[e.constructor.name])}}},foldMap:function(t){return function(r){return function(e){if(e instanceof tt)return Pt(t);if(e instanceof st)return B(t.Semigroup0())(Lr(oe)(t)(r)(e.value0))(B(t.Semigroup0())(r(e.value2))(Lr(oe)(t)(r)(e.value3)));if(e instanceof Ot)return B(t.Semigroup0())(Lr(oe)(t)(r)(e.value0))(B(t.Semigroup0())(r(e.value2))(B(t.Semigroup0())(Lr(oe)(t)(r)(e.value3))(B(t.Semigroup0())(r(e.value5))(Lr(oe)(t)(r)(e.value6)))));throw new Error("Failed pattern match at Data.Map.Internal (line 141, column 17 - line 144, column 93): "+[e.constructor.name])}}}},qr={foldrWithIndex:function(t){return function(r){return function(e){if(e instanceof tt)return r;if(e instanceof st)return Cn(qr)(t)(t(e.value1)(e.value2)(Cn(qr)(t)(r)(e.value3)))(e.value0);if(e instanceof Ot)return Cn(qr)(t)(t(e.value1)(e.value2)(Cn(qr)(t)(t(e.value4)(e.value5)(Cn(qr)(t)(r)(e.value6)))(e.value3)))(e.value0);throw new Error("Failed pattern match at Data.Map.Internal (line 147, column 26 - line 150, column 120): "+[e.constructor.name])}}},foldlWithIndex:function(t){return function(r){return function(e){if(e instanceof tt)return r;if(e instanceof st)return Ve(qr)(t)(t(e.value1)(Ve(qr)(t)(r)(e.value0))(e.value2))(e.value3);if(e instanceof Ot)return Ve(qr)(t)(t(e.value4)(Ve(qr)(t)(t(e.value1)(Ve(qr)(t)(r)(e.value0))(e.value2))(e.value3))(e.value5))(e.value6);throw new Error("Failed pattern match at Data.Map.Internal (line 151, column 26 - line 154, column 120): "+[e.constructor.name])}}},foldMapWithIndex:function(t){return function(r){return function(e){if(e instanceof tt)return Pt(t);if(e instanceof st)return B(t.Semigroup0())(Kn(qr)(t)(r)(e.value0))(B(t.Semigroup0())(r(e.value1)(e.value2))(Kn(qr)(t)(r)(e.value3)));if(e instanceof Ot)return B(t.Semigroup0())(Kn(qr)(t)(r)(e.value0))(B(t.Semigroup0())(r(e.value1)(e.value2))(B(t.Semigroup0())(Kn(qr)(t)(r)(e.value3))(B(t.Semigroup0())(r(e.value4)(e.value5))(Kn(qr)(t)(r)(e.value6)))));throw new Error("Failed pattern match at Data.Map.Internal (line 155, column 26 - line 158, column 128): "+[e.constructor.name])}}},Foldable0:function(){return oe}},ws=function(){return Cn(qr)(function(t){return function(r){return function(e){return new At(t,e)}}})(Tr.value)}();var En=function(){return tt.value}();var xc=function(t){return function(r){return function(e){return Xt(e)(Br)(Ak(t)(r)(e))}}};var $n=function(t){return function(r){return function(e){return function(n){var u=r(Sa(t)(e)(n));if(u instanceof I)return xc(t)(e)(n);if(u instanceof k)return Ni(t)(e)(u.value0)(n);throw new Error("Failed pattern match at Data.Map.Internal (line 596, column 15 - line 598, column 25): "+[u.constructor.name])}}}};var kk=function(t){return function(r){return function(e){return function(n){var u=function(o){return function(c){return function(l){return $n(t)(function(){var m=Xt(l)(r(l));return function(s){return k.create(m(s))}}())(o)(c)}}};return Ve(qr)(u)(n)(e)}}}};var Is=function(t){return kk(t)(C)};var Ls={compact:function(t){return function(){var e=yn(),n=gi(function(u){return qu(t)(u)})();return Ci(n)(function(){var u=at(Ht);return function(o){return u(function(c){if(c instanceof I)return _(Lt)(0);if(c instanceof k)return ze(c.value0)(e);throw new Error("Failed pattern match at Data.Compactable (line 111, column 34 - line 113, column 35): "+[c.constructor.name])}(o))}}())(),gn(e)()}()},separate:function(t){return function(){var e=yn(),n=yn(),u=gi(function(o){return qu(t)(o)})();return Ci(u)(function(){var o=at(Ht);return function(c){return o(function(l){if(l instanceof ut)return ze(l.value0)(e);if(l instanceof et)return ze(l.value0)(n);throw new Error("Failed pattern match at Data.Compactable (line 122, column 34 - line 124, column 31): "+[l.constructor.name])}(c))}}())(),It(da)(g(Ht)(function(o){return function(c){return{left:o,right:c}}})(gn(e)))(gn(n))()}()}};var Ju=function(t){return t.compact};var Ps={partitionMap:function(t){var r=function(e){return function(n){var u=t(n);if(u instanceof ut)return{left:B(or)(e.left)([u.value0]),right:e.right};if(u instanceof et)return{right:B(or)(e.right)([u.value0]),left:e.left};throw new Error("Failed pattern match at Data.Filterable (line 149, column 16 - line 151, column 50): "+[u.constructor.name])}};return ur(Dt)(r)({left:[],right:[]})},partition:di,filterMap:yc,filter:yo,Compactable0:function(){return Ls},Functor1:function(){return Dr}};var se=function(t){return t.filterMap};var Os=function(t){return t.filter};var Ek=function(t){return function(r){return function(e){return Is(t)(r)(e)}}};var wc=function(t){return ws(t)};var Ns=function(t){return xs(t)(void 0)};var Ic=function(t){return{append:Ek(t)}};var Hs={foldMap:function(t){return function(r){var e=Lr(Je)(t)(r);return function(n){return e(wc(n))}}},foldl:function(t){return function(r){var e=ur(Je)(t)(r);return function(n){return e(wc(n))}}},foldr:function(t){return function(r){var e=nr(Je)(t)(r);return function(n){return e(wc(n))}}}};var $k=En;var Bs=function(t){return{mempty:$k,Semigroup0:function(){return Ic(t)}}};var Ws=function(t){return function(r){return function(e){return xc(t)(r)(e)}}};function Us(t){return function(r){return function(){return setTimeout(r,t)}}}function qs(t){return function(){clearTimeout(t)}}var zs=Us;var xk={eq:function(t){return function(r){return t===r}}},Bi={compare:function(t){return function(r){return Ct(pe)(t)(r)}},Eq0:function(){return xk}};var Vs=qs;var ju=function(r){return function(e){return r(e)()}};var Xu=function(t){return t.keepLatest};var ku=function(t){return t.fold};var Gu=function(t){return function(r){return function(e){return function(n){return se(t.Filterable1())(Br)(ku(t)(function(u){return function(o){return g(Ou)(_(Hr))(r(u)(o.value0))}})(e)(new H(n,I.value)))}}}};function Oc(t){return function(r){return t===r}}var Eo=Oc;var Ks=function(t,r,e){var n=0,u;return function(o){if(n===2)return u;if(n===1)throw new ReferenceError(t+" was needed before it finished initializing (module "+r+", line "+o+")",r,o);return n=1,u=e(),n=2,u}};var Yk=function(t){return function(r){return function(e,n){var u=ke(I.value)(),o=t(e,function(l){return Ae(new k(l))(u)()}),c=r(e,function(l){var m=ae(u)();return Ir(br)(Kr)(m)(function(s){return function(){return n(l(s))}})()});return function(){return o(),c()}}}},Zk=function(t){return function(r,e){var n=ke(_(br)(void 0))(),u=t(r,function(o){var c=ae(n)();c();var l=o(r,e);return Ae(l)(n)()});return function(){var c=ae(n)();return c(),u()}}},Qt={map:function(t){return function(r){return function(e,n){return r(e,function(u){return n(t(u))})}}}},ty=function(t){return function(r){return function(e){return function(n,u){var o=ke(e)();return r(n,function(c){var l=Bu(t(c))(o)();return u(l)})}}}},$o=function(t){return function(r){return function(e,n){return r(e,function(u){var o=t(u);if(o instanceof k)return n(o.value0);if(o instanceof I)return void 0;throw new Error("Failed pattern match at FRP.Event (line 203, column 31 - line 205, column 35): "+[o.constructor.name])})}}},Rc=function(t){return $o(function(r){var e=t(r);if(e)return new k(r);if(!e)return I.value;throw new Error("Failed pattern match at FRP.Event (line 118, column 13 - line 120, column 25): "+[e.constructor.name])})},Qs=function(){var r=ke([])();return{event:function(e,n){return ko(function(u){return B(or)(u)([n])})(r)(),function(){return Bu(ga(Eo)(n))(r)(),void 0}},push:function(e){var n=ae(r)();return _u(n)(function(u){return function(){return u(e)}})()}}},ry=function(t){return function(r,e){var n=Qs(),u=t(n.event),o=u.input(r,n.push),c=u.output(r,e);return function(){return o(),c()}}},Fo={compact:$o(Et($t)),separate:function(t){return{left:$o(function(r){if(r instanceof ut)return new k(r.value0);if(r instanceof et)return I.value;throw new Error("Failed pattern match at FRP.Event (line 101, column 13 - line 103, column 33): "+[r.constructor.name])})(t),right:$o(function(r){if(r instanceof et)return new k(r.value0);if(r instanceof ut)return I.value;throw new Error("Failed pattern match at FRP.Event (line 108, column 13 - line 110, column 32): "+[r.constructor.name])})(t)}}},nn={filter:Rc,filterMap:$o,partition:function(t){return function(r){return{yes:Rc(t)(r),no:Rc(function(){var e=Be(ue);return function(n){return e(t(n))}}())(r)}}},partitionMap:function(t){return function(r){return{left:se(nn)(function(){var e=He(k.create)(C(I.value));return function(n){return e(t(n))}}())(r),right:se(nn)(function(e){return jf(t(e))})(r)}}},Compactable0:function(){return Fo},Functor1:function(){return Qt}},ey=function(t){return function(r){return function(e,n){var u=ke(I.value)(),o=ye(xe)(yn)(),c=ke(I.value)(),l=ye(xe)(yn)(),m=ke(!0)(),s=t(e,function(a){var y=ae(m)();if(y)return at(L)(ye(xe)(ze(a)(o)))();Ae(new k(a))(u)();var K=ae(c)();return Ir(br)(Kr)(K)(function(vt){return function(){return n(vt(a))}})()}),b=r(e,function(a){var y=ae(m)();if(y)return at(L)(ye(xe)(ze(a)(l)))();Ae(new k(a))(c)();var K=ae(u)();return Ir(br)(Kr)(K)(function(vt){return function(){return n(a(vt))}})()});Ae(!1)(m)();var d=ye(xe)(ki(o))(),v=ye(xe)(ki(l))();return function(){return d.length===0?Ae(dc(v))(c)():_u(d)(function(a){return function(){return Ae(new k(a))(u)(),_u(v)(function(K){return function(){return Ae(new k(K))(c)(),n(K(a))}})()}})()}(),ye(xe)(Ai(0)(kn(d))([])(o))(),ye(xe)(Ai(0)(kn(v))([])(l))(),function(){return s(),b()}}}},Hc=function(t){return function(r){return r}(Bc(304).subscribe)(t)},Bc=Ks("backdoor","FRP.Event",function(){return{makeEvent:function(){var t=function(r){return function(e,n){return e?_(br)(void 0):r(function(u){return function(){return n(u)}})()}};return t}(),makePureEvent:function(){var t=function(r){return function(e,n){return r(function(u){return function(){return n(u)}})()}};return t}(),makeLemmingEvent:function(){var t=function(r){return function(e,n){var u=function(o){return function(c){return function(){return o(e,ju(c))}}};return r(u)(function(o){return function(){return n(o)}})()}};return t}(),create:function(){var t=function(){var e=ke([])();return{event:function(n,u){return ko(function(o){return B(or)(o)([u])})(e)(),function(){return Bu(ga(Eo)(u))(e)(),void 0}},push:function(n){return function(){var o=ae(e)();return _u(o)(function(c){return function(){return c(n)}})()}}}};return t}(),createPure:function(){var t=function(){var e=Wr([])();return{event:function(n,u){return ye(xe)(function(){return at(Ht)(Ur(function(c){return B(or)(c)([u])})(e))(),ye(xe)(function(){return Ur(ga(Eo)(u))(e)(),void 0})})()},push:function(n){return function(){var o=Pr(e)();return _u(o)(function(c){return function(){return c(n)}})()}}}};return t}(),subscribe:function(){var t=function(r){return function(e){return function(){return r(!1,ju(e))}}};return t}(),subscribePure:function(){var t=function(){var r=function(e){return function(n){return function(){return e(!0,ju(n))}}};return r}();return t}(),bus:function(){var t=function(r){return function(e,n){var u=Nc(624)();return n(r(u.push)(u.event)),_(br)(void 0)}};return t}(),memoize:function(){var t=function(r){return function(e){return function(n,u){var o=Qs();return u(e(o.event)),r(n,o.push)}}};return t}(),hot:function(){var t=function(r){return function(){var n=Nc(642)(),u=Hc(r)(n.push)();return{event:n.event,unsubscribe:u}}};return t}(),mailboxed:function(){var t=function(r){return function(e){return function(n){return function(u,o){var c=ke(En)();o(n(function(m){return function(s,b){return at(L)(Bu($n(r)(function(d){if(d instanceof I)return new k([b]);if(d instanceof k)return new k(B(or)(d.value0)([b]));throw new Error("Failed pattern match at FRP.Event (line 655, column 21 - line 657, column 55): "+[d.constructor.name])})(m))(c))(),at(L)(Bu($n(r)(function(d){if(d instanceof I)return I.value;if(d instanceof k)return new k(ga(Eo)(b)(d.value0));throw new Error("Failed pattern match at FRP.Event (line 664, column 21 - line 666, column 69): "+[d.constructor.name])})(m))(c))}}));var l=e(u,function(m){var s=ae(c)(),b=Sa(r)(m.address)(s);if(b instanceof I)return void 0;if(b instanceof k)return _u(b.value0)(function(d){return function(){return d(m.payload)}})();throw new Error("Failed pattern match at FRP.Event (line 673, column 13 - line 675, column 70): "+[b.constructor.name])});return function(){return at(L)(Ae(En)(c))(),l()}}}}};return t}(),delay:function(){var t=function(r){return function(e){return function(n,u){var o=ke(Pt(Bs(Bi)))(),c=e(n,function(l){var m=ke(I.value)(),s=zs(r)(function(){u(l);var d=ae(m)();return Xt(_(br)(void 0))(function(v){return ko(Ws(Bi)(v))(o)})(d)()})();return Ae(new k(s))(m)(),ko(B(Ic(Bi))(Ns(s)))(o)()});return function(){var m=ae(o)();return Ir(br)(Hs)(m)(Vs)(),c()}}}};return t}()}}),Nc=Ks("create","FRP.Event",function(){return function(){return void 0,function(r){return r}(Bc(381).create)()}}),Mo=Bc(509),Ys=Nc(378),Wc=function(t){return function(r){return r}(Mo.bus)(t)};var un=function(t){return function(r){return r}(Mo.makeLemmingEvent)(t)},Zs=function(t){return function(r){return r}(Mo.makePureEvent)(t)},tv=function(t){return function(r){return r}(Mo.memoize)(t)},rv=function(t){return function(r){return r}(Mo.subscribePure)(t)},ny={apply:function(t){return function(r){return ey(t)(g(Qt)(to)(r))}},Functor0:function(){return Qt}};var V={pure:function(t){return function(r,e){return e(t),_(br)(void 0)}},Apply0:function(){return ny}};var Ut={alt:function(t){return function(r){return function(e,n){return It(tr)(g(L)(function(u){return function(o){return function(){return u(),o()}}})(function(){return t(e,n)}))(function(){return r(e,n)})()}}},Functor0:function(){return Qt}};var D={empty:function(t,r){return _(br)(void 0)},Alt0:function(){return Ut}},uy={Applicative0:function(){return V},Plus1:function(){return D}},ie={fold:ty,keepLatest:Zk,sampleOn:Yk,fix:ry,Alternative0:function(){return uy},Filterable1:function(){return nn}};var Uc=function(t){return function(r){return function(e){return function(n){return t(r,e,n)}}}};var Wi=function(t){return function(){return function(){return function(r){return function(e){return function(n){return Wn(le(t)(r))(e)(n)}}}}}},zc=function(t){return function(){return function(r){return function(e){return Ke(le(t)(r))(e)}}}};var Ui={vb:function(t){return _(Lt)(new H({},{}))}},nv=function(t){return t.vb},cy={vbus:function(){var t=function(){return function(e){return function(n){return function(u){return un(function(o){return function(c){return function(){var m=nv(e)(J.value)();return c(u(m.value0)(m.value1))(),_(Lt)(void 0)}}})}}}},r=function(){return function(e){return t()(e)}};return r}()},Jc=function(){return function(t){return function(r){return function(e){return e()(t)}(cy.vbus)(r)}}};var Ea=function(t){return function(){return function(){return function(r){return function(){return function(){return{vb:function(e){return function(){var u=nv(r)(J.value)(),o=Ys();return new H(Wi(t)()()(J.value)(o.push)(u.value0),Wi(t)()()(J.value)(o.event)(u.value1))}}}}}}}}};var yu=function(){function t(r){this.value0=r}return t.create=function(r){return new t(r)},t}(),jc=function(){function t(){}return t.value=new t,t}();var xo=function(){function t(r){this.value0=r}return t.create=function(r){return new t(r)},t}(),wo=function(){function t(){}return t.value=new t,t}(),zi=function(){function t(r){this.value0=r}return t.create=function(r){return new t(r)},t}(),Vi=function(){function t(r){this.value0=r}return t.create=function(r){return new t(r)},t}(),Ji=function(){function t(r){this.value0=r}return t.create=function(r){return new t(r)},t}(),$a=function(){function t(r){this.value0=r}return t.create=function(r){return new t(r)},t}(),T=function(){function t(r){this.value0=r}return t.create=function(r){return new t(r)},t}();var Fa={eq:function(t){return function(r){return t instanceof yu&&r instanceof yu?t.value0===r.value0:t instanceof jc&&r instanceof jc}}};var E=function(t){return new Ji(t)};var uv=function(t){return new Vi(t)};var av=t=>r=>r[t];var Fn=function(t){return t.reflectType};var iv=function(t){return Fn(t)};var Ma=Dr;var ji=function(){return function(t){return t}};var Xc=function(){return function(){return function(){return function(){return function(){return function(t){var r=iv(t);return function(e){return av(r(e))}}}}}}};var fv=[];var Gc=function(){return function(){return function(t){return function(r){return Co(t)(r)}}}};function cv(t){return function(){var r={};for(var e in t)hasOwnProperty.call(t,e)&&(r[e]=t[e]);return r}}var gu={};function Qc(t){return t()}function lv(t){return function(r){return function(e){return function(n){var u=e;function o(l){return function(m){return r(m)(l)(n[l])}}for(var c in n)hasOwnProperty.call(n,c)&&(u=t(u)(o(c)));return u}}}}function Xi(t){return function(r){var e=[];for(var n in r)hasOwnProperty.call(r,n)&&e.push(t(n)(r[n]));return e}}var by=Object.keys||Xi(function(t){return function(){return t}});function Yc(t){return function(r){return function(e){return function(){return e[t]=r,e}}}}var Zc=function(t){return function(r){return function(){return delete r[t],r}}};var Sy=Xi(function(t){return function(r){return r}});var hy=cv;var pv=function(t){return function(r){return Qc(function(){var n=hy(r)();return t(n)(),n})}};var xa=function(t){return function(r){return pv(Yc(t)(r))}};var _v=lv(to),Ey=function(t){return function(r){return _v(function(e){return function(n){return function(u){return B(t.Semigroup0())(e)(r(n)(u))}}})(Pt(t))}},sv={foldl:function(t){return _v(function(r){return function(e){return t(r)}})},foldr:function(t){return function(r){return function(e){return nr(Dt)(t)(r)(Sy(e))}}},foldMap:function(t){return function(r){return Ey(t)(C(r))}}};var tl=function(t){return pv(Zc(t))};var vv=function(){function t(){}return t.value=new t,t}(),el=function(){function t(){}return t.value=new t,t}(),$y=function(){function t(){}return t.value=new t,t}();var mv=function(t){return function(r){var e=function(n){var u=function(o){return function(c){return new H(c+1|0,new H(o,c))}};return Gu(ie)(u)(n)(0)};return new Vi(Xu(ie)(tv(e(r))(function(n){return g(Qt)(function(u){return nt(Ut)(_(V)(new xo(t(u.value0))))(g(Qt)(C(wo.value))(Os(nn)(function(){var o=gt(uo)(u.value1+1|0);return function(c){return o(Br(c))}}())(n)))})(n)})))}};var Mn=function(t){return function(r){return function(e){var n=function(u){return u(r)(e)};return function(u){if(u instanceof Ji)return mr(Dt)(D)(Mn(t)(r)(e))(u.value0);if(u instanceof $a)return Xu(ie)(g(Qt)(Mn(t)(r)(e))(u.value0));if(u instanceof T)return n(t.toElt(u.value0));if(u instanceof Vi)return un(function(o){return function(c){return function(){var m=Wr(gu)(),s=o(u.value0)(function(b){return function(){var v=t.ids(e)(),a=Wr(_(Lt)(void 0))(),y=t.ids(e)(),K=Wr(_(Lt)(void 0))(),vt=Wr([])(),Jt=Wr(_(Lt)(void 0))(),lr=g(Ht)(yu.create)(t.ids(e))(),Rn=Wr(vv.value)(),Nn=o(b)(function(pr){return function(){var Le=Pr(Rn)();if(pr instanceof zi&&Le instanceof el)return it(Jn)(Pr(vt))(Da(Lt)(Dt)(function(){var me=t.doLogic(pr.value0)(e);return function(Hn){return c(me(Hn))}}()))();if(pr instanceof wo&&Le instanceof el){at(Ht)(Ye($y.value)(Rn))();var cn=function(){var Hn=Pr(vt)();Ir(Lt)(Dt)(Hn)(function(na){return Ir(Lt)(Kr)(r.parent)(function(ua){return c(t.disconnectElement(e)({id:na,parent:ua,scope:lr}))})})();var ln=Pr(a)();ln();var ee=Pr(K)();return ee(),at(Ht)(Ur(tl(v))(m))(),at(Ht)(Ur(tl(y))(m))()};return at(Ht)(Ye(cn)(Jt))(),cn()}if(pr instanceof xo&&Le instanceof vv){at(Ht)(Ye(el.value)(Rn))();var Fu=o(Mn(t)(function(){var me={};for(var Hn in r)({}).hasOwnProperty.call(r,Hn)&&(me[Hn]=r[Hn]);return me.scope=lr,me.raiseId=function(ln){return at(Ht)(Ur(B(or)([ln]))(vt))},me}())(e)(pr.value0))(c)();return at(Ht)(Ur(xa(y)(Fu))(m))(),at(Ht)(Ye(Fu)(K))()}return void 0}})();at(Ht)(Ye(Nn)(a))(),at(Ht)(Ur(xa(v)(Nn))(m))();var rt=Pr(Jt)();return rt()}})();return function(){return it(Jn)(Pr(m))(ur(sv)(Rt(da))(_(Lt)(void 0)))(),s()}}}});throw new Error("Failed pattern match at Bolson.Control (line 523, column 17 - line 608, column 20): "+[u.constructor.name])}}}},Fy=function(){return function(t){return function(r){return function(e){return function(n){return function(u){return function(o){var c=function(l){return function(m){return un(function(s){return function(b){return function(){var v=F_(g(Dr)(C(""))(ji()(u)))(),a=ma(Dt)(D)(su(Ca)(function(Nn){return Xf(s_)(function(rt){return function(pr){return pr instanceof T?function(ou){return ou(function(){var Le={};for(var cn in l)({}).hasOwnProperty.call(l,cn)&&(Le[cn]=l[cn]);return Le.parent=I.value,Le.scope=r(l.scope),Le.raiseId=function(Fu){return M_(Nn)(Fu)(v)},Le}())(m)}(n.toElt(pr.value0)):rt(n.wrapElt(pr))}})})(ji()(u))),y=s(a)(b)(),K=Wr(_(Lt)(void 0))(),vt=g(Ht)(U)(x_(v))(),Jt=g(Ma)(function(Nn){return function(rt){return new T(n.fromEltO1(function(pr){return function(ou){return un(function(Le){return function(cn){return function(){return pr.raiseId(Nn)(),Ir(Lt)(Kr)(pr.parent)(function(me){return cn(n.giveNewParent(ou)({id:Nn,parent:me,scope:pr.scope})(rt))})(),_(Lt)(void 0)}}})}}))}})(vt),lr=Mn(e)(l)(m)(o(Jt)(U)),Rn=s(lr)(b)();return at(Ht)(Ye(Rn)(K))(),function(){y(),Bn(Lt)(!t)(Ir(Lt)(Dt)(ji()(vt))(function(pr){return b(n.deleteFromCache(m)({id:pr}))}))();var rt=Pr(K)();return rt()}}}})}};return new T(n.fromEltO2(c))}}}}}}};var Dv=function(){return function(t){return function(r){return function(e){return function(n){return Fy()(!1)(Et($t))(t)(r)(e)(n)}}}}};var Gi=function(){return function(t){return function(r){return function(e){return new $a(Jc()(t)(r)(e))}}}};var bv=function(){return new zi(0)}();var ul=function(){return wo.value}(),Qu=function(){return xo.create}();var Cu=function(t){return Wc(t)};var wa=function(t){return new $a(Cu(t))};var My=function(t){return t.makeText},xy=function(t){return function(r){return function(e){return g(Qt)(function(n){return t.setText(function(u){return{id:r,text:u}}(n))})(e)}}},wy=function(t){return function(r){return function(e){return g(Qt)(function(n){return function(u){if(u.value instanceof bo)return t.setProp({id:r,key:u.key,value:u.value.value0});if(u.value instanceof Ao)return t.setCb({id:r,key:u.key,value:u.value.value0});throw new Error("Failed pattern match at Deku.Control (line 86, column 26 - line 88, column 45): "+[u.value.constructor.name])}(Di(n))})(e)}}},Iy=function(t){return t.makeElement},Ly=function(t){return t.attributeParent},we=function(t){var r=function(e){return function(n){return un(function(u){return function(o){return function(){var l=n.ids();e.raiseId(l)();var m=u(ma(Dt)(D)([_(V)(My(n)({id:l,parent:e.parent,scope:e.scope})),xy(n)(l)(t)]))(o)();return function(){return o(n.deleteFromCache({id:l}))(),m()}}}})}};return new T(r)},Wt=function(t){return we(_(V)(t))},Ki=function(t){return function(r){return function(e){return t(A(D))([mv(r)(e)])}}};var dv=function(){return{doLogic:function(t){return function(r){return function(e){return r.sendToPos({id:e,pos:t})}}},ids:function(){var t=$r();return function(r){return function(e){return e.ids}(t(r))}}(),disconnectElement:function(t){return function(r){return t.disconnectElement({id:r.id,scope:r.scope,parent:r.parent,scopeEq:gt(Fa)})}},toElt:function(t){return t}}};var Ia=function(t){return function(r){return t(A(D))([uv(r)])}};var Py=Mn(dv());var $=function(t){return function(r){return function(e){var n=function(u){return function(o){return un(function(c){return function(l){return function(){var s=o.ids();u.raiseId(s)();var b=c(nt(Ut)(ma(Dt)(D)(B(or)([_(V)(Iy(o)({id:s,parent:u.parent,scope:u.scope,tag:t})),wy(o)(s)(r)])(Xt([])(function(d){return[_(V)(Ly(o)({id:s,parent:d,pos:u.pos}))]})(u.parent))))(Py({parent:new k(s),scope:u.scope,raiseId:function(d){return _(Lt)(void 0)},pos:I.value})(o)(e)))(l)();return function(){return l(o.deleteFromCache({id:s}))(),b()}}}})}};return n}}};var Av=function(){return function(t){return function(r){return Dv()(dv())({fromEltO1:Dn(),fromEltO2:Dn(),toElt:Dn(),wrapElt:function(){var e=$("div")(A(D));return function(n){return T.create(e(n))}}(),giveNewParent:function(e){return function(n){return function(u){return $r()(e).giveNewParent(n)}}},deleteFromCache:function(){var e=$r();return function(n){return function(u){return u.deleteFromCache}(e(n))}}()})(t)(Ue(We)(g(Ma)(function(e){return e(void 0)}))(Dn()(r)))}}};var Mr=function(){function t(){}return t.value=new t,t}();var Or={attr:function(t){return function(r){return i({key:"href",value:S(r)})}}};var cr=function(){function t(){}return t.value=new t,t}(),La={attr:function(t){return function(r){return i({key:"click",value:N(C(R(L)(r)(!0)))})}}};var dr={attr:function(t){return function(r){return i({key:"click",value:N(r)})}}};var re=function(){function t(){}return t.value=new t,t}();var Pa={attr:function(t){return function(r){return i({key:"style",value:S(r)})}}};var kv={attr:function(t){return function(r){return i({key:"style",value:S(r)})}}};var yv={attr:function(t){return function(r){return i({key:"style",value:S(r)})}}};var al={attr:function(t){return function(r){return i({key:"style",value:S(r)})}}};var Qi={attr:function(t){return function(r){return i({key:"style",value:S(r)})}}};var gv={attr:function(t){return function(r){return i({key:"style",value:S(r)})}}};var Lo=function(t){return function(r){return new T($("a")(t)(E(r)))}};var Xe=function(t){return function(r){return new T($("div")(t)(E(r)))}},Yt=Xe(A(D));var wn=function(t){return function(r){return new T($("span")(t)(E(r)))}},ol=wn(A(D));var Yu=function(){function t(){}return t.value=new t,t}();var Tv={attr:function(t){return function(r){return i({key:"type",value:S(r)})}}};var Zi={attr:function(t){return function(r){return i({key:"type",value:S(r)})}}};var fe=function(t){return function(r){return new T($("button")(t)(E(r)))}},fl=fe(A(D));var Sv=function(t){return function(r){return new T($("code")(t)(E(r)))}},Sr=Sv(A(D));var hv=function(t){return function(r){return new T($("i")(t)(E(r)))}},cl=hv(A(D));var tu=function(t){return function(r){return new T($("input")(t)(E(r)))}};var Ev=function(t){return function(r){return new T($("li")(t)(E(r)))}},ll=Ev(A(D));var $v=function(t){return function(r){return new T($("pre")(t)(E(r)))}},hr=$v(A(D));var Fv=function(t){return function(r){return new T($("ul")(t)(E(r)))}},pl=Fv(A(D));var rf=function(){function t(){}return t.value=new t,t}(),Oa=function(){function t(){}return t.value=new t,t}(),Ra=function(){function t(){}return t.value=new t,t}(),Na=function(){function t(){}return t.value=new t,t}(),Ha=function(){function t(){}return t.value=new t,t}(),Ba=function(){function t(){}return t.value=new t,t}(),Wa=function(){function t(){}return t.value=new t,t}(),Ua=function(){function t(){}return t.value=new t,t}(),qa=function(){function t(){}return t.value=new t,t}(),za=function(){function t(){}return t.value=new t,t}(),Mv=function(t){return t==="Intro"?_(Hr)(rf.value):t==="HelloWorld"?_(Hr)(Oa.value):t==="SimpleComponent"?_(Hr)(Ra.value):t==="PURSX1"?_(Hr)(Na.value):t==="PURSX2"?_(Hr)(Ha.value):t==="Events"?_(Hr)(Ba.value):t==="Effects"?_(Hr)(Wa.value):t==="Events2"?_(Hr)(Ua.value):t==="Portals"?_(Hr)(qa.value):t==="SSR"?_(Hr)(za.value):A(i_)};function _l(){window.scrollTo(0,0)}var Qr=_l;var By=function(t){return t};var xr={pursxToElement:function(t){return function(r){return function(e){return{cache:gu,element:function(n){return function(u){return A(D)}}}}}}},sl=function(t){return t.pursxToElement},zr=function(){return function(t){return function(r){return function(e){return{pursxToElement:function(n){return function(u){return function(o){var c=sl(t)(n)(J.value)(o);return{cache:xa(Fn(r)(J.value))(!0)(c.cache),element:function(l){return function(m){return nt(Ut)(g(Qt)(Ue(We)(Di)(function(s){if(s.value instanceof bo)return m.setProp({id:Fn(r)(J.value)+("@!%"+n),key:s.key,value:s.value.value0});if(s.value instanceof Ao)return m.setCb({id:Fn(r)(J.value)+("@!%"+n),key:s.key,value:s.value.value0});throw new Error("Failed pattern match at Deku.Pursx (line 4191, column 38 - line 4201, column 24): "+[s.value.constructor.name])}))(zc(e)()(J.value)(o)))(c.element(l)(m))}}}}}}}}}}};var rr=By,vl=function(t){return function(r){return function(){return function(){return function(e){return function(n){return function(u){return function(o){var c=function(l){return function(m){return un(function(s){return function(b){return function(){var v=m.ids(),a=m.ids();l.raiseId(v)();var y=sl(e)(a)(J.value)(o),K=s(nt(Ut)(_(V)(m.makePursx({id:v,parent:l.parent,cache:y.cache,pxScope:a,scope:l.scope,html:Fn(t)(u),verb:Fn(r)(n)})))(y.element(l)(m)))(b)();return function(){return b(m.deleteFromCache({id:v}))(),K()}}}})}};return new T(c)}}}}}}}},Rr=function(t){return function(){return function(){return function(r){return vl(t)({reflectType:function(){return"~"}})()()(r)(J.value)}}}},xv=function(t){return function(){return function(r){return function(e){return Rr(t)()()(r)(e)({})}}}},Wy=Mn({doLogic:function(t){return function(r){return function(e){return r.sendToPos({id:e,pos:t})}}},ids:function(){var t=$r();return function(r){return function(e){return e.ids}(t(r))}}(),disconnectElement:function(t){return function(r){return t.disconnectElement({id:r.id,scope:r.scope,parent:r.parent,scopeEq:gt(Fa)})}},toElt:function(t){return t}}),er=function(){return function(t){return function(r){return function(e){return{pursxToElement:function(n){return function(u){return function(o){var c=zc(e)()(J.value)(o),l=sl(t)(n)(J.value)(o);return{cache:xa(Fn(r)(J.value))(!1)(l.cache),element:function(m){return function(s){return nt(Ut)(Wy({parent:new k(Fn(r)(J.value)+("@!%"+n)),scope:m.scope,raiseId:function(b){return _(Lt)(void 0)},pos:m.pos})(s)(c))(l.element(m)(s))}}}}}}}}}}};var ml=`module Main where

import Prelude

import Control.Alt ((<|>))
import Data.Compactable (compact)
import Data.Maybe (Maybe(..))
import Deku.Attribute ((:=))
import Deku.Control (text)
import Deku.DOM as D
import Deku.Pursx (nut, (~~))
import Deku.Toplevel (runInBody1)
import Effect (Effect)
import FRP.Event (bus)
import Type.Proxy (Proxy(..))

myDom =
  Proxy
    :: Proxy
         """<div>
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
      { myli: pure (D.Style := "background-color:rgb(200,240,210);")
      , somethingNew: nut
          ( D.button (pure (D.OnClick := push (Just unit)))
              [ text
                  $ (compact event $> "Thanks for clicking me!") <|>
                      pure "I was dynamically inserted"
              ]
          )
      }
  )`,Dl=`module Main where

import Prelude

import Deku.Pursx (psx)
import Deku.Toplevel (runInBody)
import Effect (Effect)
import Type.Proxy (Proxy(..))

myDom =
  Proxy
    :: Proxy
         """<div>
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
main = runInBody (psx myDom)`,bl=`module Main where

import Prelude

import Control.Alt ((<|>))
import Data.FastVect.FastVect (index, (:))
import Data.FastVect.FastVect as V
import Data.Foldable (oneOfMap)
import Data.Profunctor (lcmap)
import Deku.Attribute ((:=))
import Deku.Control (portal, switcher_, text_)
import Deku.Core (Domable)
import Deku.DOM as D
import Deku.Toplevel (runInBody1)
import Effect (Effect)
import FRP.Event (Event, bus, fold)
import Type.Prelude (Proxy(..))

main :: Effect Unit
main = runInBody1
  ( bus \\push -> lcmap (pure unit <|> _) \\event -> do
      portal
        ( map
            ( \\i -> D.video
                (oneOfMap pure [ D.Controls := "true", D.Width := "250" ])
                [ D.source
                    (oneOfMap pure [ D.Src := i, D.Xtype := "video/mp4" ])
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
            p0 :: Domable _ _
            p0 = index (Proxy :: _ 0) v

            p1 :: Domable _ _
            p1 = index (Proxy :: _ 1) v

            ev :: Boolean -> Event Boolean
            ev = fold (const not) event

            flips :: Boolean -> Domable _ _
            flips = switcher_ D.span (if _ then p0 else p1) <<< ev
          D.div_
            [ D.button (pure $ D.OnClick := push unit)
                [ text_ "Switch videos" ]
            , D.div_ [ D.span_ [ flips true ], flips false ]
            ]
  )
`,dl=`module Main where

import Prelude

import Deku.Control (text_)
import Deku.Toplevel (runInBody)
import Effect (Effect)

main :: Effect Unit
main = runInBody (text_ "Hello world")`,Al=`module Main where

import Prelude

import Control.Alt ((<|>))
import Data.Filterable (compact)
import Data.Foldable (oneOf)
import Data.Maybe (Maybe(..))
import Data.Tuple.Nested ((/\\))
import Deku.Control (dyn_, text_)
import Deku.Core (Nut, bussed, insert_, remove, sendToTop)
import Deku.DOM as D
import Deku.Listeners (click, keyUp, textInput)
import Deku.Toplevel (runInBody)
import Effect (Effect)
import FRP.Event (Event, bus, keepLatest, mapAccum)
import Web.UIEvent.KeyboardEvent (code)

data MainUIAction
  = AddTodo
  | ChangeText String

data TodoAction = Prioritize | Delete

main :: Effect Unit
main = runInBody
  ( bussed \\pushAction actionEvent -> do
      let
        accumulateTextAndEmitOnSubmit :: Event String
        accumulateTextAndEmitOnSubmit = compact
          ( mapAccum
              ( \\a b -> case a of
                  AddTodo -> b /\\ Just b
                  ChangeText s -> s /\\ Nothing
              )
              actionEvent
              ""
          )

        top :: Nut
        top =
          D.div_
            [ D.input
                ( oneOf
                    [ textInput $ pure (pushAction <<< ChangeText)
                    , keyUp $ pure \\evt -> do
                        when (code evt == "Enter") $ do
                          pushAction AddTodo
                    ]
                )
                []
            , D.button
                (click $ pure $ pushAction AddTodo)
                [ text_ "Add" ]
            ]
      D.div_
        [ top
        , dyn_ D.div $
            map
              ( \\txt -> keepLatest $ bus \\p' e' ->
                  ( pure $ insert_ $ D.div_
                      [ text_ txt
                      , D.button
                          (click $ pure (p' sendToTop))
                          [ text_ "Prioritize" ]
                      , D.button
                          (click $ pure (p' remove))
                          [ text_ "Delete" ]
                      ]
                  ) <|> e'
              )
              accumulateTextAndEmitOnSubmit
        ]
  )
`,kl=`module Main where

import Prelude

import Control.Alt ((<|>))
import Deku.Control (text, text_)
import Deku.Core (vbussed)
import Deku.DOM as D
import Deku.Listeners (click_, slider)
import Deku.Toplevel (runInBody)
import Effect (Effect)
import FRP.Event (Event, fold)
import FRP.Event.VBus (V)
import Type.Proxy (Proxy(..))

type UIEvents = V
  ( buttonClicked :: Unit
  , sliderMoved :: Number
  )

main :: Effect Unit
main = runInBody
  ( vbussed (Proxy :: _ UIEvents) \\push event -> do
      let
        countUp :: Event Int
        countUp = fold
          (const (1 + _))
          (pure unit <|> event.buttonClicked)
          (-1)
      D.div_
        [ D.button
            (click_ (pure push.buttonClicked))
            [ text_ "Click" ]
        , D.div_
            [ text
                ( pure "Val: 0" <|>
                    ( append "Val: " <<< show <$> countUp
                    )
                )
            ]
        , D.div_
            [ D.input
                (slider (pure push.sliderMoved))
                []
            , D.div_
                [ text
                    ( pure "Val: 50" <|>
                        ( append "Val: " <<< show
                            <$> event.sliderMoved
                        )
                    )
                ]
            ]
        ]
  )
`,yl=`module Main where

import Prelude

import Affjax.ResponseFormat as ResponseFormat
import Affjax.Web as AX
import Control.Alt ((<|>))
import Data.Argonaut.Core (stringifyWithIndent)
import Data.Either (Either(..))
import Data.Filterable (compact, separate)
import Data.HTTP.Method (Method(..))
import Data.Maybe (Maybe(..))
import Data.Profunctor (lcmap)
import Data.Tuple.Nested ((/\\))
import Deku.Attribute (Cb, cb, (:=))
import Deku.Control (text)
import Deku.Core (bus)
import Deku.DOM as D
import Deku.Toplevel (runInBody1)
import Effect (Effect)
import Effect.Aff (launchAff_)
import Effect.Class (liftEffect)
import FRP.Event (Event, mapAccum)

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
  ( bus \\push -> lcmap (pure Initial <|> _)
      \\event -> do
        let
          split :: { left :: Event Unit, right :: Event String }
          split = separate $ compact $
            map
              ( case _ of
                  Loading -> Just $ Left unit
                  Result s -> Just $ Right s
                  _ -> Nothing
              )
              event
          { left: loading, right: result } = split
        D.div_
          [ D.div_
              [ D.button (pure (D.OnClick := clickCb push))
                  [ text
                      ( pure clickText
                          <|> (loading $> "Loading...")
                          <|> (result $> clickText)
                      )
                  ]
              ]
          , D.div
              ( (pure (D.Style := "display: none;")) <|>
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
              [ D.pre_ [ D.code_ [ text (pure "" <|> result) ] ] ]
          ]
  )
`,gl=`module Main where

import Prelude

import Deku.Attribute ((:=))
import Deku.Control (text_)
import Deku.DOM as D
import Deku.Toplevel (runInBodyA)
import Effect (Effect)

main :: Effect Unit
main = runInBodyA
  ( [ D.button_ [ text_ "I do nothing" ]
    , D.ul_ $ map (D.li_ <<< pure <<< text_) [ "A", "B", "C" ]
    , D.div_
        [ D.a (pure $ D.Href := "https://example.com")
            [ text_ "foo " ]
        , D.i_ [ text_ " bar " ]
        , D.span (pure $ D.Style := "font-weight: 800;")
            [ text_ " baz" ]
        ]
    , D.div_
        [ D.div_
            [ D.div_ [ D.input (pure $ D.Xtype := "range") [] ]
            ]
        ]
    ]
  )`,Cl=`module Main where

import Prelude

import Control.Alt ((<|>))
import Deku.Control (text, text_)
import Deku.DOM as D
import Deku.Listeners (click_, slider)
import Deku.Core (Nut, vbussed)
import FRP.Event (fold)
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
        (click_ (pure push.buttonClicked))
        [ text_ "Click" ]
    , D.div_
        [ text
            ( pure "Val: 0" <|>
                ( append "Val: " <<< show
                    <$> fold
                      (const (add 1))
                      (pure unit <|> event.buttonClicked)
                      (-1)
                )
            )
        ]
    , D.div_
        [ D.input
            (slider (pure push.sliderMoved))
            []
        , D.div_
            [ text
                ( pure "Val: 50" <|>
                    ( map
                        (append "Val: " <<< show)
                        event.sliderMoved
                    )
                )
            ]
        ]
    ]
`,Tl=`module Deku.Example.Docs.Examples.SSR.Build where

import Prelude

import Control.Monad.ST.Global (toEffect)
import Deku.Examples.Docs.Examples.SSR.App (app)
import Deku.Toplevel (Template(..), runSSR)
import Effect (Effect)
import Effect.Console (log)

main :: Effect Unit
main =
  toEffect
    ( runSSR
        ( Template
            { head:
                """<!DOCTYPE html>
<html>
  <head>
    <title>My static page</title>
		<script src="bundle.js" defer><\/script>
  </head>"""
            , tail: "</html>"
            }
        )
        app
    ) >>= log`,Sl=`module Deku.Example.Docs.Examples.SSR.Live where

import Prelude

import Deku.Examples.Docs.Examples.SSR.App (app)
import Deku.Toplevel (hydrate)
import Effect (Effect)

main :: Effect Unit
main = hydrate app`;function wv(t){return t.target}function Nr(t){return function(){return t.preventDefault()}}function Iv(t,r,e){return t==null?r:e(t)}function hl(t){return t}var Va=Xt(null)(hl),Vr=function(t){return Iv(t,I.value,k.create)};var af=function(t){return Vr(wv(t))};var Xy=function(){return J.value}(),Pv=function(t){return Rr({reflectType:function(){return`<div>
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
  <p>Attributes like an element's style or id are specified as the first argument to an element. Attributes are just <a href="https://github.com/mikesol/purescript-event/blob/master/src/FRP/Event.purs"><code>Event</code>-s</a>, so you can <code>pure</code> them to make them happen <i>now</i>, combine two event streams with <code>alt</code> to compose events, etc.</p>

  <p>As an example, we made the input a range slider using <code>pure (Xtype := "range")</code>. Unlike Halogen, there are no checks to make sure you give a valid string. So if you want your range slider to have the value of true, you can. One day, I may build some validators, but passing strings works decently well here.</p>

  <h2>Next steps</h2>
  <p>In this section, we built a simple component. In the next section, we'll recreate the exact same element using a different input syntax called <a ~next~ style="cursor:pointer;">Pursx</a>.</p>
</div>`}})()()(er()(zr()(er()(xr)({reflectType:function(){return"result"}})({reflectSymbol:function(){return"result"}}))({reflectType:function(){return"next"}})({reflectSymbol:function(){return"next"}}))({reflectType:function(){return"code"}})({reflectSymbol:function(){return"code"}}))(Xy)({code:rr(hr([Sr([Wt(gl)])])),result:rr(Yt([fl([Wt("I do nothing")]),pl(g(Dr)(function(){var r=_(no);return function(e){return ll(r(Wt(e)))}}())(["A","B","C"])),Yt([Lo(_(V)(Z(Or)(Mr.value)("https://example.com")))([Wt("foo ")]),cl([Wt(" bar ")]),wn(_(V)(Z(Pa)(re.value)("font-weight: 800;")))([Wt(" baz")])]),Yt([Yt([Yt([tu(_(V)(Z(Zi)(Yu.value)("range")))([])])])])])),next:mr(Dt)(D)(_(V))([Z(dr)(cr.value)(fr(function(r){return Rt(tr)(Rt(tr)(Nr(r))(t.dpage(Na.value)))(Qr)})),Z(Or)(Mr.value)(t.slug+"pursx1/")])})};function Ov(t,r,e,n,u){return function(o,c){var l=t.newXHR(),m=t.fixupUrl(u.url,l);if(l.open(u.method||"GET",m,!0,u.username,u.password),u.headers)try{for(var s=0,b;(b=u.headers[s])!=null;s++)l.setRequestHeader(b.field,b.value)}catch(v){o(v)}var d=function(v){return function(){o(new Error(v))}};return l.onerror=d(e),l.ontimeout=d(r),l.onload=function(){c({status:l.status,statusText:l.statusText,headers:l.getAllResponseHeaders().split(`\r
`).filter(function(v){return v.length>0}).map(function(v){var a=v.indexOf(":");return n(v.substring(0,a))(v.substring(a+2))}),body:l.response})},l.responseType=u.responseType,l.withCredentials=u.withCredentials,l.timeout=u.timeout,l.send(u.content),function(v,a,y){try{l.abort()}catch(K){return a(K)}return y()}}}var of="application/json",Rv="application/x-www-form-urlencoded";var Hv=function(){function t(r){this.value0=r}return t.create=function(r){return new t(r)},t}(),Bv=function(){function t(r){this.value0=r}return t.create=function(r){return new t(r)},t}(),Wv=function(){function t(r){this.value0=r}return t.create=function(r){return new t(r)},t}(),Uv=function(){function t(r){this.value0=r}return t.create=function(r){return new t(r)},t}(),qv=function(){function t(r){this.value0=r}return t.create=function(r){return new t(r)},t}(),El=function(){function t(r){this.value0=r}return t.create=function(r){return new t(r)},t}(),$l=function(){function t(r){this.value0=r}return t.create=function(r){return new t(r)},t}(),zv=function(t){return t instanceof El?new k(Rv):t instanceof $l?new k(of):I.value};var ff=function(){function t(r){this.value0=r}return t.create=function(r){return new t(r)},t}(),cf=function(){function t(r){this.value0=r}return t.create=function(r){return new t(r)},t}(),Vv=function(){function t(r,e){this.value0=r,this.value1=e}return t.create=function(r){return function(e){return new t(r,e)}},t}(),Jv=function(t){if(t instanceof ff)return $r()(t.value0);if(t instanceof cf)return $r()(t.value0);if(t instanceof Vv)return t.value1;throw new Error("Failed pattern match at Affjax.RequestHeader (line 26, column 1 - line 26, column 33): "+[t.constructor.name])};var Fl=function(t){if(t instanceof ff)return"Accept";if(t instanceof cf)return"Content-Type";if(t instanceof Vv)return t.value0;throw new Error("Failed pattern match at Affjax.RequestHeader (line 21, column 1 - line 21, column 32): "+[t.constructor.name])};var Ml=function(){function t(r){this.value0=r}return t.create=function(r){return new t(r)},t}(),xl=function(){function t(r){this.value0=r}return t.create=function(r){return new t(r)},t}(),wl=function(){function t(r){this.value0=r}return t.create=function(r){return new t(r)},t}(),Po=function(){function t(r){this.value0=r}return t.create=function(r){return new t(r)},t}(),Il=function(){function t(r){this.value0=r}return t.create=function(r){return new t(r)},t}(),lf=function(){function t(r){this.value0=r}return t.create=function(r){return new t(r)},t}(),jv=function(t){if(t instanceof Ml)return"arraybuffer";if(t instanceof xl)return"blob";if(t instanceof wl)return"document";if(t instanceof Po||t instanceof Il)return"text";if(t instanceof lf)return"";throw new Error("Failed pattern match at Affjax.ResponseFormat (line 44, column 3 - line 50, column 19): "+[t.constructor.name])},Xv=function(t){return t instanceof Po?new k(of):I.value};var Gv=function(){return new Po(Et($t))}(),Kv=function(){return new lf(Et($t))}();var Yv=function(){function t(r,e){this.value0=r,this.value1=e}return t.create=function(r){return function(e){return new t(r,e)}},t}();function Ja(t){return new Error(t)}function Oo(t){return t.message}function Ro(t){return function(){throw t}}var fn=function(t){return t.throwError};var uu=function(t){return t.catchError};var _f=function(t){return function(r){return uu(t)(g(t.MonadThrow0().Monad0().Bind1().Apply0().Functor0())(et.create)(r))(function(){var e=_(t.MonadThrow0().Monad0().Applicative0());return function(n){return e(ut.create(n))}}())}};var Pn=function(t){return t.state};var ja=function(t){return function(r){return Pn(t)(function(e){var n=r(e);return new H(n,n)})}};var Ge=function(t){return t.liftEffect};var Ll=function(t){return t};var Pl=function(t){return t};var bf=function(t){return function(r){return t(r)}},tm=function(t){return{map:function(r){return bf(g(t)(g(ca)(r)))}}};var Ol=function(t){return{Applicative0:function(){return ra(t)},Bind1:function(){return Rl(t)}}},Rl=function(t){return{bind:function(r){return function(e){return it(t.Bind1())(r)(He(function(){var n=_(t.Applicative0());return function(u){return n(ut.create(u))}}())(function(n){var u=e(n);return u}))}},Apply0:function(){return rm(t)}}},rm=function(t){return{apply:qe(Ol(t)),Functor0:function(){return tm(t.Bind1().Apply0().Functor0())}}},ra=function(t){return{pure:function(){var r=_(t.Applicative0());return function(e){return Ll(r(et.create(e)))}}(),Apply0:function(){return rm(t)}}};var em=function(t){return{throwError:function(){var r=_(t.Applicative0());return function(e){return Ll(r(ut.create(e)))}}(),Monad0:function(){return Ol(t)}}};var Nl=function(t){return function(r){return{alt:function(e){return function(n){return it(r.Bind1())(e)(function(u){if(u instanceof et)return _(r.Applicative0())(new et(u.value0));if(u instanceof ut)return it(r.Bind1())(n)(function(o){if(o instanceof et)return _(r.Applicative0())(new et(o.value0));if(o instanceof ut)return _(r.Applicative0())(new ut(B(t)(u.value0)(o.value0)));throw new Error("Failed pattern match at Control.Monad.Except.Trans (line 86, column 9 - line 88, column 49): "+[o.constructor.name])});throw new Error("Failed pattern match at Control.Monad.Except.Trans (line 82, column 5 - line 88, column 49): "+[u.constructor.name])})}},Functor0:function(){return tm(r.Bind1().Apply0().Functor0())}}}};var nm=function(){var t=$r();return function(r){return t(Pl(r))}}();function Hl(t){return JSON.stringify(t)}function Bl(t){return function(r){return JSON.stringify(r,null,t)}}var um=gu;function om(t,r,e){try{return r(JSON.parse(e))}catch(n){return t(n.message)}}var im=function(t){return om(ut.create,et.create,t)};var Af=function(t){return function(r){return function(e){return e.replace(t,r)}}};var Wl=function(t){return function(r){return r.join(t)}};function pg(t){return t.replace(/[!'()*]/g,function(r){return"%"+r.charCodeAt(0).toString(16)})}var lm=function(r,e,n){try{return e(pg(encodeURIComponent(n)).replace(/%20/g,"+"))}catch(u){return r(u)}};var kf=function(){return Uc(lm)(C(I.value))(k.create)}();var vg=function(t){return t};var pm=function(){var t=function(n){if(n.value1 instanceof I)return kf(n.value0);if(n.value1 instanceof k)return It(Lu)(g(_r)(function(u){return function(o){return u+("="+o)}})(kf(n.value0)))(kf(n.value1.value0));throw new Error("Failed pattern match at Data.FormURLEncoded (line 37, column 16 - line 39, column 114): "+[n.constructor.name])},r=g(_r)(Wl("&")),e=ge(Xn)(Hr)(t);return function(n){return r(e(vg(n)))}}();var Dg=function(){function t(){}return t.value=new t,t}(),zo=function(){function t(){}return t.value=new t,t}(),bg=function(){function t(){}return t.value=new t,t}(),_m=function(){function t(){}return t.value=new t,t}(),sm=function(){function t(){}return t.value=new t,t}(),vm=function(){function t(){}return t.value=new t,t}(),dg=function(){function t(){}return t.value=new t,t}(),Ag=function(){function t(){}return t.value=new t,t}(),kg=function(){function t(){}return t.value=new t,t}(),yg=function(){function t(){}return t.value=new t,t}(),gg=function(){function t(){}return t.value=new t,t}(),Cg=function(){function t(){}return t.value=new t,t}(),Tg=function(){function t(){}return t.value=new t,t}(),Sg=function(){function t(){}return t.value=new t,t}(),hg=function(){function t(){}return t.value=new t,t}(),mm=function(){function t(){}return t.value=new t,t}();var Eg=function(t){return t},$g={show:function(t){if(t instanceof Dg)return"OPTIONS";if(t instanceof zo)return"GET";if(t instanceof bg)return"HEAD";if(t instanceof _m)return"POST";if(t instanceof sm)return"PUT";if(t instanceof vm)return"DELETE";if(t instanceof dg)return"TRACE";if(t instanceof Ag)return"CONNECT";if(t instanceof kg)return"PROPFIND";if(t instanceof yg)return"PROPPATCH";if(t instanceof gg)return"MKCOL";if(t instanceof Cg)return"COPY";if(t instanceof Tg)return"MOVE";if(t instanceof Sg)return"LOCK";if(t instanceof hg)return"UNLOCK";if(t instanceof mm)return"PATCH";throw new Error("Failed pattern match at Data.HTTP.Method (line 43, column 1 - line 59, column 23): "+[t.constructor.name])}};var Dm=He(Y($g))(Eg);var Am=function(){var t=Ii(Sc);return function(r){return Li(t(r))}}();var km=function(t){return t.value0};var Ce=function(){var t={},r="Pure",e="Throw",n="Catch",u="Sync",o="Async",c="Bind",l="Bracket",m="Fork",s="Sequential",b="Map",d="Apply",v="Alt",a="Cons",y="Resume",K="Release",vt="Finalizer",Jt="Finalized",lr="Forked",Rn="Fiber",Nn="Thunk";function rt(Q,jt,yr,Zt){this.tag=Q,this._1=jt,this._2=yr,this._3=Zt}function pr(Q){var jt=function(yr,Zt,ft){return new rt(Q,yr,Zt,ft)};return jt.tag=Q,jt}function ou(Q){return new rt(r,void 0)}function Le(Q){try{Q()}catch(jt){setTimeout(function(){throw jt},0)}}function cn(Q,jt,yr){try{return jt(yr())}catch(Zt){return Q(Zt)}}function Fu(Q,jt,yr){try{return jt(yr)()}catch(Zt){return yr(Q(Zt))(),ou}}var me=function(){var Q=1024,jt=0,yr=0,Zt=new Array(Q),ft=!1;function z(){var Gt;for(ft=!0;jt!==0;)jt--,Gt=Zt[yr],Zt[yr]=void 0,yr=(yr+1)%Q,Gt();ft=!1}return{isDraining:function(){return ft},enqueue:function(Gt){var Mt,Ar;jt===Q&&(Ar=ft,z(),ft=Ar),Zt[(yr+jt)%Q]=Gt,jt++,ft||z()}}}();function Hn(Q){var jt={},yr=0,Zt=0;return{register:function(ft){var z=yr++;ft.onComplete({rethrow:!0,handler:function(Gt){return function(){Zt--,delete jt[z]}}})(),jt[z]=ft,Zt++},isEmpty:function(){return Zt===0},killAll:function(ft,z){return function(){if(Zt===0)return z();var Gt=0,Mt={};function Ar(ar){Mt[ar]=jt[ar].kill(ft,function(Er){return function(){delete Mt[ar],Gt--,Q.isLeft(Er)&&Q.fromLeft(Er)&&setTimeout(function(){throw Q.fromLeft(Er)},0),Gt===0&&z()}})()}for(var jr in jt)jt.hasOwnProperty(jr)&&(Gt++,Ar(jr));return jt={},yr=0,Zt=0,function(ar){return new rt(u,function(){for(var Er in Mt)Mt.hasOwnProperty(Er)&&Mt[Er]()})}}}}}var ln=0,ee=1,na=2,ua=3,ti=4,Te=5,Ka=6;function Bf(Q,jt,yr){var Zt=0,ft=ln,z=yr,Gt=null,Mt=null,Ar=null,jr=null,ar=null,Er=0,Mu=0,Pe=null,iu=!0;function fu(ct){for(var lt,Bt,qt;;)switch(lt=null,Bt=null,qt=null,ft){case na:ft=ee;try{z=Ar(z),jr===null?Ar=null:(Ar=jr._1,jr=jr._2)}catch(Yr){ft=Te,Gt=Q.left(Yr),z=null}break;case ua:Q.isLeft(z)?(ft=Te,Gt=z,z=null):Ar===null?ft=Te:(ft=na,z=Q.fromRight(z));break;case ee:switch(z.tag){case c:Ar&&(jr=new rt(a,Ar,jr)),Ar=z._2,ft=ee,z=z._1;break;case r:Ar===null?(ft=Te,z=Q.right(z._1)):(ft=na,z=z._1);break;case u:ft=ua,z=cn(Q.left,Q.right,z._1);break;case o:ft=ti,z=Fu(Q.left,z._1,function(Yr){return function(){Zt===ct&&(Zt++,me.enqueue(function(){Zt===ct+1&&(ft=ua,z=Yr,fu(Zt))}))}});return;case e:ft=Te,Gt=Q.left(z._1),z=null;break;case n:Ar===null?ar=new rt(a,z,ar,Mt):ar=new rt(a,z,new rt(a,new rt(y,Ar,jr),ar,Mt),Mt),Ar=null,jr=null,ft=ee,z=z._1;break;case l:Er++,Ar===null?ar=new rt(a,z,ar,Mt):ar=new rt(a,z,new rt(a,new rt(y,Ar,jr),ar,Mt),Mt),Ar=null,jr=null,ft=ee,z=z._1;break;case m:ft=ua,lt=Bf(Q,jt,z._2),jt&&jt.register(lt),z._1&&lt.run(),z=Q.right(lt);break;case s:ft=ee,z=ib(Q,jt,z._1);break}break;case Te:if(Ar=null,jr=null,ar===null)ft=Ka,z=Mt||Gt||z;else switch(lt=ar._3,qt=ar._1,ar=ar._2,qt.tag){case n:Mt&&Mt!==lt&&Er===0?ft=Te:Gt&&(ft=ee,z=qt._2(Q.fromLeft(Gt)),Gt=null);break;case y:Mt&&Mt!==lt&&Er===0||Gt?ft=Te:(Ar=qt._1,jr=qt._2,ft=na,z=Q.fromRight(z));break;case l:Er--,Gt===null&&(Bt=Q.fromRight(z),ar=new rt(a,new rt(K,qt._2,Bt),ar,lt),(Mt===lt||Er>0)&&(ft=ee,z=qt._3(Bt)));break;case K:ar=new rt(a,new rt(Jt,z,Gt),ar,Mt),ft=ee,Mt&&Mt!==lt&&Er===0?z=qt._1.killed(Q.fromLeft(Mt))(qt._2):Gt?z=qt._1.failed(Q.fromLeft(Gt))(qt._2):z=qt._1.completed(Q.fromRight(z))(qt._2),Gt=null,Er++;break;case vt:Er++,ar=new rt(a,new rt(Jt,z,Gt),ar,Mt),ft=ee,z=qt._1;break;case Jt:Er--,ft=Te,z=qt._1,Gt=qt._2;break}break;case Ka:for(var Cr in Pe)Pe.hasOwnProperty(Cr)&&(iu=iu&&Pe[Cr].rethrow,Le(Pe[Cr].handler(z)));Pe=null,Mt&&Gt?setTimeout(function(){throw Q.fromLeft(Gt)},0):Q.isLeft(z)&&iu&&setTimeout(function(){if(iu)throw Q.fromLeft(z)},0);return;case ln:ft=ee;break;case ti:return}}function gr(ct){return function(){if(ft===Ka)return iu=iu&&ct.rethrow,ct.handler(z)(),function(){};var lt=Mu++;return Pe=Pe||{},Pe[lt]=ct,function(){Pe!==null&&delete Pe[lt]}}}function mt(ct,lt){return function(){if(ft===Ka)return lt(Q.right(void 0))(),function(){};var Bt=gr({rethrow:!1,handler:function(){return lt(Q.right(void 0))}})();switch(ft){case ln:Mt=Q.left(ct),ft=Ka,z=Mt,fu(Zt);break;case ti:Mt===null&&(Mt=Q.left(ct)),Er===0&&(ft===ti&&(ar=new rt(a,new rt(vt,z(ct)),ar,Mt)),ft=Te,z=null,Gt=null,fu(++Zt));break;default:Mt===null&&(Mt=Q.left(ct)),Er===0&&(ft=Te,z=null,Gt=null)}return Bt}}function wt(ct){return function(){var lt=gr({rethrow:!1,handler:ct})();return ft===ln&&fu(Zt),lt}}return{kill:mt,join:wt,onComplete:gr,isSuspended:function(){return ft===ln},run:function(){ft===ln&&(me.isDraining()?fu(Zt):me.enqueue(function(){fu(Zt)}))}}}function ob(Q,jt,yr,Zt){var ft=0,z={},Gt=0,Mt={},Ar=new Error("[ParAff] Early exit"),jr=null,ar=t;function Er(gr,mt,wt){var ct=mt,lt=null,Bt=null,qt=0,Cr={},Yr,Qa;t:for(;;)switch(Yr=null,ct.tag){case lr:if(ct._3===t&&(Yr=z[ct._1],Cr[qt++]=Yr.kill(gr,function(fb){return function(){qt--,qt===0&&wt(fb)()}})),lt===null)break t;ct=lt._2,Bt===null?lt=null:(lt=Bt._1,Bt=Bt._2);break;case b:ct=ct._2;break;case d:case v:lt&&(Bt=new rt(a,lt,Bt)),lt=ct,ct=ct._1;break}if(qt===0)wt(Q.right(void 0))();else for(Qa=0,Yr=qt;Qa<Yr;Qa++)Cr[Qa]=Cr[Qa]();return Cr}function Mu(gr,mt,wt){var ct,lt,Bt,qt,Cr,Yr;Q.isLeft(gr)?(ct=gr,lt=null):(lt=gr,ct=null);t:for(;;){if(Bt=null,qt=null,Cr=null,Yr=null,jr!==null)return;if(mt===null){Zt(ct||lt)();return}if(mt._3!==t)return;switch(mt.tag){case b:ct===null?(mt._3=Q.right(mt._1(Q.fromRight(lt))),lt=mt._3):mt._3=ct;break;case d:if(Bt=mt._1._3,qt=mt._2._3,ct){if(mt._3=ct,Cr=!0,Yr=Gt++,Mt[Yr]=Er(Ar,ct===Bt?mt._2:mt._1,function(){return function(){delete Mt[Yr],Cr?Cr=!1:wt===null?Mu(ct,null,null):Mu(ct,wt._1,wt._2)}}),Cr){Cr=!1;return}}else{if(Bt===t||qt===t)return;lt=Q.right(Q.fromRight(Bt)(Q.fromRight(qt))),mt._3=lt}break;case v:if(Bt=mt._1._3,qt=mt._2._3,Bt===t&&Q.isLeft(qt)||qt===t&&Q.isLeft(Bt))return;if(Bt!==t&&Q.isLeft(Bt)&&qt!==t&&Q.isLeft(qt))ct=lt===Bt?qt:Bt,lt=null,mt._3=ct;else if(mt._3=lt,Cr=!0,Yr=Gt++,Mt[Yr]=Er(Ar,lt===Bt?mt._2:mt._1,function(){return function(){delete Mt[Yr],Cr?Cr=!1:wt===null?Mu(lt,null,null):Mu(lt,wt._1,wt._2)}}),Cr){Cr=!1;return}break}wt===null?mt=null:(mt=wt._1,wt=wt._2)}}function Pe(gr){return function(mt){return function(){delete z[gr._1],gr._3=mt,Mu(mt,gr._2._1,gr._2._2)}}}function iu(){var gr=ee,mt=yr,wt=null,ct=null,lt,Bt;t:for(;;)switch(lt=null,Bt=null,gr){case ee:switch(mt.tag){case b:wt&&(ct=new rt(a,wt,ct)),wt=new rt(b,mt._1,t,t),mt=mt._2;break;case d:wt&&(ct=new rt(a,wt,ct)),wt=new rt(d,t,mt._2,t),mt=mt._1;break;case v:wt&&(ct=new rt(a,wt,ct)),wt=new rt(v,t,mt._2,t),mt=mt._1;break;default:Bt=ft++,gr=Te,lt=mt,mt=new rt(lr,Bt,new rt(a,wt,ct),t),lt=Bf(Q,jt,lt),lt.onComplete({rethrow:!1,handler:Pe(mt)})(),z[Bt]=lt,jt&&jt.register(lt)}break;case Te:if(wt===null)break t;wt._1===t?(wt._1=mt,gr=ee,mt=wt._2,wt._2=t):(wt._2=mt,mt=wt,ct===null?wt=null:(wt=ct._1,ct=ct._2))}for(ar=mt,Bt=0;Bt<ft;Bt++)z[Bt].run()}function fu(gr,mt){jr=Q.left(gr);var wt;for(var ct in Mt)if(Mt.hasOwnProperty(ct)){wt=Mt[ct];for(ct in wt)wt.hasOwnProperty(ct)&&wt[ct]()}Mt=null;var lt=Er(gr,ar,mt);return function(Bt){return new rt(o,function(qt){return function(){for(var Cr in lt)lt.hasOwnProperty(Cr)&&lt[Cr]();return ou}})}}return iu(),function(gr){return new rt(o,function(mt){return function(){return fu(gr,mt)}})}}function ib(Q,jt,yr){return new rt(o,function(Zt){return function(){return ob(Q,jt,yr,Zt)}})}return rt.EMPTY=t,rt.Pure=pr(r),rt.Throw=pr(e),rt.Catch=pr(n),rt.Sync=pr(u),rt.Async=pr(o),rt.Bind=pr(c),rt.Bracket=pr(l),rt.Fork=pr(m),rt.Seq=pr(s),rt.ParMap=pr(b),rt.ParApply=pr(d),rt.ParAlt=pr(v),rt.Fiber=Bf,rt.Supervisor=Hn,rt.Scheduler=me,rt.nonCanceler=ou,rt}(),gm=Ce.Pure,Cm=Ce.Throw;function Tm(t){return function(r){return Ce.Catch(t,r)}}function Sm(t){return function(r){return r.tag===Ce.Pure.tag?Ce.Pure(t(r._1)):Ce.Bind(r,function(e){return Ce.Pure(t(e))})}}function hm(t){return function(r){return Ce.Bind(t,r)}}var Em=Ce.Sync;var Vo=Ce.Async;function $m(t,r){return function(){return Ce.Fiber(t,null,r)}}var Fg=function(){function t(e,n){return e===0&&typeof setImmediate<"u"?setImmediate(n):setTimeout(n,e)}function r(e,n){return e===0&&typeof clearImmediate<"u"?clearImmediate(n):clearTimeout(n)}return function(e,n){return Ce.Async(function(u){return function(){var o=t(n,u(e()));return function(){return Ce.Sync(function(){return e(r(n,o))})}}})}}(),Mg=Ce.Seq;var Vg=function(t,r,e){var n=0,u;return function(o){if(n===2)return u;if(n===1)throw new ReferenceError(t+" was needed before it finished initializing (module "+r+", line "+o+")",r,o);return n=1,u=e(),n=2,u}};var Vl={map:Sm};var Jg=function(){var t=function(n){if(n instanceof et)return n.value0;if(n instanceof ut)return Du("unsafeFromRight: Left");throw new Error("Failed pattern match at Effect.Aff (line 407, column 21 - line 409, column 54): "+[n.constructor.name])},r=function(n){if(n instanceof ut)return n.value0;if(n instanceof et)return Du("unsafeFromLeft: Right");throw new Error("Failed pattern match at Effect.Aff (line 402, column 20 - line 404, column 55): "+[n.constructor.name])},e=function(n){if(n instanceof ut)return!0;if(n instanceof et)return!1;throw new Error("Failed pattern match at Effect.Aff (line 397, column 12 - line 399, column 21): "+[n.constructor.name])};return{isLeft:e,fromLeft:r,fromRight:t,left:ut.create,right:et.create}}(),jg=function(t){return $m(Jg,t)},Xg=function(t){return function(){var e=jg(t)();return e.run(),e}},Jl=function(){var t=at(L);return function(r){return t(Xg(r))}}();var jl={Applicative0:function(){return yf},Bind1:function(){return Xl}},Xl={bind:hm,Apply0:function(){return Im(0)}},yf={pure:gm,Apply0:function(){return Im(0)}},Im=Vg("applyAff","Effect.Aff",function(){return{apply:qe(jl),Functor0:function(){return Vl}}});var gf={liftEffect:Em,Monad0:function(){return jl}};var Gg={throwError:Cm,Monad0:function(){return jl}},Lm={catchError:Tm,MonadThrow0:function(){return Gg}};var Pm=C(_(yf)(void 0));var Om=function(t){return Vo(function(r){return function(){var n=t(function(u){return r(ut.create(u))()},function(u){return r(et.create(u))()});return function(u){return Vo(function(o){return function(){return n(u,function(l){return o(ut.create(l))()},function(l){return o(et.create(l))()}),Pm}})}}})};function Tf(t){return Object.prototype.toString.call(t).slice(8,-1)}var Rm=Array.isArray||function(t){return Object.prototype.toString.call(t)==="[object Array]"};var Nm=function(t){return function(r){return function(e){return(e|0)===e?t(e):r}}},ve=function(t){return t};var Sf=isFinite;var Gl=Math.floor;var Jo=function(t){return function(r){return t%r}};var hf=function(){return Nm(k.create)(I.value)}(),nC=function(t){if(!Sf(t))return 0;if(t>=ve(Qe(Iu)))return Qe(Iu);if(t<=ve(vn(Iu)))return vn(Iu);if(ce)return ne(0)(hf(t));throw new Error("Failed pattern match at Data.Int (line 72, column 1 - line 72, column 29): "+[t.constructor.name])};var Ql=function(t){return nC(Gl(t))};var Yl=function(){function t(r){this.value0=r}return t.create=function(r){return new t(r)},t}(),jm=function(){function t(r,e){this.value0=r,this.value1=e}return t.create=function(r){return function(e){return new t(r,e)}},t}(),lC=function(){function t(r,e){this.value0=r,this.value1=e}return t.create=function(r){return function(e){return new t(r,e)}},t}(),pC=function(){function t(r,e){this.value0=r,this.value1=e}return t.create=function(r){return function(e){return new t(r,e)}},t}(),hu=U,_C=U;var $f=function(t){if(t instanceof Yl)return t.value0;if(t instanceof lC)return"Error at array index "+(Y(Ne)(t.value0)+(": "+$f(t.value1)));if(t instanceof pC)return"Error at property "+(Y(Ee)(t.value0)+(": "+$f(t.value1)));if(t instanceof jm)return"Type mismatch: expected "+(t.value0+(", found "+t.value1));throw new Error("Failed pattern match at Foreign (line 78, column 1 - line 78, column 45): "+[t.constructor.name])};var Zl=function(t){var r=fn(em(t));return function(e){return r(Am(e))}};var Eu=function(t){return function(r){return function(e){if(Tf(e)===r)return _(ra(t))(_C(e));if(ce)return Zl(t)(new jm(r,Tf(e)));throw new Error("Failed pattern match at Foreign (line 123, column 1 - line 123, column 104): "+[r.constructor.name,e.constructor.name])}}};var tp=function(){function t(r){this.value0=r}return t.create=function(r){return new t(r)},t}(),rp=function(){function t(r,e){this.value0=r,this.value1=e}return t.create=function(r){return function(e){return new t(r,e)}},t}(),ep=function(){function t(){}return t.value=new t,t}(),np=function(){function t(){}return t.value=new t,t}(),up=function(){function t(r){this.value0=r}return t.create=function(r){return new t(r)},t}(),Xm=function(t){return function(r){var e=function(b){return b===""?_(ra(sr))(um):He(function(){var d=Zl(sr);return function(v){return d(Yl.create(v))}}())(_(ra(sr)))(im(b))},n=function(){if(r.responseFormat instanceof Ml)return Eu(sr)("ArrayBuffer");if(r.responseFormat instanceof xl)return Eu(sr)("Blob");if(r.responseFormat instanceof wl)return function(b){return nt(Nl(Tc)(sr))(Eu(sr)("Document")(b))(nt(Nl(Tc)(sr))(Eu(sr)("XMLDocument")(b))(Eu(sr)("HTMLDocument")(b)))};if(r.responseFormat instanceof Po)return oi(Rl(sr))(function(b){return r.responseFormat.value0(e(b))})(Eu(sr)("String"));if(r.responseFormat instanceof Il)return Eu(sr)("String");if(r.responseFormat instanceof lf)return C(r.responseFormat.value0(_(ra(sr))(void 0)));throw new Error("Failed pattern match at Affjax (line 274, column 18 - line 283, column 57): "+[r.responseFormat.constructor.name])}(),u=function(b){if(b instanceof Hv)return new et(b.value0(hu));if(b instanceof Bv)return new et(hu(b.value0));if(b instanceof Wv)return new et(hu(b.value0));if(b instanceof Uv)return new et(hu(b.value0));if(b instanceof qv)return new et(hu(b.value0));if(b instanceof El)return Jf("Body contains values that cannot be encoded as application/x-www-form-urlencoded")(g(_r)(hu)(pm(b.value0)));if(b instanceof $l)return new et(hu(Hl(b.value0)));throw new Error("Failed pattern match at Affjax (line 235, column 20 - line 250, column 69): "+[b.constructor.name])},o=function(b){return function(d){return b instanceof k&&!pu(Dt)(ue)(Wf(gt(cu))(Fl)(b.value0))(d)?Mi(d)(b.value0):d}},c=function(b){return o(g(_r)(cf.create)(zn(be)(zv)(b)))(o(g(_r)(ff.create)(Xv(r.responseFormat)))(r.headers))},l=function(b){return{method:Dm(r.method),url:r.url,headers:g(Dr)(function(d){return{field:Fl(d),value:Jv(d)}})(c(r.content)),content:b,responseType:jv(r.responseFormat),username:Va(r.username),password:Va(r.password),withCredentials:r.withCredentials,timeout:ne(0)(g(_r)(function(d){return d})(r.timeout))}},m=function(b){return pn(Vl)(_f(Lm)(Om(Ov(t,"AffjaxTimeoutErrorMessageIdent","AffjaxRequestFailedMessageIdent",Yv.create,l(b)))))(function(d){if(d instanceof et){var v=nm(n(d.value0.body));if(v instanceof ut)return new ut(new rp(km(v.value0),d.value0));if(v instanceof et)return new et({body:v.value0,headers:d.value0.headers,status:d.value0.status,statusText:d.value0.statusText});throw new Error("Failed pattern match at Affjax (line 209, column 9 - line 211, column 52): "+[v.constructor.name])}if(d instanceof ut)return new ut(function(){var a=Oo(d.value0),y=a==="AffjaxTimeoutErrorMessageIdent";if(y)return ep.value;var K=a==="AffjaxRequestFailedMessageIdent";return K?np.value:new up(d.value0)}());throw new Error("Failed pattern match at Affjax (line 207, column 144 - line 219, column 28): "+[d.constructor.name])})};if(r.content instanceof I)return m(Va(I.value));if(r.content instanceof k){var s=u(r.content.value0);if(s instanceof et)return m(Va(new k(s.value0)));if(s instanceof ut)return _(yf)(new ut(new tp(s.value0)));throw new Error("Failed pattern match at Affjax (line 199, column 7 - line 203, column 48): "+[s.constructor.name])}throw new Error("Failed pattern match at Affjax (line 195, column 3 - line 203, column 48): "+[r.content.constructor.name])}},ap=function(t){if(t instanceof tp)return"There was a problem with the request content: "+t.value0;if(t instanceof rp)return"There was a problem with the response body: "+$f(t.value0);if(t instanceof ep)return"There was a problem making the request: timeout";if(t instanceof np)return"There was a problem making the request: request failed";if(t instanceof up)return"There was a problem making the request: "+Oo(t.value0);throw new Error("Failed pattern match at Affjax (line 113, column 14 - line 123, column 66): "+[t.constructor.name])},$u=function(){return{method:new ut(zo.value),url:"/",headers:[],content:I.value,username:I.value,password:I.value,withCredentials:!1,responseFormat:Kv,timeout:I.value}}();var op={newXHR:function(){return new XMLHttpRequest},fixupUrl:function(t){return t||"/"}};var Km=Xm(op);var Ym=function(){function t(){}return t.value=new t,t}(),ip=function(){function t(r){this.value0=r}return t.create=function(r){return new t(r)},t}(),DC=function(){return J.value}(),Qm="Click to get some random user data.",bC=function(t){return fr(C(function(){return t(Ym.value)(),Jl(it(Xl)(Km({method:new ut(zo.value),url:"https://randomuser.me/api/",headers:$u.headers,content:$u.content,username:$u.username,password:$u.password,withCredentials:$u.withCredentials,responseFormat:Gv,timeout:$u.timeout}))(function(e){if(e instanceof ut)return Ge(gf)(t(new ip("GET /api response failed to decode: "+ap(e.value0))));if(e instanceof et)return Ge(gf)(t(new ip(Bl(2)(e.value0.body))));throw new Error("Failed pattern match at Deku.Example.Docs.Effects (line 44, column 9 - line 51, column 48): "+[e.constructor.name])}))()}))},Zm=function(t){return Rr({reflectType:function(){return`<div>
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
</div>`}})()()(er()(zr()(er()(xr)({reflectType:function(){return"result"}})({reflectSymbol:function(){return"result"}}))({reflectType:function(){return"next"}})({reflectSymbol:function(){return"next"}}))({reflectType:function(){return"code"}})({reflectSymbol:function(){return"code"}}))(DC)({code:rr(hr([Sr([Wt(yl)])])),result:rr(wa(function(r){return function(e){var n=se(nn)(function(c){return c instanceof Ym?new k(new ut(void 0)):c instanceof ip?new k(new et(c.value0)):I.value})(e),u=se(nn)(function(c){return c instanceof et?new k(c.value0):I.value})(n),o=se(nn)(function(c){return c instanceof ut?new k(void 0):I.value})(n);return Yt([Yt([fe(_(V)(Z(dr)(cr.value)(bC(r))))([we(nt(Ut)(_(V)(Qm))(nt(Ut)(R(Qt)(o)("Loading..."))(R(Qt)(u)(Qm))))])]),Xe(nt(Ut)(_(V)(Z(al)(re.value)("display: none;")))(R(Qt)(Ju(Fo)(Gu(ie)(function(c){return function(l){return new H(l&&!1,function(){return l?new k(void 0):I.value}())}})(u)(!0)))(Z(al)(re.value)("display: block;"))))([hr([Sr([we(nt(Ut)(_(V)(""))(u))])])])])}})),next:mr(Dt)(D)(_(V))([Z(dr)(cr.value)(fr(function(r){return Rt(tr)(Rt(tr)(Nr(r))(t.dpage(Ha.value)))(Qr)})),Z(Or)(Mr.value)(t.slug+"pursx2/")])})};var fp=function(){function t(){}return t.value=new t,t}(),tD={attr:function(t){return function(r){return i({key:"controls",value:S(r)})}}};var Xo=function(){function t(){}return t.value=new t,t}();var Ff={attr:function(t){return function(r){return i({key:"input",value:N(r)})}}};var Mf=function(){function t(){}return t.value=new t,t}();var cp={attr:function(t){return function(r){return i({key:"keyup",value:N(r)})}}};var lp=function(){function t(){}return t.value=new t,t}();var nD={attr:function(t){return function(r){return i({key:"src",value:S(r)})}}};var pp=function(){function t(){}return t.value=new t,t}(),uD={attr:function(t){return function(r){return i({key:"width",value:S(r)})}}};var aD=function(t){return function(r){return new T($("p")(t)(E(r)))}},_p=aD(A(D));var sp=function(t){return function(r){return new T($("source")(t)(E(r)))}};var vp=function(t){return function(r){return new T($("video")(t)(E(r)))}};function xf(t){return function(){return t.value}}function mp(t){return function(){return t.valueAsNumber}}function iD(t,r,e,n){if(typeof window<"u"){var u=window[e];if(u!=null&&n instanceof u)return r(n)}for(var o=n;o!=null;){var c=Object.getPrototypeOf(o),l=c.constructor.name;if(l===e)return r(n);if(l==="Object")return t;o=c}return t}var j=function(t){return function(r){return iD(I.value,k.create,t,r)}};var wf=j("HTMLInputElement");function Dp(t){return t.code}var bp=j("KeyboardEvent");var If=function(){var t=nt(Ut)(_(V)(Z(Zi)(Yu.value)("range"))),r=g(Qt)(function(e){return Z(Ff)(Xo.value)(fr(function(n){return Ir(br)(Kr)(it(be)(af(n))(wf))(ii(Hu)(mp)(e))}))});return function(e){return t(r(e))}}();var Lf=function(t){return function(r){return function(e){return g(t)(function(){var n=Z(e)(cr.value);return function(u){return n(function(o){return o(Pt(r))}(u))}}())}}};var PC=function(){return J.value}(),pD=function(t){return Rr({reflectType:function(){return`<div>
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
</div>`}})()()(er()(zr()(er()(xr)({reflectType:function(){return"result"}})({reflectSymbol:function(){return"result"}}))({reflectType:function(){return"next"}})({reflectSymbol:function(){return"next"}}))({reflectType:function(){return"code"}})({reflectSymbol:function(){return"code"}}))(PC)({code:rr(hr([Sr([Wt(kl)])])),result:rr(Gi()(Ea({reflectSymbol:function(){return"buttonClicked"}})()()(Ea({reflectSymbol:function(){return"sliderMoved"}})()()(Ui)()())()())(J.value)(function(r){return function(e){return Yt([fe(Lf(Qt)(co)(La)(_(V)(r.buttonClicked)))([Wt("Click")]),Yt([we(nt(Ut)(_(V)("Val: 0"))(g(Qt)(function(){var n=B(Un)("Val: "),u=Y(Ne);return function(o){return n(u(o))}}())(ku(ie)(C(wr(he)(1)))(nt(Ut)(_(V)(void 0))(e.buttonClicked))(-1))))]),Yt([tu(If(_(V)(r.sliderMoved)))([]),Yt([we(nt(Ut)(_(V)("Val: 50.0"))(g(Qt)(function(){var n=B(Un)("Val: "),u=Y(io);return function(o){return n(u(o))}}())(e.sliderMoved)))])])])}})),next:mr(Dt)(D)(_(V))([Z(dr)(cr.value)(fr(function(r){return Rt(tr)(Rt(tr)(Nr(r))(t.dpage(Wa.value)))(Qr)})),Z(Or)(Mr.value)(t.slug+"effects/")])})};var RC=function(){function t(){}return t.value=new t,t}(),dp=function(){function t(){}return t.value=new t,t}(),_D=function(){function t(r){this.value0=r}return t.create=function(r){return new t(r)},t}(),NC=function(){return J.value}(),sD=function(t){return Rr({reflectType:function(){return`<div>
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
</div>`}})()()(er()(zr()(er()(xr)({reflectType:function(){return"result"}})({reflectSymbol:function(){return"result"}}))({reflectType:function(){return"next"}})({reflectSymbol:function(){return"next"}}))({reflectType:function(){return"code"}})({reflectSymbol:function(){return"code"}}))(NC)({code:rr(hr([Sr([Wt(Al)])])),result:rr(wa(function(r){return Ue(We)(function(e){return nt(Ut)(_(V)(RC.value))(e)})(function(e){return Yt([Yt([tu(mr(Dt)(D)(_(V))([Z(yv)(re.value)("border-style:solid;border-width: 1px;border-color: black;"),Z(Ff)(Xo.value)(fr(function(n){return Ir(br)(Kr)(it(be)(af(n))(wf))(ii(Hu)(xf)(function(u){return r(_D.create(u))}))})),Z(cp)(Mf.value)(fr(function(n){return Ir(br)(Kr)(bp(n))(function(u){return Bn(br)(Dp(u)==="Enter")(r(dp.value))})}))]))([]),fe(nt(Ut)(_(V)(Z(Qi)(re.value)("margin: 5px;")))(_(V)(Z(dr)(cr.value)(fr(C(r(dp.value)))))))([Wt("Add")])]),Ia(Xe)(g(Qt)(function(n){return Xu(ie)(Cu(function(u){return function(o){return nt(Ut)(_(V)(Qu(Yt([wn(_(V)(Z(Pa)(re.value)("margin: 5px;")))([Wt(n)]),fe(nt(Ut)(_(V)(Z(Qi)(re.value)("margin: 5px;")))(_(V)(Z(dr)(cr.value)(fr(C(u(bv)))))))([Wt("Prioritize")]),fe(nt(Ut)(_(V)(Z(Qi)(re.value)("margin: 5px;")))(_(V)(Z(dr)(cr.value)(fr(C(u(ul)))))))([Wt("Delete")])]))))(o)}}))})(se(nn)(function(n){return n.value0?new k(n.value1):I.value})(Gu(ie)(function(n){return function(u){return n instanceof _D?new H(n.value0,new H(!1,n.value0)):n instanceof dp?new H(u,new H(!0,u)):new H("",new H(!1,""))}})(e)(""))))])})})),next:mr(Dt)(D)(_(V))([Z(dr)(cr.value)(fr(function(r){return Rt(tr)(Rt(tr)(Nr(r))(t.dpage(qa.value)))(Qr)})),Z(Or)(Mr.value)(t.slug+"portals/")])})};var BC=function(){return J.value}(),vD=function(t){return Rr({reflectType:function(){return`<div>
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
</div>`}})()()(er()(zr()(er()(xr)({reflectType:function(){return"result"}})({reflectSymbol:function(){return"result"}}))({reflectType:function(){return"next"}})({reflectSymbol:function(){return"next"}}))({reflectType:function(){return"code"}})({reflectSymbol:function(){return"code"}}))(BC)({code:rr(hr([Sr([Wt(dl)])])),result:rr(Yt([Wt("Hello world")])),next:mr(Dt)(D)(_(V))([Z(dr)(cr.value)(fr(function(r){return Rt(tr)(Rt(tr)(Nr(r))(t.dpage(Ra.value)))(Qr)})),Z(Or)(Mr.value)(t.slug+"component/")])})};var UC=function(){return J.value}(),mD=function(t){return Rr({reflectType:function(){return`<div>
  <h1>Deku</h1>

  <h3>A web micro-framework written in PureScript</h3>

  <p>Hi! You've found <a href="https://github.com/mikesol/purescript-deku">Deku</a>.</p>

  <p>Deku is the coolest web micro-framework that no one knows about yet. Except you, of course, as you're here. So welcome!</p>

  <p>The main goal of Deku is speed. I made it for the purpose of creating interactive web-based musical instruments, but it's equally useful as a general-purpose web framework. Its standard event-handling patterns tend to outperform those of React and Vue by a factor of 1.5-2x.</p>

  <p>This documentation is written in Deku and can be found <a href="https://github.com/mikesol/purescript-deku/tree/main/examples/docs">here</a>. One good way to follow along is by using the Deku starter repo, which you can clone <a href="https://github.com/mikesol/purescript-deku-starter">here</a>.</p>

  <p>And now, without further ado, check out the <a ~next~ style="cursor:pointer;">hello world section</a>!</p>
</div>`}})()()(zr()(xr)({reflectType:function(){return"next"}})({reflectSymbol:function(){return"next"}}))(UC)({next:mr(Dt)(D)(_(V))([Z(dr)(cr.value)(fr(function(r){return Rt(tr)(Rt(tr)(Nr(r))(t.dpage(Oa.value)))(Qr)})),Z(Or)(Mr.value)(t.slug+"hello/")])})};var zC=function(){return J.value}(),DD=function(t){return Rr({reflectType:function(){return`<div>
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
</div>`}})()()(er()(zr()(er()(xr)({reflectType:function(){return"result"}})({reflectSymbol:function(){return"result"}}))({reflectType:function(){return"next"}})({reflectSymbol:function(){return"next"}}))({reflectType:function(){return"code"}})({reflectSymbol:function(){return"code"}}))(zC)({code:rr(hr([Sr([Wt(bl)])])),result:rr(Ia(Xe)(Cu(function(r){return Ue(We)(nt(Ut)(_(V)(void 0)))(function(e){return _(V)(Qu(Av()(g(Ma)(function(n){return vp(mr(Dt)(D)(_(V))([Z(tD)(fp.value)("true"),Z(uD)(pp.value)("250")]))([sp(mr(Dt)(D)(_(V))([Z(nD)(lp.value)(n),Z(Tv)(Yu.value)("video/mp4")]))([])])})(Gc()()("https://interactive-examples.mdn.mozilla.net/media/cc0-videos/flower.mp4")(Gc()()("https://www.w3schools.com/jsref/movie.mp4")(fv))))(function(n){return function(u){var o=Xc()()()()()({reflectType:function(){return 1}})(J.value)(n),c=Xc()()()()()({reflectType:function(){return 0}})(J.value)(n),l=ku(ie)(C(Be(ue)))(e),m=function(){var s=Ki(wn)(function(b){return b?c:o});return function(b){return s(l(b))}}();return Yt([fe(_(V)(Z(dr)(cr.value)(fr(C(r(void 0))))))([Wt("Switch videos")]),Yt([m(!0),m(!1)])])}})))})}))),next:mr(Dt)(D)(_(V))([Z(dr)(cr.value)(fr(function(r){return Rt(tr)(Rt(tr)(Nr(r))(t.dpage(za.value)))(Qr)})),Z(Or)(Mr.value)(t.slug+"ssr/")])})};var JC=function(){return J.value}(),jC=function(){return J.value}(),bD=function(t){return Rr({reflectType:function(){return`<div>
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
</div>`}})()()(er()(zr()(er()(xr)({reflectType:function(){return"result"}})({reflectSymbol:function(){return"result"}}))({reflectType:function(){return"next"}})({reflectSymbol:function(){return"next"}}))({reflectType:function(){return"code"}})({reflectSymbol:function(){return"code"}}))(JC)({code:rr(hr([Sr([Wt(Dl)])])),result:rr(xv({reflectType:function(){return`<div>
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
`}})()(xr)(jC)),next:mr(Dt)(D)(_(V))([Z(dr)(cr.value)(fr(function(r){return Rt(tr)(Rt(tr)(Nr(r))(t.dpage(Ba.value)))(Qr)})),Z(Or)(Mr.value)(t.slug+"events1/")])})};var GC=function(){return J.value}(),KC=function(){return J.value}(),dD=function(t){return vl({reflectType:function(){return`<div>
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
</div>`}})({reflectType:function(){return"?"}})()()(er()(zr()(er()(xr)({reflectType:function(){return"result"}})({reflectSymbol:function(){return"result"}}))({reflectType:function(){return"next"}})({reflectSymbol:function(){return"next"}}))({reflectType:function(){return"code"}})({reflectSymbol:function(){return"code"}}))(J.value)(GC)({code:rr(hr([Sr([Wt(ml)])])),result:rr(Ia(Xe)(Cu(function(r){return function(e){return _(V)(Qu(Rr({reflectType:function(){return`<div>
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
`}})()()(zr()(er()(xr)({reflectType:function(){return"somethingNew"}})({reflectSymbol:function(){return"somethingNew"}}))({reflectType:function(){return"myli"}})({reflectSymbol:function(){return"myli"}}))(KC)({myli:_(V)(Z(kv)(re.value)("background-color:rgb(200,240,210);")),somethingNew:rr(fe(_(V)(Z(La)(cr.value)(r(new k(void 0)))))([we(nt(Ut)(R(Qt)(Ju(Fo)(e))("Thanks for clicking me!"))(_(V)("I was dynamically inserted")))]))})))}}))),next:mr(Dt)(D)(_(V))([Z(dr)(cr.value)(fr(function(r){return Rt(tr)(Rt(tr)(Nr(r))(t.dpage(Ua.value)))(Qr)})),Z(Or)(Mr.value)(t.slug+"events2/")])})};var AD=(t,r,e,n)=>{t(u=>n.units[u].main.appendChild(n.units[r].main))(e)},Ap=t=>()=>{t.hydrating=!0},kp=t=>()=>{t.hydrating=!1},kD=t=>r=>e=>()=>{e.units[r.id].main.parentNode||t(r.pos)(u=>()=>e.units[r.parent].main.children[u]?(e.units[r.parent].main.insertBefore(e.units[r.id].main,e.units[r.parent].main.children[u]),!0):!1)()||(r.parent.indexOf("@!%")!==-1?e.units[r.parent].main.parentNode.replaceChild(e.units[r.id].main,e.units[r.parent].main):e.units[r.parent].main.appendChild(e.units[r.id].main))},yD=t=>r=>e=>n=>()=>{var u,o=e.id;n.scopes[e.scope]||(n.scopes[e.scope]=[]),n.scopes[e.scope].push(o),t(e.parent)(()=>()=>n.hydrating&&r&&(u=document.body.querySelectorAll("[data-deku-ssr-"+o+"]").item(0))?(n.units[o]={listeners:{},parent:e.parent,scope:e.scope,main:u},!0):!1)()||(n.units[o]={listeners:{},parent:e.parent,scope:e.scope,main:document.createElement(e.tag)})},gD=t=>r=>e=>n=>u=>()=>{var o=n.id,c;u.scopes[n.scope]||(u.scopes[n.scope]=[]),u.scopes[n.scope].push(o),t(n.parent)(m=>()=>{if(u.hydrating&&r&&(c=document.body.querySelectorAll("[data-deku-ssr-"+m+"]").item(0))){var s=0;if(c.childNodes.length===1)c.prepend(document.createTextNode(""));else for(var s=0;s<c.childNodes.length;s++)if(c.childNodes[s].nodeType===8&&c.childNodes[s].nodeValue===o){s=s-1;break}return u.units[o]={main:c.childNodes[s],parent:n.parent,scope:n.scope},!0}return!1})()||(u.units[o]={main:document.createTextNode(""),parent:n.parent,scope:n.scope},AD(e,o,n.parent,u))};function yp(){return{units:{},scopes:{}}}var CD=t=>r=>e=>()=>{var n=r.id,u=r.value;e.hydrating&&t&&!e.units[n]&&(dom=document.body.querySelectorAll("[data-deku-ssr-"+n+"]").item(0))&&(e.units[n]={listeners:{},parent:r.parent,scope:r.scope,main:dom},e.scopes[r.scope]||(e.scopes[r.scope]=[]),e.scopes[r.scope].push(n)),e.units[n].main.tagName==="INPUT"&&r.key==="value"?e.units[n].main.value=u:e.units[n].main.tagName==="INPUT"&&r.key==="checked"?e.units[n].main.checked=u==="true":e.units[n].main.setAttribute(r.key,u)},TD=t=>r=>e=>()=>{var n=r.id,u=r.value;if(e.hydrating&&t&&!e.units[n]&&(dom=document.body.querySelectorAll("[data-deku-ssr-"+n+"]").item(0))&&(e.units[n]={listeners:{},parent:r.parent,scope:r.scope,main:dom},e.scopes[r.scope]||(e.scopes[r.scope]=[]),e.scopes[r.scope].push(n)),r.key==="@self@")u(e.units[n].main)();else{e.units[n].listeners[r.key]&&e.units[n].main.removeEventListener(r.key,e.units[n].listeners[r.key]);var o=c=>u(c)();e.units[n].main.addEventListener(r.key,o),e.units[n].listeners[r.key]=o}},SD=t=>r=>()=>{var e=t.id;r.units[e].main.nodeValue=t.text},hD=t=>r=>e=>n=>u=>()=>{var o,c,l=n.id,m=n.html,s=n.verb,b=n.cache,d=n.parent,v=n.scope,a=n.pxScope;if(!t(n.parent)(()=>()=>u.hydrating&&r&&(o=document.body.querySelectorAll("[data-deku-ssr-"+l+"]").item(0))?(u.units[l]={listeners:{},scope:v,parent:d,main:o},!0):!1)()){let vt=Object.entries(b);for(var K=0;K<vt.length;K++){let Jt=vt[K][0];vt[K][1]===!0?m=m.replace(s+Jt+s,'data-deku-attr-internal="'+Jt+'"'):m=m.replace(s+Jt+s,'<span style="display:contents;" data-deku-elt-internal="'+Jt+'"></span>')}c=document.createElement("div"),c.innerHTML=m.trim(),u.units[l]={listeners:{},scope:v,parent:d,main:c.firstChild}}u.scopes[v]||(u.scopes[v]=[]),u.scopes[v].push(l),c||(c=o),c.querySelectorAll("[data-deku-attr-internal]").forEach(function(vt){var Jt=vt.getAttribute("data-deku-attr-internal");let lr=Jt+"@!%"+a;u.units[lr]={listeners:{},main:vt,scope:v},u.scopes[v].push(lr)}),c.querySelectorAll("[data-deku-elt-internal]").forEach(function(vt){var Jt=vt.getAttribute("data-deku-elt-internal");let lr=Jt+"@!%"+a;u.units[Jt+"@!%"+a]={listeners:{},main:vt,scope:v},u.scopes[v].push(lr)}),o||AD(e,l,d,u)},ED=t=>r=>()=>{var e=t.id;r.units[e]={main:t.root}},$D=t=>r=>()=>{var e=t.id,n=t.parent;r.units[e].containingScope=t.scope,r.units[n].main.prepend(r.units[e].main)},FD=t=>r=>()=>{var e=t.id;r.units[e].noop||r.units[e].containingScope&&!t.scopeEq(r.units[e].containingScope)(t.scope)||r.units[e].main.remove()},MD=t=>r=>()=>{delete r.units[t.id]},xD=t=>r=>()=>{var e=t.id,n=t.pos,u=r.units[e].main.parentNode;u.insertBefore(r.units[e].main,u.children.length<=n?u.children[u.children.length-1]:n<0?u.children[0]:u.children[n])};var wD=function(t){return t};var eT=1,gp=2147483647,nT=function(){return gp-1|0}(),Cp=function(t){var r=function(e){return function(n){return function(u){var o=n-e|0,c=fo(fi)(u)(o),l=c<e;return l?c+n|0:c}}};return r(eT)(nT)(t)};var uT=0,aT=48271,ID=function(t){return function(r){return De()(hf(Jo(ve(aT)*ve(r)+ve(t))(ve(gp))))}},LD=ID(uT);var _T=function(){function t(c){this.fn=c}var r={},e=function(c,l){this.head=c,this.tail=l};function n(c){return new e(c,r)}function u(c){return function(l){return new e(c,l)}}function o(c){for(var l=[],m=c;m!==r;)l.push(m.head),m=m.tail;return l}return function(c){return function(l){return function(m){var s=function(d,v){return c(l(u)(m(d)))(v)},b=function(d,v,a){if(v===0)return d;var y=a[v-1];return new t(function(){var K=b(s(y,d),v-1,a);return K})};return function(d){for(var v=l(n)(m(d[d.length-1])),a=b(v,d.length-1,d);a instanceof t;)a=a.fn();return l(o)(a)}}}}}();var Ga=function(t){return{map:function(r){return function(e){return function(n){return g(t)(function(u){return new H(r(u.value0),u.value1)})(e(n))}}}}};var hp=function(t){return{Applicative0:function(){return ea(t)},Bind1:function(){return Pf(t)}}},Pf=function(t){return{bind:function(r){return function(e){return function(n){return it(t.Bind1())(r(n))(function(u){var o=e(u.value0);return o(u.value1)})}}},Apply0:function(){return Of(t)}}},Of=function(t){return{apply:qe(hp(t)),Functor0:function(){return Ga(t.Bind1().Apply0().Functor0())}}},ea=function(t){return{pure:function(r){return function(e){return _(t.Applicative0())(new H(r,e))}},Apply0:function(){return Of(t)}}};var Go=function(t){return{state:function(r){var e=_(t.Applicative0());return function(n){return e(r(n))}},Monad0:function(){return hp(t)}}};var UD=function(t){return function(r){var e=t(r);return e.value1}},qD=function(t){return function(r){var e=t(r);return e.value0}};var FT=function(t){return t};var MT=function(){var t=function(r){return new H(wD(r.newSeed),function(){var e={};for(var n in r)({}).hasOwnProperty.call(r,n)&&(e[n]=r[n]);return e.newSeed=LD(r.newSeed),e}())};return Pn(Go(sr))(t)}();var Ko=Ga(An);var $p=function(t){return qD(FT(t))};var JD=Of(sr),VD=function(t){return function(r){var e=ve(r),n=ve(t),u=function(l){return n+Jo(l)(e-n+1)},o=g(Ko)(ve)(MT),c=It(JD)(g(Ko)(wr(ao))(o))(g(Ko)(Re(ao)(2))(o));return g(Ko)(function(l){return Ql(u(l))})(c)}},jD=function(t){return function(r){var e=t<=r;return e?VD(t)(r):VD(r)(t)}};var Fp=function(t){return t.arbitrary};var Mp=function(){return{arbitrary:jD(-1e6)(1e6)}}();var Qo=function(){function t(r){this.value0=r}return t.create=function(r){return new t(r)},t}(),Yo=function(){function t(r){this.value0=r}return t.create=function(r){return new t(r)},t}(),Nf=function(){function t(r){this.value0=r}return t.create=function(r){return new t(r)},t}(),Hf=function(){function t(r){this.value0=r}return t.create=function(r){return new t(r)},t}(),Zo=function(){function t(r){this.value0=r}return t.create=function(r){return new t(r)},t}(),wT=function(t){return function(r){return at(Ht)(Ur(function(e){return B(or)(e)([new Zo(t)])})(r))}},IT=function(t){return function(r){return at(Ht)(Ur(function(e){return B(or)(e)([new Hf(t)])})(r))}},LT=function(t){return function(r){return at(Ht)(Ur(function(e){return B(or)(e)([new Yo(t)])})(r))}},PT=function(t){return function(r){return at(Ht)(Ur(function(e){return B(or)(e)([new Nf(t)])})(r))}},OT=function(t){return function(r){return at(Ht)(Ur(function(e){return B(or)(e)([new Qo(t)])})(r))}},GD=function(t){return{ids:function(){var e=Pr(t)(),n=Y(Ne)($p(Fp(Mp))({newSeed:Cp(e),size:5}));return at(Ht)(Ur(wr(he)(1))(t))(),n},makeElement:OT,attributeParent:function(r){return function(e){return _(Lt)(void 0)}},makeRoot:function(r){return function(e){return _(Lt)(void 0)}},makeText:LT,makePursx:PT,setProp:IT,setCb:function(r){return function(e){return _(Lt)(void 0)}},setText:wT,sendToPos:function(r){return function(e){return _(Lt)(void 0)}},deleteFromCache:function(r){return function(e){return _(Lt)(void 0)}},giveNewParent:function(r){return function(e){return _(Lt)(void 0)}},disconnectElement:function(r){return function(e){return _(Lt)(void 0)}}}},Rf=function(t){return function(r){return t instanceof k?r(t.value0):_(br)(!1)}},KD=function(t){return{ids:function(){var e=Pr(t)(),n=Y(Ne)($p(Fp(Mp))({newSeed:Cp(e),size:5}));return at(Ht)(Ur(wr(he)(1))(t))(),n},makeElement:yD(Rf)(!0),attributeParent:kD(Rf),makeRoot:ED,makeText:gD(Rf)(!0)(Xt(void 0)),makePursx:hD(Rf)(!0)(Xt(void 0)),setProp:CD(!0),setCb:TD(!0),setText:SD,sendToPos:xD,deleteFromCache:MD,giveNewParent:$D,disconnectElement:FD}};var xp=t=>t.replace(/[\u00A0-\u9999<>\&]/g,function(r){return"&#"+r.charCodeAt(0)+";"}),wp=({id:t,html:r,pxScope:e,cache:n,verb:u})=>{let o=r,c=Object.entries(n);for(var l=0;l<c.length;l++){let d=c[l][0];c[l][1]===!0?o=o.replace(u+d+u,'data-deku-attr-internal="'+d+'" data-deku-ssr-'+d+"@!%"+e+'="true"'):o=o.replace(u+d+u,'<span style="display:contents;" data-deku-elt-internal="'+d+'" data-deku-ssr-'+d+"@!%"+e+'="true"></span>')}let m=o.indexOf(">"),s=o.indexOf("/>"),b=s==m-1?s:m;return o.slice(0,b)+" data-deku-ssr-"+t+'="true" '+o.slice(b)};var YD=function(t){return function(r){var e=function(d){return function(v){return at(Ga(An))(ja(Go(sr))(function(a){var y={};for(var K in a)({}).hasOwnProperty.call(a,K)&&(y[K]=a[K]);return y.idToActions=$n(Zr)(function(vt){if(vt instanceof k)return new k(B(or)(vt.value0)([v]));if(vt instanceof I)return new k([v]);throw new Error("Failed pattern match at Deku.SSR (line 46, column 17 - line 48, column 45): "+[vt.constructor.name])})(d)(a.idToActions),y}))}},n=function(d){return function(v){return function(a){return ia(fa)(Pf(sr))(at(Ga(An))(ja(Go(sr))(function(y){var K={};for(var vt in y)({}).hasOwnProperty.call(y,vt)&&(K[vt]=y[vt]);return K.parentToChild=$n(Zr)(function(Jt){if(Jt instanceof k)return new k(B(or)(Jt.value0)([v]));if(Jt instanceof I)return new k([v]);throw new Error("Failed pattern match at Deku.SSR (line 33, column 17 - line 35, column 41): "+[Jt.constructor.name])})(d)(y.parentToChild),K})))(function(){return e(v)(a)})}}},u=UD(ge(Xn)(ea(sr))(function(d){if(d instanceof Qo)return Ir(ea(sr))(Kr)(d.value0.parent)(function(v){return n(v)(d.value0.id)(d)});if(d instanceof Yo)return Ir(ea(sr))(Kr)(d.value0.parent)(function(v){return n(v)(d.value0.id)(d)});if(d instanceof Nf)return Ir(ea(sr))(Kr)(d.value0.parent)(function(v){return n(v)(d.value0.id)(d)});if(d instanceof Hf||d instanceof Zo)return e(d.value0.id)(d);throw new Error("Failed pattern match at Deku.SSR (line 56, column 17 - line 63, column 43): "+[d.constructor.name])})(r))({parentToChild:En,idToActions:En}),o=function(d){return oa(kc(function(v){return v instanceof Qo||v instanceof Yo})(d))},c=function(d){return ne("")(xi(function(v){return v instanceof Qo?new k(v.value0.tag):I.value})(d))},l=function(d){return Vn(Dt)(lo)(" ")(se(Ps)(function(v){return v instanceof Hf?new k(v.value0.key+('="'+(v.value0.value+'"'))):I.value})(d))},m=function(d){return Xt("")(function(v){var a=function(vt){return ne("")(xi(function(Jt){return Jt instanceof Zo?new k(xp(Jt.value0.text)+("<!--"+(d+"-->"))):I.value})(v))},y=function(vt){var Jt=c(v),lr=l(v);return"<"+(Jt+(" "+(lr+(" data-deku-ssr-"+(d+('="true">'+(s(d)+("</"+(Jt+">")))))))))},K=qu(v)(0);return K instanceof k&&K.value0 instanceof Zo?a(void 0):K instanceof k&&K.value0 instanceof Yo?a(void 0):K instanceof k&&K.value0 instanceof Nf?wp(K.value0.value0):y(void 0)})(Sa(Zr)(d)(u.idToActions))},s=function(d){var v=ne([])(Sa(Zr)(d)(u.parentToChild));return Lr(Dt)(lo)(m)(v)},b=function(d){return Ve(qr)(function(v){return function(a){return function(y){var K=o(y);if(K)return a;if(!K)return Af("data-deku-ssr-"+v)(l(y)+(" data-deku-ssr-"+v))(a);throw new Error("Failed pattern match at Deku.SSR (line 83, column 19 - line 87, column 14): "+[K.constructor.name])}}})(s(d))(u.idToActions)};return"<"+(t+(' data-deku-ssr-deku-root="true">'+(b("deku-root")+("</"+(t+">")))))}};var ZD=Mn({doLogic:function(t){return function(r){return function(e){return r.sendToPos({id:e,pos:t})}}},ids:function(){var t=$r();return function(r){return function(e){return e.ids}(t(r))}}(),disconnectElement:function(t){return function(r){return t.disconnectElement({id:r.id,scope:r.scope,parent:r.parent,scopeEq:gt(Fa)})}},toElt:function(t){return t}}),kS=function(t){return function(){var e=yp(),n=pn(L)(ye(xe)(Wr(0)))(KD)();Ap(e)();var u=Hc(ZD({parent:new k("deku-root"),scope:new yu("rootScope"),raiseId:function(o){return _(Lt)(void 0)},pos:I.value})(n)(t))(function(o){return o(e)})();return kp(e)(),u}},tb=function(t){return at(L)(kS(t))},yS=function(t){return function(r){return function(e){return g(Ht)(function(){var n=YD(t);return function(u){return function(o){return r.head+o}(function(o){return o+r.tail}(n(u)))}}())(ye(W_)(function(){var u=Wr(0)(),o=Wr([])(),c=GD(u);return at(Ht)(rv(ZD({parent:new k("deku-root"),scope:new yu("rootScope"),raiseId:function(l){return _(Lt)(void 0)},pos:I.value})(c)(e))(function(l){return l(o)}))(),Pr(o)()}))}}},rb=yS("body");var gS=function(){return J.value}(),nb=function(){return Gi()(Ea({reflectSymbol:function(){return"buttonClicked"}})()()(Ea({reflectSymbol:function(){return"sliderMoved"}})()()(Ui)()())()())(J.value)(function(t){return function(r){return Yt([_p([Wt(`Here's an example of SSR in deku.
All of the static bits are rendered as HTML,
and all of the dynamic bits are hydrated on page load.`)]),fe(Lf(Qt)(co)(La)(_(V)(t.buttonClicked)))([Wt("Click")]),Yt([we(nt(Ut)(_(V)("Val: 0"))(g(Qt)(function(){var e=B(Un)("Val: "),n=Y(Ne);return function(u){return e(n(u))}}())(ku(ie)(C(wr(he)(1)))(nt(Ut)(_(V)(void 0))(r.buttonClicked))(-1))))]),Yt([tu(If(_(V)(t.sliderMoved)))([]),Yt([we(nt(Ut)(_(V)("Val: 50"))(g(Qt)(function(){var e=B(Un)("Val: "),n=Y(io);return function(u){return e(n(u))}}())(r.sliderMoved)))])])])}})}(),ub=function(t){return Rr({reflectType:function(){return`<div>
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
</div>`}})()()(er()(er()(er()(er()(er()(xr)({reflectType:function(){return"result"}})({reflectSymbol:function(){return"result"}}))({reflectType:function(){return"codegen"}})({reflectSymbol:function(){return"codegen"}}))({reflectType:function(){return"code2"}})({reflectSymbol:function(){return"code2"}}))({reflectType:function(){return"code1"}})({reflectSymbol:function(){return"code1"}}))({reflectType:function(){return"code0"}})({reflectSymbol:function(){return"code0"}}))(gS)({code2:rr(hr([Sr([Wt(Sl)])])),code1:rr(hr([Sr([Wt(Tl)])])),code0:rr(hr([Sr([Wt(Cl)])])),result:rr(nb),codegen:rr(hr([Sr([we(Zs(function(r){return Rt(da)(it(Jn)(rb({head:'<!DOCTYPE html><html><head><script src="bundle.js" defer><\/script></head>',tail:"</html>"})(nb))(r))(_(Lt)(_(Lt)(void 0)))}))])]))})};var ab=function(t){var r=function(n){if(n instanceof rf)return mD;if(n instanceof Oa)return vD;if(n instanceof Ra)return Pv;if(n instanceof Na)return bD;if(n instanceof Ba)return pD;if(n instanceof Wa)return Zm;if(n instanceof Ha)return dD;if(n instanceof Ua)return sD;if(n instanceof qa)return DD;if(n instanceof za)return ub;throw new Error("Failed pattern match at Deku.Example.Docs.Scene (line 95, column 3 - line 95, column 25): "+[n.constructor.name])},e=function(n){return function(u){return r(u)({dpage:n,slug:t.slug})}};return wa(function(n){return Ue(We)(function(u){return nt(Ut)(_(V)(t.startsWith))(u)})(function(u){return Yt([Yt(g(Dr)(function(o){return ol([Lo(mr(Dt)(D)(_(V))([Z(dr)(cr.value)(fr(function(c){return Rt(tr)(Nr(c))(n(o.value0))})),Z(gv)(re.value)("cursor:pointer;"),Z(Or)(Mr.value)(t.slug+o.value1.value1.value0)]))([Wt(o.value1.value0)]),wn(_(V)(Z(Pa)(re.value)(function(){return o.value1.value1.value1?"":"display:none;"}())))([Wt(" | ")])])})([new H(rf.value,new H("Home",new H("",!0))),new H(Oa.value,new H("Hello world",new H("hello/",!0))),new H(Ra.value,new H("Component",new H("simple/",!0))),new H(Na.value,new H("Pursx 1",new H("pursx1/",!0))),new H(Ba.value,new H("Events 1",new H("events1/",!0))),new H(Wa.value,new H("Effects",new H("effects/",!0))),new H(Ha.value,new H("Pursx 2",new H("pursx2/",!0))),new H(Ua.value,new H("Events 2",new H("events2/",!0))),new H(qa.value,new H("Portals",new H("portals/",!0))),new H(za.value,new H("SSR",new H("ssr/",!1)))])),Ki(Xe)(e(n))(u)])})})};var Zbt=function(t){return function(){var e=Xt(Ro(Ja("could not ingest options: "+Y(u_()()(zf({reflectSymbol:function(){return"slug"}})(zf({reflectSymbol:function(){return"startsWith"}})(e_)(Ee))(Ee)))(t))))(_(br))(Mv(t.startsWith))();return tb(ab({slug:t.slug,startsWith:e}))()}};export{Zbt as main};
