module Deku.DOM.Attr.Manifest where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Html (Html_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Manifest = Manifest

instance Attr Html_ Manifest  String  where
  attr Manifest value = unsafeAttribute $ Left $  
    { key: "manifest", value: prop' value }
instance Attr Html_ Manifest (Event.Event  String ) where
  attr Manifest eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "manifest", value: prop' value }


instance Attr everything Manifest  Unit  where
  attr Manifest _ = unsafeAttribute $ Left $  
    { key: "manifest", value: unset' }
instance Attr everything Manifest (Event.Event  Unit ) where
  attr Manifest eventValue = unsafeAttribute $ Right $ eventValue <#> \_ ->
    { key: "manifest", value: unset' }
