module Deku.Graph.DOM.Shorthand where

import Prelude

import Deku.Graph.Attribute (Attribute)
import Deku.Graph.DOM as D

text :: String -> { t :: D.Element D.Text () }
text = { t: _ } <<< D.text

-- codegen 9
a
  :: forall children
   . Array (Attribute D.A_)
  -> { | children }
  -> { a :: D.Element D.A_ children }
a attrs children = { a: _ } $ D.a attrs children
abbr
  :: forall children
   . Array (Attribute D.Abbr_)
  -> { | children }
  -> { abbr :: D.Element D.Abbr_ children }
abbr attrs children = { abbr: _ } $ D.abbr attrs children
acronym
  :: forall children
   . Array (Attribute D.Acronym_)
  -> { | children }
  -> { acronym :: D.Element D.Acronym_ children }
acronym attrs children = { acronym: _ } $ D.acronym attrs children
address
  :: forall children
   . Array (Attribute D.Address_)
  -> { | children }
  -> { address :: D.Element D.Address_ children }
address attrs children = { address: _ } $ D.address attrs children
applet
  :: forall children
   . Array (Attribute D.Applet_)
  -> { | children }
  -> { applet :: D.Element D.Applet_ children }
applet attrs children = { applet: _ } $ D.applet attrs children
area
  :: forall children
   . Array (Attribute D.Area_)
  -> { | children }
  -> { area :: D.Element D.Area_ children }
area attrs children = { area: _ } $ D.area attrs children
article
  :: forall children
   . Array (Attribute D.Article_)
  -> { | children }
  -> { article :: D.Element D.Article_ children }
article attrs children = { article: _ } $ D.article attrs children
aside
  :: forall children
   . Array (Attribute D.Aside_)
  -> { | children }
  -> { aside :: D.Element D.Aside_ children }
aside attrs children = { aside: _ } $ D.aside attrs children
audio
  :: forall children
   . Array (Attribute D.Audio_)
  -> { | children }
  -> { audio :: D.Element D.Audio_ children }
audio attrs children = { audio: _ } $ D.audio attrs children
b
  :: forall children
   . Array (Attribute D.B_)
  -> { | children }
  -> { b :: D.Element D.B_ children }
b attrs children = { b: _ } $ D.b attrs children
base
  :: forall children
   . Array (Attribute D.Base_)
  -> { | children }
  -> { base :: D.Element D.Base_ children }
base attrs children = { base: _ } $ D.base attrs children
basefont
  :: forall children
   . Array (Attribute D.Basefont_)
  -> { | children }
  -> { basefont :: D.Element D.Basefont_ children }
basefont attrs children = { basefont: _ } $ D.basefont attrs children
bdi
  :: forall children
   . Array (Attribute D.Bdi_)
  -> { | children }
  -> { bdi :: D.Element D.Bdi_ children }
bdi attrs children = { bdi: _ } $ D.bdi attrs children
bdo
  :: forall children
   . Array (Attribute D.Bdo_)
  -> { | children }
  -> { bdo :: D.Element D.Bdo_ children }
bdo attrs children = { bdo: _ } $ D.bdo attrs children
big
  :: forall children
   . Array (Attribute D.Big_)
  -> { | children }
  -> { big :: D.Element D.Big_ children }
big attrs children = { big: _ } $ D.big attrs children
blockquote
  :: forall children
   . Array (Attribute D.Blockquote_)
  -> { | children }
  -> { blockquote :: D.Element D.Blockquote_ children }
blockquote attrs children = { blockquote: _ } $ D.blockquote attrs children
body
  :: forall children
   . Array (Attribute D.Body_)
  -> { | children }
  -> { body :: D.Element D.Body_ children }
body attrs children = { body: _ } $ D.body attrs children
br
  :: forall children
   . Array (Attribute D.Br_)
  -> { | children }
  -> { br :: D.Element D.Br_ children }
br attrs children = { br: _ } $ D.br attrs children
button
  :: forall children
   . Array (Attribute D.Button_)
  -> { | children }
  -> { button :: D.Element D.Button_ children }
button attrs children = { button: _ } $ D.button attrs children
canvas
  :: forall children
   . Array (Attribute D.Canvas_)
  -> { | children }
  -> { canvas :: D.Element D.Canvas_ children }
