module Deku.DOM.Attr.Span where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Col (Col_)
import Deku.DOM.Elt.Colgroup (Colgroup_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Span = Span

instance Attr Col_ Span  String  where
  attr Span value = unsafeAttribute $ Left $  
    { key: "span", value: prop' value }
instance Attr Col_ Span (Event.Event  String ) where
  attr Span eventValue = unsafeAttribute $ Right $ eventValue <#> \value ->
    { key: "span", value: prop' value }


instance Attr Colgroup_ Span  String  where
  attr Span value = unsafeAttribute $ Left $  
    { key: "span", value: prop' value }
instance Attr Colgroup_ Span (Event.Event  String ) where
  attr Span eventValue = unsafeAttribute $ Right $ eventValue <#> \value ->
    { key: "span", value: prop' value }


instance Attr everything Span  Unit  where
  attr Span _ = unsafeAttribute $ Left $  { key: "span", value: unset' }
instance Attr everything Span (Event.Event  Unit ) where
  attr Span eventValue = unsafeAttribute $ Right $ eventValue <#> \_ ->
    { key: "span", value: unset' }
