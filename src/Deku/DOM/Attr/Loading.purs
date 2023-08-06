module Deku.DOM.Attr.Loading where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Img (Img_)
import Deku.DOM.Elt.Iframe (Iframe_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Loading = Loading

instance Attr Img_ Loading  String  where
  attr Loading value = unsafeAttribute $ Left $  
    { key: "loading", value: prop' value }
instance Attr Img_ Loading (Event.Event  String ) where
  attr Loading eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "loading", value: prop' value }


instance Attr Iframe_ Loading  String  where
  attr Loading value = unsafeAttribute $ Left $  
    { key: "loading", value: prop' value }
instance Attr Iframe_ Loading (Event.Event  String ) where
  attr Loading eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "loading", value: prop' value }


instance Attr everything Loading  Unit  where
  attr Loading _ = unsafeAttribute $ Left $  { key: "loading", value: unset' }
instance Attr everything Loading (Event.Event  Unit ) where
  attr Loading eventValue = unsafeAttribute $ Right $ eventValue <#> \_ ->
    { key: "loading", value: unset' }