canvas attrs children = { canvas: _ } $ D.canvas attrs children
caption
  :: forall children
   . Array (Attribute D.Caption_)
  -> { | children }
  -> { caption :: D.Element D.Caption_ children }
caption attrs children = { caption: _ } $ D.caption attrs children
center
  :: forall children
   . Array (Attribute D.Center_)
  -> { | children }
  -> { center :: D.Element D.Center_ children }
center attrs children = { center: _ } $ D.center attrs children
cite
  :: forall children
   . Array (Attribute D.Cite_)
  -> { | children }
  -> { cite :: D.Element D.Cite_ children }
cite attrs children = { cite: _ } $ D.cite attrs children
code
  :: forall children
   . Array (Attribute D.Code_)
  -> { | children }
  -> { code :: D.Element D.Code_ children }
code attrs children = { code: _ } $ D.code attrs children
col
  :: forall children
   . Array (Attribute D.Col_)
  -> { | children }
  -> { col :: D.Element D.Col_ children }
col attrs children = { col: _ } $ D.col attrs children
colgroup
  :: forall children
   . Array (Attribute D.Colgroup_)
  -> { | children }
  -> { colgroup :: D.Element D.Colgroup_ children }
colgroup attrs children = { colgroup: _ } $ D.colgroup attrs children
xdata
  :: forall children
   . Array (Attribute D.Xdata_)
  -> { | children }
  -> { xdata :: D.Element D.Xdata_ children }
xdata attrs children = { xdata: _ } $ D.xdata attrs children
datalist
  :: forall children
   . Array (Attribute D.Datalist_)
  -> { | children }
  -> { datalist :: D.Element D.Datalist_ children }
datalist attrs children = { datalist: _ } $ D.datalist attrs children
dd
  :: forall children
   . Array (Attribute D.Dd_)
  -> { | children }
  -> { dd :: D.Element D.Dd_ children }
dd attrs children = { dd: _ } $ D.dd attrs children
del
  :: forall children
   . Array (Attribute D.Del_)
  -> { | children }
  -> { del :: D.Element D.Del_ children }
del attrs children = { del: _ } $ D.del attrs children
details
  :: forall children
   . Array (Attribute D.Details_)
  -> { | children }
  -> { details :: D.Element D.Details_ children }
details attrs children = { details: _ } $ D.details attrs children
dfn
  :: forall children
   . Array (Attribute D.Dfn_)
  -> { | children }
  -> { dfn :: D.Element D.Dfn_ children }
dfn attrs children = { dfn: _ } $ D.dfn attrs children
dialog
  :: forall children
   . Array (Attribute D.Dialog_)
  -> { | children }
  -> { dialog :: D.Element D.Dialog_ children }
dialog attrs children = { dialog: _ } $ D.dialog attrs children
dir
  :: forall children
   . Array (Attribute D.Dir_)
  -> { | children }
  -> { dir :: D.Element D.Dir_ children }
dir attrs children = { dir: _ } $ D.dir attrs children
div
  :: forall children
   . Array (Attribute D.Div_)
  -> { | children }
  -> { div :: D.Element D.Div_ children }
div attrs children = { div: _ } $ D.div attrs children
dl
  :: forall children
   . Array (Attribute D.Dl_)
  -> { | children }
  -> { dl :: D.Element D.Dl_ children }
dl attrs children = { dl: _ } $ D.dl attrs children
dt
  :: forall children
   . Array (Attribute D.Dt_)
  -> { | children }
  -> { dt :: D.Element D.Dt_ children }
dt attrs children = { dt: _ } $ D.dt attrs children
em
  :: forall children
   . Array (Attribute D.Em_)
  -> { | children }
  -> { em :: D.Element D.Em_ children }
em attrs children = { em: _ } $ D.em attrs children
embed
  :: forall children
   . Array (Attribute D.Embed_)
  -> { | children }
  -> { embed :: D.Element D.Embed_ children }
embed attrs children = { embed: _ } $ D.embed attrs children
fieldset
  :: forall children
   . Array (Attribute D.Fieldset_)
  -> { | children }
  -> { fieldset :: D.Element D.Fieldset_ children }
