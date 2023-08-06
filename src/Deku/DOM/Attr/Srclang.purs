module Deku.DOM.Attr.Srclang where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Track (Track_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Srclang = Srclang

instance Attr Track_ Srclang  String  where
  attr Srclang value = unsafeAttribute $ Left $  
    { key: "srclang", value: prop' value }
instance Attr Track_ Srclang (Event.Event  String ) where
  attr Srclang eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "srclang", value: prop' value }


instance Attr everything Srclang  Unit  where
  attr Srclang _ = unsafeAttribute $ Left $  { key: "srclang", value: unset' }
instance Attr everything Srclang (Event.Event  Unit ) where
  attr Srclang eventValue = unsafeAttribute $ Right $ eventValue <#> \_ ->
    { key: "srclang", value: unset' }
