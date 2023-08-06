module Deku.DOM.Attr.Open where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Details (Details_)
import Deku.DOM.Elt.Dialog (Dialog_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Open = Open

instance Attr Details_ Open  String  where
  attr Open value = unsafeAttribute $ Left $  
    { key: "open", value: prop' value }
instance Attr Details_ Open (Event.Event  String ) where
  attr Open eventValue = unsafeAttribute $ Right $ eventValue <#> \value ->
    { key: "open", value: prop' value }


instance Attr Dialog_ Open  String  where
  attr Open value = unsafeAttribute $ Left $  
    { key: "open", value: prop' value }
instance Attr Dialog_ Open (Event.Event  String ) where
  attr Open eventValue = unsafeAttribute $ Right $ eventValue <#> \value ->
    { key: "open", value: prop' value }


instance Attr everything Open  Unit  where
  attr Open _ = unsafeAttribute $ Left $  { key: "open", value: unset' }
instance Attr everything Open (Event.Event  Unit ) where
  attr Open eventValue = unsafeAttribute $ Right $ eventValue <#> \_ ->
    { key: "open", value: unset' }
