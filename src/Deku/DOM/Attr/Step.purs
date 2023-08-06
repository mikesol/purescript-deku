module Deku.DOM.Attr.Step where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Input (Input_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Step = Step

instance Attr Input_ Step  String  where
  attr Step value = unsafeAttribute $ Left $  
    { key: "step", value: prop' value }
instance Attr Input_ Step (Event.Event  String ) where
  attr Step eventValue = unsafeAttribute $ Right $ eventValue <#> \value ->
    { key: "step", value: prop' value }


instance Attr everything Step  Unit  where
  attr Step _ = unsafeAttribute $ Left $  { key: "step", value: unset' }
instance Attr everything Step (Event.Event  Unit ) where
  attr Step eventValue = unsafeAttribute $ Right $ eventValue <#> \_ ->
    { key: "step", value: unset' }
