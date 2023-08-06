module Deku.DOM.Attr.Rows where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Textarea (Textarea_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Rows = Rows

instance Attr Textarea_ Rows  String  where
  attr Rows value = unsafeAttribute $ Left $  
    { key: "rows", value: prop' value }
instance Attr Textarea_ Rows (Event.Event  String ) where
  attr Rows eventValue = unsafeAttribute $ Right $ eventValue <#> \value ->
    { key: "rows", value: prop' value }


instance Attr everything Rows  Unit  where
  attr Rows _ = unsafeAttribute $ Left $  { key: "rows", value: unset' }
instance Attr everything Rows (Event.Event  Unit ) where
  attr Rows eventValue = unsafeAttribute $ Right $ eventValue <#> \_ ->
    { key: "rows", value: unset' }
