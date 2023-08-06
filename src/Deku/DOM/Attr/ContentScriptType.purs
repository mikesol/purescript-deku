module Deku.DOM.Attr.ContentScriptType where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Svg (Svg_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data ContentScriptType = ContentScriptType

instance Attr Svg_ ContentScriptType  String  where
  attr ContentScriptType value = unsafeAttribute $ Left $  
    { key: "contentScriptType", value: prop' value }
instance Attr Svg_ ContentScriptType (Event.Event  String ) where
  attr ContentScriptType eventValue = unsafeAttribute $ Right $ eventValue
    <#> \value -> { key: "contentScriptType", value: prop' value }


instance Attr everything ContentScriptType  Unit  where
  attr ContentScriptType _ = unsafeAttribute $ Left $  
    { key: "contentScriptType", value: unset' }
instance Attr everything ContentScriptType (Event.Event  Unit ) where
  attr ContentScriptType eventValue = unsafeAttribute $ Right $ eventValue
    <#> \_ -> { key: "contentScriptType", value: unset' }
