module Deku.DOM.Attr.Download where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.A (A_)
import Deku.DOM.Elt.Area (Area_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Download = Download

instance Attr A_ Download  String  where
  attr Download value = unsafeAttribute $ Left $  
    { key: "download", value: prop' value }
instance Attr A_ Download (Event.Event  String ) where
  attr Download eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "download", value: prop' value }


instance Attr Area_ Download  String  where
  attr Download value = unsafeAttribute $ Left $  
    { key: "download", value: prop' value }
instance Attr Area_ Download (Event.Event  String ) where
  attr Download eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "download", value: prop' value }


instance Attr everything Download  Unit  where
  attr Download _ = unsafeAttribute $ Left $  
    { key: "download", value: unset' }
instance Attr everything Download (Event.Event  Unit ) where
  attr Download eventValue = unsafeAttribute $ Right $ eventValue <#> \_ ->
    { key: "download", value: unset' }
