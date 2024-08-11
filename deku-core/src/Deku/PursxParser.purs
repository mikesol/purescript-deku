module Deku.PursxParser where

import Prelude

import Prim.Row as Row
import Prim.TypeError (Text)
import TLDR.Combinators (type ($>), type (<$), type (||))
import TLDR.Combinators as C
import TLDR.Combinators.Class (class ModifyState, class Parse, class ShowParser, SP1, SP2, SP3)
import TLDR.List as L
import TLDR.Matchers (type (|||), type (&&&))
import TLDR.Matchers as M
import TLDR.Result as R
import TLDR.Sugar as S
import Type.Proxy (Proxy)

data AttributeVerb

data ElementVerb

data NutVerb

data PursxState :: Row Type -> Type -> Type
data PursxState verbed tagged

data PursxAttributeName :: Type -> Type
data PursxAttributeName a

instance
  ShowParser (SP1 "PursxAttributeName" a) doc =>
  ShowParser PursxAttributeName doc

data PursxElementName :: Type -> Type
data PursxElementName a

instance
  ShowParser (SP1 "PursxElementName" a) doc =>
  ShowParser PursxElementName doc

data TagClosingCheck :: Type -> Type
data TagClosingCheck a

instance
  ShowParser (SP1 "TagClosingCheck" a) doc =>
  ShowParser TagClosingCheck doc

data TagOpeningCheck :: Type -> Type
data TagOpeningCheck a

instance
  ShowParser (SP1 "TagOpeningCheck" a) doc =>
  ShowParser TagOpeningCheck doc

instance
  Row.Cons name AttributeVerb i o =>
  ModifyState sym
    (PursxAttributeName (PursxAttribute (Proxy name)))
    (PursxState i t)
    (PursxState o t)

instance
  Row.Cons name ElementVerb i o =>
  ModifyState sym
    (PursxElementName (PursxElement (Proxy name)))
    (PursxState i t)
    (PursxState o t)

instance
  ModifyState sym
    (TagClosingCheck (TagName name))
    (PursxState i (L.Cons name t))
    (PursxState i t)

instance
  ModifyState sym
    (TagOpeningCheck (TagName name))
    (PursxState i t)
    (PursxState i (L.Cons name t))

instance
  ModifyState sym
    TagSelfClosing
    (PursxState i (L.Cons h t))
    (PursxState i t)

type AttributeNameHead'M = M.MatchAlpha
type AttributeNameTail'M = M.MatchAlphanumeric ||| M.Literal "-"
  ||| M.Literal "_"
  ||| M.Literal "."
  ||| M.Literal ":"

type AttributeName'M = AttributeNameHead'M &&& M.Many AttributeNameTail'M

data AttributeName :: Type -> Type
data AttributeName a

instance
  ShowParser (SP1 "AttributeName" a) doc =>
  ShowParser (AttributeName a) doc

type AttributeName'P = AttributeName AttributeName'M

testAttributeNameSuccess
  :: forall @toParse @h @t
   . Parse toParse AttributeName'P Unit (R.Success h t) Unit
  => Unit
testAttributeNameSuccess = unit

testAttributeNameSuccess0 =
  testAttributeNameSuccess @"""hello""" @(AttributeName (Proxy "hello")) @""
    :: Unit

data AttributeValue :: Type -> Type
data AttributeValue a

instance
  ShowParser (SP1 "AttributeValue" a) doc =>
  ShowParser (AttributeValue a) doc

type QuotedAttributeValue'P q =
  S.Bracket
    (M.Literal q)
    ( AttributeValue
        ( M.Many
            ( (M.Literal "\\" &&& M.Literal q) |||
                (M.Except (M.Literal q) M.Any)
            )
        )
    )
    (M.Literal q)

type AttributeValue'P =
  QuotedAttributeValue'P "\"" || QuotedAttributeValue'P "'"

data AttributePair :: Type -> Type -> Type
data AttributePair a b