fieldset attrs children = { fieldset: _ } $ D.fieldset attrs children
figcaption
  :: forall children
   . Array (Attribute D.Figcaption_)
  -> { | children }
  -> { figcaption :: D.Element D.Figcaption_ children }
figcaption attrs children = { figcaption: _ } $ D.figcaption attrs children
figure
  :: forall children
   . Array (Attribute D.Figure_)
  -> { | children }
  -> { figure :: D.Element D.Figure_ children }
figure attrs children = { figure: _ } $ D.figure attrs children
font
  :: forall children
   . Array (Attribute D.Font_)
  -> { | children }
  -> { font :: D.Element D.Font_ children }
font attrs children = { font: _ } $ D.font attrs children
footer
  :: forall children
   . Array (Attribute D.Footer_)
  -> { | children }
  -> { footer :: D.Element D.Footer_ children }
footer attrs children = { footer: _ } $ D.footer attrs children
form
  :: forall children
   . Array (Attribute D.Form_)
  -> { | children }
  -> { form :: D.Element D.Form_ children }
form attrs children = { form: _ } $ D.form attrs children
frame
  :: forall children
   . Array (Attribute D.Frame_)
  -> { | children }
  -> { frame :: D.Element D.Frame_ children }
frame attrs children = { frame: _ } $ D.frame attrs children
frameset
  :: forall children
   . Array (Attribute D.Frameset_)
  -> { | children }
  -> { frameset :: D.Element D.Frameset_ children }
frameset attrs children = { frameset: _ } $ D.frameset attrs children
h1
  :: forall children
   . Array (Attribute D.H1_)
  -> { | children }
  -> { h1 :: D.Element D.H1_ children }
h1 attrs children = { h1: _ } $ D.h1 attrs children
h2
  :: forall children
   . Array (Attribute D.H2_)
  -> { | children }
  -> { h2 :: D.Element D.H2_ children }
h2 attrs children = { h2: _ } $ D.h2 attrs children
h3
  :: forall children
   . Array (Attribute D.H3_)
  -> { | children }
  -> { h3 :: D.Element D.H3_ children }
h3 attrs children = { h3: _ } $ D.h3 attrs children
h4
  :: forall children
   . Array (Attribute D.H4_)
  -> { | children }
  -> { h4 :: D.Element D.H4_ children }
h4 attrs children = { h4: _ } $ D.h4 attrs children
h5
  :: forall children
   . Array (Attribute D.H5_)
  -> { | children }
  -> { h5 :: D.Element D.H5_ children }
h5 attrs children = { h5: _ } $ D.h5 attrs children
h6
  :: forall children
   . Array (Attribute D.H6_)
  -> { | children }
  -> { h6 :: D.Element D.H6_ children }
h6 attrs children = { h6: _ } $ D.h6 attrs children
head
  :: forall children
   . Array (Attribute D.Head_)
  -> { | children }
  -> { head :: D.Element D.Head_ children }
head attrs children = { head: _ } $ D.head attrs children
header
  :: forall children
   . Array (Attribute D.Header_)
  -> { | children }
  -> { header :: D.Element D.Header_ children }
header attrs children = { header: _ } $ D.header attrs children
hr
  :: forall children
   . Array (Attribute D.Hr_)
  -> { | children }
  -> { hr :: D.Element D.Hr_ children }
hr attrs children = { hr: _ } $ D.hr attrs children
html
  :: forall children
   . Array (Attribute D.Html_)
  -> { | children }
  -> { html :: D.Element D.Html_ children }
html attrs children = { html: _ } $ D.html attrs children
i
  :: forall children
   . Array (Attribute D.I_)
  -> { | children }
  -> { i :: D.Element D.I_ children }
i attrs children = { i: _ } $ D.i attrs children
iframe
  :: forall children
   . Array (Attribute D.Iframe_)
  -> { | children }
  -> { iframe :: D.Element D.Iframe_ children }
iframe attrs children = { iframe: _ } $ D.iframe attrs children
img
  :: forall children
   . Array (Attribute D.Img_)
  -> { | children }
  -> { img :: D.Element D.Img_ children }
