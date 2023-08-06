module Deku.DOM.Attr.ContentStyleType where

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

data ContentStyleType = ContentStyleType

instance Attr Svg_ ContentStyleType  String  where
  attr ContentStyleType value = unsafeAttribute $ Left $  
    { key: "contentStyleType", value: prop' value }
instance Attr Svg_ ContentStyleType (Event.Event  String ) where
  attr ContentStyleType eventValue = unsafeAttribute $ Right $ eventValue
    <#> \value -> { key: "contentStyleType", value: prop' value }


instance Attr everything ContentStyleType  Unit  where
  attr ContentStyleType _ = unsafeAttribute $ Left $  
    { key: "contentStyleType", value: unset' }
instance Attr everything ContentStyleType (Event.Event  Unit ) where
  attr ContentStyleType eventValue = unsafeAttribute $ Right $ eventValue
    <#> \_ -> { key: "contentStyleType", value: unset' }