instance
  ShowParser (SP2 "AttributePair" a b) doc =>
  ShowParser (AttributePair a b) doc

type AttributePair'P = AttributePair AttributeName'P
  ( (M.Many M.MatchWhitespace &&& M.Literal "=" &&& M.Many M.MatchWhitespace) $>
      AttributeValue'P
  )

testAttributePairSuccess
  :: forall @toParse @h @t
   . Parse toParse AttributePair'P Unit (R.Success h t) Unit
  => Unit
testAttributePairSuccess = unit

testAttributePairSuccess0 =
  testAttributePairSuccess @"""hello="world" """
    @( AttributePair (AttributeName (Proxy "hello"))
        (AttributeValue (Proxy "world"))
    )
    @" " :: Unit

testAttributePairSuccess1 =
  testAttributePairSuccess @"""hello  ="wo\"rld" """
    @( AttributePair (AttributeName (Proxy "hello"))
        (AttributeValue (Proxy "wo\\\"rld"))
    )
    @" " :: Unit

testAttributePairSuccess2 =
  testAttributePairSuccess @"""hello= 'world' """
    @( AttributePair (AttributeName (Proxy "hello"))
        (AttributeValue (Proxy "world"))
    )
    @" " :: Unit

data PursxAttribute :: Type -> Type
data PursxAttribute a

instance
  ShowParser (SP1 "PursxAttribute" a) doc =>
  ShowParser (PursxAttribute a) doc

type PursxAttribute'P verb = S.Bracket
  (M.Literal verb)
  ( C.ModifyStateAfterSuccessWithResult PursxAttributeName
      (PursxAttribute (M.Some (M.Except (M.Literal verb) M.Any)))
  )
  (M.Literal verb)

data PursxElement :: Type -> Type
data PursxElement a

instance
  ShowParser (SP1 "PursxElement" a) doc =>
  ShowParser (PursxElement a) doc

type PursxElement'P verb = S.Bracket
  (M.Literal verb)
  ( C.ModifyStateAfterSuccessWithResult PursxElementName
      (PursxElement (M.Some (M.Except (M.Literal verb) M.Any)))
  )
  (M.Literal verb)

type Attributes'P verb =
  C.SepBy
    (PursxAttribute'P verb || AttributePair'P)
    (M.Some M.MatchWhitespace)

