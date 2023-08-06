module Deku.DOM.Attr.KeyPoints where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.AnimateMotion (AnimateMotion_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data KeyPoints = KeyPoints

instance Attr AnimateMotion_ KeyPoints  String  where
  attr KeyPoints value = unsafeAttribute $ Left $  
    { key: "keyPoints", value: prop' value }
instance Attr AnimateMotion_ KeyPoints (Event.Event  String ) where
  attr KeyPoints eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "keyPoints", value: prop' value }


instance Attr everything KeyPoints  Unit  where
  attr KeyPoints _ = unsafeAttribute $ Left $  
    { key: "keyPoints", value: unset' }
instance Attr everything KeyPoints (Event.Event  Unit ) where
  attr KeyPoints eventValue = unsafeAttribute $ Right $ eventValue <#>
    \_ -> { key: "keyPoints", value: unset' }