img attrs children = { img: _ } $ D.img attrs children
input
  :: forall children
   . Array (Attribute D.Input_)
  -> { | children }
  -> { input :: D.Element D.Input_ children }
input attrs children = { input: _ } $ D.input attrs children
ins
  :: forall children
   . Array (Attribute D.Ins_)
  -> { | children }
  -> { ins :: D.Element D.Ins_ children }
ins attrs children = { ins: _ } $ D.ins attrs children
kbd
  :: forall children
   . Array (Attribute D.Kbd_)
  -> { | children }
  -> { kbd :: D.Element D.Kbd_ children }
kbd attrs children = { kbd: _ } $ D.kbd attrs children
label
  :: forall children
   . Array (Attribute D.Label_)
  -> { | children }
  -> { label :: D.Element D.Label_ children }
label attrs children = { label: _ } $ D.label attrs children
legend
  :: forall children
   . Array (Attribute D.Legend_)
  -> { | children }
  -> { legend :: D.Element D.Legend_ children }
legend attrs children = { legend: _ } $ D.legend attrs children
li
  :: forall children
   . Array (Attribute D.Li_)
  -> { | children }
  -> { li :: D.Element D.Li_ children }
li attrs children = { li: _ } $ D.li attrs children
link
  :: forall children
   . Array (Attribute D.Link_)
  -> { | children }
  -> { link :: D.Element D.Link_ children }
link attrs children = { link: _ } $ D.link attrs children
main
  :: forall children
   . Array (Attribute D.Main_)
  -> { | children }
  -> { main :: D.Element D.Main_ children }
main attrs children = { main: _ } $ D.main attrs children
map
  :: forall children
   . Array (Attribute D.Map_)
  -> { | children }
  -> { map :: D.Element D.Map_ children }
map attrs children = { map: _ } $ D.map attrs children
mark
  :: forall children
   . Array (Attribute D.Mark_)
  -> { | children }
  -> { mark :: D.Element D.Mark_ children }
mark attrs children = { mark: _ } $ D.mark attrs children
meta
  :: forall children
   . Array (Attribute D.Meta_)
  -> { | children }
  -> { meta :: D.Element D.Meta_ children }
meta attrs children = { meta: _ } $ D.meta attrs children
meter
  :: forall children
   . Array (Attribute D.Meter_)
  -> { | children }
  -> { meter :: D.Element D.Meter_ children }
meter attrs children = { meter: _ } $ D.meter attrs children
nav
  :: forall children
   . Array (Attribute D.Nav_)
  -> { | children }
  -> { nav :: D.Element D.Nav_ children }
nav attrs children = { nav: _ } $ D.nav attrs children
noframes
  :: forall children
   . Array (Attribute D.Noframes_)
  -> { | children }
  -> { noframes :: D.Element D.Noframes_ children }
noframes attrs children = { noframes: _ } $ D.noframes attrs children
noscript
  :: forall children
   . Array (Attribute D.Noscript_)
  -> { | children }
  -> { noscript :: D.Element D.Noscript_ children }
noscript attrs children = { noscript: _ } $ D.noscript attrs children
object
  :: forall children
   . Array (Attribute D.Object_)
  -> { | children }
  -> { object :: D.Element D.Object_ children }
object attrs children = { object: _ } $ D.object attrs children
ol
  :: forall children
   . Array (Attribute D.Ol_)
  -> { | children }
  -> { ol :: D.Element D.Ol_ children }
ol attrs children = { ol: _ } $ D.ol attrs children
optgroup
  :: forall children
   . Array (Attribute D.Optgroup_)
  -> { | children }
  -> { optgroup :: D.Element D.Optgroup_ children }
optgroup attrs children = { optgroup: _ } $ D.optgroup attrs children
option
  :: forall children
   . Array (Attribute D.Option_)
  -> { | children }
  -> { option :: D.Element D.Option_ children }
option attrs children = { option: _ } $ D.option attrs children
output
  :: forall children
   . Array (Attribute D.Output_)
  -> { | children }
  -> { output :: D.Element D.Output_ children }
output attrs children = { output: _ } $ D.output attrs children
p
  :: forall children
   . Array (Attribute D.P_)
  -> { | children }
  -> { p :: D.Element D.P_ children }
