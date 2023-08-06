module Deku.DOM.Attr.NumOctaves where

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

data NumOctaves = NumOctaves

instance Attr FeTurbulence_ NumOctaves  String  where
  attr NumOctaves value = unsafeAttribute $ Left $  
    { key: "numOctaves", value: prop' value }
instance Attr FeTurbulence_ NumOctaves (Event.Event  String ) where
  attr NumOctaves eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "numOctaves", value: prop' value }


instance Attr everything NumOctaves  Unit  where
  attr NumOctaves _ = unsafeAttribute $ Left $  
    { key: "numOctaves", value: unset' }
instance Attr everything NumOctaves (Event.Event  Unit ) where
  attr NumOctaves eventValue = unsafeAttribute $ Right $ eventValue <#>
    \_ -> { key: "numOctaves", value: unset' }
