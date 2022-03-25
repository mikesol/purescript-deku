import string
o = []
def print_(x): o.append(x)
WHITESPACE = [" ","\\t","\\n"]

print_('''module Deku.Pursx where
import Deku.Debug (type (^^))
import Prim.Row as Row
import Prim.TypeError (class Warn, Text)
import Prim.Symbol as Sym
import Prim.Boolean (False, True)
import Deku.Graph.Attribute(Attribute)
import Deku.Graph.DOM(class TagToDeku, Element)
import Data.Symbol (class IsSymbol, reflectSymbol)
import Deku.Graph.Attribute (Attribute)
import Deku.Graph.DOM (Element)
import Prim.RowList (class RowToList, RowList)
import Prim.RowList as RL
import Prim.Row as R
''')

print_('class DoVerbForAttr (verb :: Symbol) (tag :: Symbol) (acc :: Symbol) (head :: Symbol) (tail :: Symbol) (pursi :: Row Type) (purso :: Row Type) (newTail :: Symbol) | verb acc head tail pursi -> purso newTail')
print_('instance (TagToDeku tag deku, Row.Cons acc (Array (Attribute deku)) pursi purso) => DoVerbForAttr verb tag acc verb tail pursi purso tail')
print_('else instance (Sym.Append acc anything acc2, Sym.Cons x y tail, DoVerbForAttr verb tag acc2 x y pursi purso newTail) => DoVerbForAttr verb tag acc anything tail pursi purso newTail')
print_('--')
print_('class DoVerbForDOM (verb :: Symbol) (acc :: Symbol) (head :: Symbol) (tail :: Symbol) (pursi :: Row Type) (purso :: Row Type) (newTail :: Symbol) | verb acc head tail pursi -> purso newTail')
print_('instance (Row.Cons acc (Element anytag anykids) pursi purso) => DoVerbForDOM verb acc verb tail pursi purso tail')
print_('else instance (Sym.Append acc anything acc2, Sym.Cons x y tail, DoVerbForDOM verb acc2 x y pursi purso newTail) => DoVerbForDOM verb acc anything tail pursi purso newTail')
print_('--')
print_('class IsWhiteSpace (space :: Symbol)')
print_('instance IsWhiteSpace ""')
print_('else instance (Sym.Cons x y s, IsSingleWhiteSpace x, IsWhiteSpace y) => IsWhiteSpace s')
print_('class IsSingleWhiteSpace (s :: Symbol)')
for x in WHITESPACE:
    print_('instance IsSingleWhiteSpace "%s"' % (x,))

print_('class PXStart (verb :: Symbol) (head :: Symbol) (tail :: Symbol) (purs :: Row Type) | verb head tail -> purs')
for x in WHITESPACE:
    print_('instance (Sym.Cons x y tail, PXStart verb x y purs) => PXStart verb "%s" tail purs' % (x,))
print_("""instance
  ( Sym.Cons x y tail
  , PXTagPreName verb x y () purso trailing
  , IsWhiteSpace trailing
  ) => PXStart verb "<" tail purso
""")
print_("--")
print_('class PXTagPreName (verb :: Symbol) (head :: Symbol) (tail :: Symbol) (pursi :: Row Type) (purso :: Row Type) (trailing :: Symbol) | verb head tail pursi -> purso trailing')
for x in WHITESPACE:
    print_('instance (Sym.Cons x y tail, PXTagPreName verb x y pursi purso trailing) => PXTagPreName verb "%s" tail pursi purso trailing' % (x,))
for x in string.ascii_lowercase:
  print_('instance (PXTagName verb "" "%s" tail pursi purso trailing) => PXTagPreName verb "%s" tail pursi purso trailing' % (x,x))