p attrs children = { p: _ } $ D.p attrs children
param
  :: forall children
   . Array (Attribute D.Param_)
  -> { | children }
  -> { param :: D.Element D.Param_ children }
param attrs children = { param: _ } $ D.param attrs children
picture
  :: forall children
   . Array (Attribute D.Picture_)
  -> { | children }
  -> { picture :: D.Element D.Picture_ children }
picture attrs children = { picture: _ } $ D.picture attrs children
pre
  :: forall children
   . Array (Attribute D.Pre_)
  -> { | children }
  -> { pre :: D.Element D.Pre_ children }
pre attrs children = { pre: _ } $ D.pre attrs children
progress
  :: forall children
   . Array (Attribute D.Progress_)
  -> { | children }
  -> { progress :: D.Element D.Progress_ children }
progress attrs children = { progress: _ } $ D.progress attrs children
q
  :: forall children
   . Array (Attribute D.Q_)
  -> { | children }
  -> { q :: D.Element D.Q_ children }
q attrs children = { q: _ } $ D.q attrs children
rp
  :: forall children
   . Array (Attribute D.Rp_)
  -> { | children }
  -> { rp :: D.Element D.Rp_ children }
rp attrs children = { rp: _ } $ D.rp attrs children
rt
  :: forall children
   . Array (Attribute D.Rt_)
  -> { | children }
  -> { rt :: D.Element D.Rt_ children }
rt attrs children = { rt: _ } $ D.rt attrs children
ruby
  :: forall children
   . Array (Attribute D.Ruby_)
  -> { | children }
  -> { ruby :: D.Element D.Ruby_ children }
ruby attrs children = { ruby: _ } $ D.ruby attrs children
s
  :: forall children
   . Array (Attribute D.S_)
  -> { | children }
  -> { s :: D.Element D.S_ children }
s attrs children = { s: _ } $ D.s attrs children
samp
  :: forall children
   . Array (Attribute D.Samp_)
  -> { | children }
  -> { samp :: D.Element D.Samp_ children }
samp attrs children = { samp: _ } $ D.samp attrs children
script
  :: forall children
   . Array (Attribute D.Script_)
  -> { | children }
  -> { script :: D.Element D.Script_ children }
script attrs children = { script: _ } $ D.script attrs children
section
  :: forall children
   . Array (Attribute D.Section_)
  -> { | children }
  -> { section :: D.Element D.Section_ children }
section attrs children = { section: _ } $ D.section attrs children
select
  :: forall children
   . Array (Attribute D.Select_)
  -> { | children }
  -> { select :: D.Element D.Select_ children }
select attrs children = { select: _ } $ D.select attrs children
small
  :: forall children
   . Array (Attribute D.Small_)
  -> { | children }
  -> { small :: D.Element D.Small_ children }
small attrs children = { small: _ } $ D.small attrs children
source
  :: forall children
   . Array (Attribute D.Source_)
  -> { | children }
  -> { source :: D.Element D.Source_ children }
source attrs children = { source: _ } $ D.source attrs children
span
  :: forall children
   . Array (Attribute D.Span_)
  -> { | children }
  -> { span :: D.Element D.Span_ children }
span attrs children = { span: _ } $ D.span attrs children
strike
  :: forall children
   . Array (Attribute D.Strike_)
  -> { | children }
  -> { strike :: D.Element D.Strike_ children }
strike attrs children = { strike: _ } $ D.strike attrs children
strong
  :: forall children
   . Array (Attribute D.Strong_)
  -> { | children }
  -> { strong :: D.Element D.Strong_ children }
strong attrs children = { strong: _ } $ D.strong attrs children
style
  :: forall children
   . Array (Attribute D.Style_)
  -> { | children }
  -> { style :: D.Element D.Style_ children }
style attrs children = { style: _ } $ D.style attrs children
sub
  :: forall children
   . Array (Attribute D.Sub_)
  -> { | children }
  -> { sub :: D.Element D.Sub_ children }
sub attrs children = { sub: _ } $ D.sub attrs children
summary
  :: forall children
   . Array (Attribute D.Summary_)
  -> { | children }
  -> { summary :: D.Element D.Summary_ children }
