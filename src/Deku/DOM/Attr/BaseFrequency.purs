module Deku.DOM.Attr.BaseFrequency where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.FeTurbulence (FeTurbulence_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data BaseFrequency = BaseFrequency

instance Attr FeTurbulence_ BaseFrequency  String  where
  attr BaseFrequency value = unsafeAttribute $ Left $  
    { key: "baseFrequency", value: prop' value }
instance Attr FeTurbulence_ BaseFrequency (Event.Event  String ) where
  attr BaseFrequency eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "baseFrequency", value: prop' value }


instance Attr everything BaseFrequency  Unit  where
  attr BaseFrequency _ = unsafeAttribute $ Left $  
    { key: "baseFrequency", value: unset' }
instance Attr everything BaseFrequency (Event.Event  Unit ) where
  attr BaseFrequency eventValue = unsafeAttribute $ Right $ eventValue <#>
    \_ -> { key: "baseFrequency", value: unset' }