print_('--')
print_('class PXTagName (verb :: Symbol) (tag :: Symbol) (head :: Symbol) (tail :: Symbol) (pursi :: Row Type) (purso :: Row Type) (trailing :: Symbol) | verb tag head tail pursi -> purso trailing')
print_('instance (Sym.Cons q r tail, PXBody verb q r pursi purso trailing, Sym.Cons x y trailing, PreEndTagFromTrailing x y tag newTrailing) => PXTagName verb tag ">" tail pursi purso newTrailing')
for x in string.ascii_lowercase+'-'+string.digits:
  print_('instance (Sym.Cons x y tail, Sym.Append tag_ "%s" tag, PXTagName verb tag x y pursi purso trailing) => PXTagName verb tag_ "%s" tail pursi purso trailing' % (x,x))
for x in WHITESPACE:
  print_('instance (Sym.Cons x y tail, PXTagPreAttrName verb False tag x y pursi purso trailing) => PXTagName verb tag "%s" tail pursi purso trailing' % x)
print_('--')
print_('class PreEndTagFromTrailing (head :: Symbol) (tail :: Symbol) (tag :: Symbol) (newTrailing :: Symbol) | head tail -> tag newTrailing')
for x in WHITESPACE:
  print_('instance (Sym.Cons x y tail, PreEndTagFromTrailing x y tag trailing) => PreEndTagFromTrailing "%s" tail tag trailing' % x)
for x in string.ascii_lowercase+'-':
  print_('instance (EndTagFromTrailing "%s" tail "" tag trailing) => PreEndTagFromTrailing "%s" tail tag trailing' % (x,x))
print_('--')
print_('class EndTagFromTrailing (head :: Symbol) (tail :: Symbol) (tagAcc :: Symbol) (tag :: Symbol) (newTrailing :: Symbol) | head tail tagAcc -> tag newTrailing')
for x in string.ascii_lowercase+'-'+string.digits:
  print_('instance (Sym.Cons x y tail, Sym.Append tag_ "%s" tag, EndTagFromTrailing x y tag otag trailing) => EndTagFromTrailing "%s" tail tag_ otag trailing' % (x,x))
print_('instance EndTagFromTrailing ">" tail tag tag tail')
print_('--')
print_('class PXTagPreAttrName (verb :: Symbol) (hasAttributed :: Boolean) (tag :: Symbol) (head :: Symbol) (tail :: Symbol) (pursi :: Row Type) (purso :: Row Type) (trailing :: Symbol) | verb hasAttributed tag head tail pursi -> purso trailing')
print_('instance (Sym.Cons ">" trailing tail) => PXTagPreAttrName verb hasAttributed tag "/" tail purs purs trailing')
print_('-- trailing will be by definition whatever comes after the closing tag, ie </ foo> will be " foo>"')
print_('else instance (Sym.Cons q r tail, PXBody verb q r pursi purso trailing, Sym.Cons x y trailing, PreEndTagFromTrailing x y tag newTrailing) => PXTagPreAttrName verb hasAttributed tag ">" tail pursi purso newTrailing')
print_('--')
for x in WHITESPACE:
  print_('else instance (Sym.Cons x y tail, PXTagPreAttrName verb hasAttributed tag x y pursi purso trailing) => PXTagPreAttrName verb hasAttributed tag "%s" tail pursi purso trailing' % x)
for x in string.ascii_letters:
  print_('else instance (PXTagAttrName verb hasAttributed tag "%s" tail pursi purso trailing) => PXTagPreAttrName verb hasAttributed tag "%s" tail pursi purso trailing' % (x,x))
print_('else instance (Sym.Cons x y tail, DoVerbForAttr verb tag "" x y pursi pursx newTail, Sym.Cons xx yy newTail, PXTagPreAttrName verb True tag xx yy pursx purso trailing) => PXTagPreAttrName verb False tag verb tail pursi purso trailing')
print_('--')
print_('class PXTagAttrName (verb :: Symbol) (hasAttributed :: Boolean) (tag :: Symbol) (head :: Symbol) (tail :: Symbol) (pursi :: Row Type) (purso :: Row Type) (trailing :: Symbol) | verb hasAttributed tag head tail pursi -> purso trailing')
for x in string.ascii_lowercase+'-'+string.digits:
  print_('instance (Sym.Cons x y tail, PXTagAttrName verb hasAttributed tag x y pursi purso trailing) => PXTagAttrName verb hasAttributed tag "%s" tail pursi purso trailing' % x)