testAttributesSuccess
  :: forall @toParse @h @t @o
   . Parse toParse (Attributes'P "~") (PursxState () L.Nil) (R.Success h t) o
  => Unit
testAttributesSuccess = unit

testAttributesSuccess0 =
  testAttributesSuccess @"""hello="world" goodbye='world'"""
    @( L.Cons
        ( AttributePair (AttributeName (Proxy "hello"))
            (AttributeValue (Proxy "world"))
        )

        ( L.Cons
            ( AttributePair (AttributeName (Proxy "goodbye"))
                (AttributeValue (Proxy "world"))
            )
            L.Nil
        )
    )
    @""
    @(PursxState () L.Nil) :: Unit

testAttributesSuccess1 =
  testAttributesSuccess @"""hello="world" ~funtimes~ goodbye='world'"""
    @( L.Cons
        ( AttributePair (AttributeName (Proxy "hello"))
            (AttributeValue (Proxy "world"))
        )

        ( L.Cons
            (PursxAttribute (Proxy "funtimes"))
            ( L.Cons
                ( AttributePair (AttributeName (Proxy "goodbye"))
                    (AttributeValue (Proxy "world"))
                )
                L.Nil
            )
        )
    )
    @""
    @(PursxState (funtimes :: AttributeVerb) L.Nil) :: Unit

type TagNameHead'M = M.MatchAlpha
type TagNameTail'M = M.MatchAlphanumeric ||| M.Literal "-"

type TagName'M = TagNameHead'M &&& M.Many TagNameTail'M

data TagName :: Type -> Type
data TagName a

instance ShowParser (SP1 "TagName" a) doc => ShowParser (TagName a) doc

type TagName'P = TagName TagName'M

data TagSelfClosing

instance ShowParser TagSelfClosing (Text "TagSelfClosing")

type TagSelfClosing'P = C.ModifyStateAfterSuccessOnConstant TagSelfClosing
  ((S.L2 "/" ">") $> (C.Const TagSelfClosing))

data TagClosing :: Type -> Type -> Type
data TagClosing children tag

instance
  ShowParser (SP2 "TagClosing" a b) doc =>
  ShowParser (TagClosing a b) doc

type NoCloseNoVerb verb = M.Many (M.Except (S.L1 "<" ||| S.L1 verb) M.Any)

type TagClosing'P elt verb = TagClosing
  ( S.Bracket (S.L1 ">")
      ( S.Bracket (NoCloseNoVerb verb)
          ( C.SepBy
              (Comment'P || elt || PursxElement'P verb)
              (NoCloseNoVerb verb)
          )
          (NoCloseNoVerb verb)
      )
      (S.L2 "<" "/")
  )
  (C.ModifyStateAfterSuccessWithResult TagClosingCheck TagName'P <$ S.L1 ">")

data Comment
instance ShowParser Comment (Text "Comment")

type CommentEnd = S.L3 "-" "-" ">"
type Comment'P = ((S.L4 "<" "!" "-" "-" &&& M.Many (M.Except CommentEnd M.Any) &&& CommentEnd) $> (C.Const Comment))

data PxElt :: Type -> Type -> Type -> Type
data PxElt tag atts next

instance
  ShowParser (SP3 "PxElt" a b c) doc =>
  ShowParser (PxElt a b c) doc

type PxElt'P verb = S.WS
  ( C.Fix
      ( pxElt ::
          PxElt
            ( S.L1 "<" $>
                (C.ModifyStateAfterSuccessWithResult TagOpeningCheck TagName'P)
            )
            ((M.Some M.MatchWhitespace $> Attributes'P verb) || (C.Const L.Nil))
            ( M.Many M.MatchWhitespace $>
                (TagSelfClosing'P || TagClosing'P (Proxy "pxElt") verb)
            )
      )
  )

testSuccess
  :: forall @toParse @t @o h
   . Parse toParse (PxElt'P "~") (PursxState () L.Nil) (R.Success h t) o
  => Unit
testSuccess = unit

testSuccess0 =
  testSuccess @"""<div></div>""" @"" @(PursxState () L.Nil)
    :: Unit

testSuccess1 =
  testSuccess @"""<div> </div>""" @"" @(PursxState () L.Nil)
    :: Unit

testSuccess2 =
  testSuccess @"""<img />""" @"" @(PursxState () L.Nil)
    :: Unit

testSuccess3 =
  testSuccess @"""<div><img /></div>""" @"" @(PursxState () L.Nil)
    :: Unit

testSuccess4 =
  testSuccess @"""<div> ~zz~ </div>""" @""
    @(PursxState (zz :: ElementVerb) L.Nil)
    :: Unit

testSuccess5 =
  testSuccess @"""<div> <a id="foo"> </a> </div>""" @"" @(PursxState () L.Nil)
    :: Unit

testSuccess6 =
  testSuccess
    @"""
<div class="container">
  <header class="header">
    <h1>Main Title</h1>
  </header>
  <!-- comment -->
  <main class="content">
    <section>
      <h2>Section Title</h2>
      <p>This is a paragraph inside a section.</p>
      <p>Another paragraph with a <a href="/more-info" title="More information">link</a>.</p>
    </section>
    <article>
      <h2>Article Title</h2>
      <p>This is an article paragraph.</p>
      <footer>
        <p>Article footer content.</p>
      </footer>
    </article>
  </main>
  <footer class='footer'>
    <p>&copy; 2024 My Website</p>
  </footer>
</div>
"""
    @""
    @(PursxState () L.Nil)
    :: Unit