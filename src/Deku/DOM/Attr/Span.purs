module Deku.DOM.Attr.Span where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Col (Col_)
import Deku.DOM.Elt.Colgroup (Colgroup_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Span = Span

instance Attr Col_ Span (NonEmpty.NonEmpty Event.Event  String ) where
  attr Span bothValues = unsafeAttribute $ Both (pure 
    { key: "span", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "span", value: prop' value })
instance Attr Col_ Span (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Span (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "span", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "span", value: prop' value })
instance Attr Col_ Span  String  where
  attr Span value = unsafeAttribute $ This $ pure $
    { key: "span", value: prop' value }
instance Attr Col_ Span (Event.Event  String ) where
  attr Span eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "span", value: prop' value }

instance Attr Col_ Span (ST.ST Global.Global  String ) where
  attr Span iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "span", value: prop' value }

instance Attr Colgroup_ Span (NonEmpty.NonEmpty Event.Event  String ) where
  attr Span bothValues = unsafeAttribute $ Both (pure 
    { key: "span", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "span", value: prop' value })
instance Attr Colgroup_ Span (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Span (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "span", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "span", value: prop' value })
instance Attr Colgroup_ Span  String  where
  attr Span value = unsafeAttribute $ This $ pure $
    { key: "span", value: prop' value }
instance Attr Colgroup_ Span (Event.Event  String ) where
  attr Span eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "span", value: prop' value }

instance Attr Colgroup_ Span (ST.ST Global.Global  String ) where
  attr Span iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "span", value: prop' value }

instance Attr everything Span (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Span bothValues = unsafeAttribute $ Both (pure  { key: "span", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "span", value: unset' })
instance Attr everything Span (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr Span (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \_ ->   { key: "span", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "span", value: unset' })
instance Attr everything Span  Unit  where
  attr Span _ = unsafeAttribute $ This $ { key: "span", value: unset' }
instance Attr everything Span (Event.Event  Unit ) where
  attr Span eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "span", value: unset' }

instance Attr everything Span (ST.ST Global.Global  Unit ) where
  attr Span iValue = unsafeAttribute $ This $ iValue # \_ ->
    { key: "span", value: unset' }