print_('instance (Sym.Cons x y tail, PXTagPreAttrValue verb hasAttributed tag x y pursi purso trailing) => PXTagAttrName verb hasAttributed tag "=" tail pursi purso trailing')
for x in WHITESPACE:
  print_('instance (Sym.Cons x y tail, PXTagPostAttrName verb hasAttributed tag x y pursi purso trailing) => PXTagAttrName verb hasAttributed tag "%s" tail pursi purso trailing' % x)
print_('--')
print_('class PXTagPostAttrName (verb :: Symbol) (hasAttributed :: Boolean) (tag :: Symbol) (head :: Symbol) (tail :: Symbol) (pursi :: Row Type) (purso :: Row Type) (trailing :: Symbol) | verb hasAttributed tag head tail pursi -> purso trailing')
for x in WHITESPACE:
  print_('instance (Sym.Cons x y tail, PXTagPostAttrName verb hasAttributed tag x y pursi purso trailing) => PXTagPostAttrName verb hasAttributed tag "%s" tail pursi purso trailing' % x)
print_('instance (Sym.Cons x y tail, PXTagPreAttrValue verb hasAttributed tag x y pursi purso trailing) => PXTagPostAttrName verb hasAttributed tag "=" tail pursi purso trailing')
print_('--')
print_('class PXTagPreAttrValue (verb :: Symbol) (hasAttributed :: Boolean) (tag :: Symbol) (head :: Symbol) (tail :: Symbol) (pursi :: Row Type) (purso :: Row Type) (trailing :: Symbol) | verb hasAttributed tag head tail pursi -> purso trailing')
for x in WHITESPACE:
  print_('instance (Sym.Cons x y tail, PXTagPreAttrValue verb hasAttributed tag x y pursi purso trailing) => PXTagPreAttrValue verb hasAttributed tag "%s" tail pursi purso trailing' % x)
print_('instance (Sym.Cons x y tail, PXTagAttrValue verb hasAttributed tag x y pursi purso trailing) => PXTagPreAttrValue verb hasAttributed tag "\\"" tail pursi purso trailing')
print_('--')
print_('class PXTagAttrValue (verb :: Symbol) (hasAttributed :: Boolean) (tag :: Symbol) (head :: Symbol) (tail :: Symbol) (pursi :: Row Type) (purso :: Row Type) (trailing :: Symbol) | verb hasAttributed tag head tail pursi -> purso trailing')
for x in [y for y in (string.ascii_lowercase+string.ascii_uppercase+string.digits+':,;\'!@#$%^&*()_-=`~<>/.')]+['\\\\']+WHITESPACE:
  print_('instance (Sym.Cons x y tail, PXTagAttrValue verb hasAttributed tag x y pursi purso trailing) => PXTagAttrValue verb hasAttributed tag "%s" tail pursi purso trailing' % x)
