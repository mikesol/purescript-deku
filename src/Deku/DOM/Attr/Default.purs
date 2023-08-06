module Deku.DOM.Attr.Default where

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

data Default = Default

instance Attr Track_ Default  String  where
  attr Default value = unsafeAttribute $ Left $  
    { key: "default", value: prop' value }
instance Attr Track_ Default (Event.Event  String ) where
  attr Default eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "default", value: prop' value }


instance Attr everything Default  Unit  where
  attr Default _ = unsafeAttribute $ Left $  { key: "default", value: unset' }
instance Attr everything Default (Event.Event  Unit ) where
  attr Default eventValue = unsafeAttribute $ Right $ eventValue <#> \_ ->
    { key: "default", value: unset' }