summary attrs children = { summary: _ } $ D.summary attrs children
sup
  :: forall children
   . Array (Attribute D.Sup_)
  -> { | children }
  -> { sup :: D.Element D.Sup_ children }
sup attrs children = { sup: _ } $ D.sup attrs children
svg
  :: forall children
   . Array (Attribute D.Svg_)
  -> { | children }
  -> { svg :: D.Element D.Svg_ children }
svg attrs children = { svg: _ } $ D.svg attrs children
table
  :: forall children
   . Array (Attribute D.Table_)
  -> { | children }
  -> { table :: D.Element D.Table_ children }
table attrs children = { table: _ } $ D.table attrs children
tbody
  :: forall children
   . Array (Attribute D.Tbody_)
  -> { | children }
  -> { tbody :: D.Element D.Tbody_ children }
tbody attrs children = { tbody: _ } $ D.tbody attrs children
td
  :: forall children
   . Array (Attribute D.Td_)
  -> { | children }
  -> { td :: D.Element D.Td_ children }
td attrs children = { td: _ } $ D.td attrs children
template
  :: forall children
   . Array (Attribute D.Template_)
  -> { | children }
  -> { template :: D.Element D.Template_ children }
template attrs children = { template: _ } $ D.template attrs children
textarea
  :: forall children
   . Array (Attribute D.Textarea_)
  -> { | children }
  -> { textarea :: D.Element D.Textarea_ children }
textarea attrs children = { textarea: _ } $ D.textarea attrs children
tfoot
  :: forall children
   . Array (Attribute D.Tfoot_)
  -> { | children }
  -> { tfoot :: D.Element D.Tfoot_ children }
tfoot attrs children = { tfoot: _ } $ D.tfoot attrs children
th
  :: forall children
   . Array (Attribute D.Th_)
  -> { | children }
  -> { th :: D.Element D.Th_ children }
th attrs children = { th: _ } $ D.th attrs children
thead
  :: forall children
   . Array (Attribute D.Thead_)
  -> { | children }
  -> { thead :: D.Element D.Thead_ children }
thead attrs children = { thead: _ } $ D.thead attrs children
time
  :: forall children
   . Array (Attribute D.Time_)
  -> { | children }
  -> { time :: D.Element D.Time_ children }
time attrs children = { time: _ } $ D.time attrs children
title
  :: forall children
   . Array (Attribute D.Title_)
  -> { | children }
  -> { title :: D.Element D.Title_ children }
title attrs children = { title: _ } $ D.title attrs children
tr
  :: forall children
   . Array (Attribute D.Tr_)
  -> { | children }
  -> { tr :: D.Element D.Tr_ children }
tr attrs children = { tr: _ } $ D.tr attrs children
track
  :: forall children
   . Array (Attribute D.Track_)
  -> { | children }
  -> { track :: D.Element D.Track_ children }
track attrs children = { track: _ } $ D.track attrs children
tt
  :: forall children
   . Array (Attribute D.Tt_)
  -> { | children }
  -> { tt :: D.Element D.Tt_ children }
tt attrs children = { tt: _ } $ D.tt attrs children
u
  :: forall children
   . Array (Attribute D.U_)
  -> { | children }
  -> { u :: D.Element D.U_ children }
u attrs children = { u: _ } $ D.u attrs children
ul
  :: forall children
   . Array (Attribute D.Ul_)
  -> { | children }
  -> { ul :: D.Element D.Ul_ children }
ul attrs children = { ul: _ } $ D.ul attrs children
var
  :: forall children
   . Array (Attribute D.Var_)
  -> { | children }
  -> { var :: D.Element D.Var_ children }
var attrs children = { var: _ } $ D.var attrs children
video
  :: forall children
   . Array (Attribute D.Video_)
  -> { | children }
  -> { video :: D.Element D.Video_ children }
video attrs children = { video: _ } $ D.video attrs children
wbr
  :: forall children
   . Array (Attribute D.Wbr_)
  -> { | children }
  -> { wbr :: D.Element D.Wbr_ children }
wbr attrs children = { wbr: _ } $ D.wbr attrs children
-- codegen 9