print_('instance (Sym.Cons x y tail, PXTagPreAttrName verb hasAttributed tag x y pursi purso trailing) => PXTagAttrValue verb hasAttributed tag "\\"" tail pursi purso trailing')
print_('class PXBody (verb :: Symbol) (head :: Symbol) (tail :: Symbol) (pursi :: Row Type) (purso :: Row Type) (trailing :: Symbol) | verb tail pursi -> purso trailing')
print_('''
class CommendEndCandidate2 (head :: Symbol) (tail :: Symbol) (trailing :: Symbol) | head tail -> trailing
instance CommendEndCandidate2 ">" tail tail
else instance (Sym.Cons x y tail, SkipUntilCommentEnd x y trailing) => CommendEndCandidate2 anything tail trailing
class CommendEndCandidate1 (head :: Symbol) (tail :: Symbol) (trailing :: Symbol) | head tail -> trailing
instance (Sym.Cons x y tail, CommendEndCandidate2 x y trailing) => CommendEndCandidate1 "-" tail trailing
else instance (Sym.Cons x y tail, SkipUntilCommentEnd x y trailing) => CommendEndCandidate1 anything tail trailing
class SkipUntilCommentEnd (head :: Symbol) (tail :: Symbol) (trailing :: Symbol) | head tail -> trailing
instance (Sym.Cons x y tail, CommendEndCandidate1 x y trailing)  => SkipUntilCommentEnd "-" tail trailing
else instance (Sym.Cons x y tail, SkipUntilCommentEnd x y trailing) => SkipUntilCommentEnd anything tail trailing
class CloseOrRepeat (verb :: Symbol) (head :: Symbol) (tail :: Symbol) (pursi :: Row Type) (purso :: Row Type) (trailing :: Symbol) | verb head tail pursi -> purso trailing
instance CloseOrRepeat verb "/" tail purs purs tail
else instance
  ( Sym.Cons "-" y tail
  , Sym.Cons "-" yy y
  , Sym.Cons x yyy yy
  , SkipUntilCommentEnd x yyy trailing
  , Sym.Cons mm bb trailing
  , PXBody verb mm bb pursi purso newTrailing
  ) =>
  CloseOrRepeat verb "!" tail pursi purso newTrailing
else instance (PXTagPreName verb anything tail () pursm trailing, Row.Union pursi pursm pursz, Sym.Cons x y trailing, PXBody verb x y pursz purso newTrailing) => CloseOrRepeat verb anything tail pursi purso newTrailing
instance (Sym.Cons x y tail, CloseOrRepeat verb x y pursi purso trailing) => PXBody verb "<" tail pursi purso trailing
else instance (Sym.Cons x y tail, DoVerbForDOM verb "" x y pursi pursx newTail, Sym.Cons xx yy newTail, PXBody verb xx yy pursx purso trailing) => PXBody verb verb tail pursi purso trailing
else instance (Sym.Cons x y tail, PXBody verb x y pursi purso trailing) => PXBody verb anything tail pursi purso trailing''')
print_('''newtype Pursx (verb :: Symbol) (html :: Symbol) r = Pursx { verb :: String, html :: String, r :: {|r} }

psx :: forall proxy (html :: Symbol) r. IsSymbol html => PXStart "~" " " html r => proxy html -> { | r } -> Pursx "~" html r
psx html r = Pursx { verb: "~", html: reflectSymbol html, r: r }

psxR :: forall proxy (html :: Symbol) r. IsSymbol html => PXStart "~" " " html r => proxy html -> { | r } -> { psx :: Pursx "~" html r }
psxR html r = {psx: Pursx { verb: "~", html: reflectSymbol html, r: r }}

infixr 5 psx as ~~
infixr 5 psxR as ~!

class PursxToEdgesRL (rl :: RowList Type) (e :: Row Type) | rl -> e

class PursxToEdges (r :: Row Type) (e :: Row Type) | r -> e

instance (RowToList r rl, PursxToEdgesRL rl e) => PursxToEdges r e
instance PursxToEdgesRL RL.Nil ()
instance (R.Cons key (Element a b) r' r, PursxToEdgesRL rest r') => PursxToEdgesRL (RL.Cons key (Element a b) rest) r
instance (R.Cons key (Element a ()) r' r, PursxToEdgesRL rest r') => PursxToEdgesRL (RL.Cons key (Array (Attribute a)) rest) r
''')
with open('src/Deku/Pursx.purs', 'w') as f:
  for x in o: f.write(x+'\n')
import subprocess
subprocess.call('npx purs-tidy format-in-place src/Deku/Pursx.purs', shell=True)