module Deku.DOM.Attr.PatternTransform where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Pattern (Pattern_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data PatternTransform = PatternTransform

instance Attr Pattern_ PatternTransform  String  where
  attr PatternTransform value = unsafeAttribute $ Left $  
    { key: "patternTransform", value: prop' value }
instance Attr Pattern_ PatternTransform (Event.Event  String ) where
  attr PatternTransform eventValue = unsafeAttribute $ Right $ eventValue
    <#> \value -> { key: "patternTransform", value: prop' value }


instance Attr everything PatternTransform  Unit  where
  attr PatternTransform _ = unsafeAttribute $ Left $  
    { key: "patternTransform", value: unset' }
instance Attr everything PatternTransform (Event.Event  Unit ) where
  attr PatternTransform eventValue = unsafeAttribute $ Right $ eventValue
    <#> \_ -> { key: "patternTransform", value: unset' }
