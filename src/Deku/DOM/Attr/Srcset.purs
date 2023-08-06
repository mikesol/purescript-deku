module Deku.DOM.Attr.Srcset where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Img (Img_)
import Deku.DOM.Elt.Source (Source_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Srcset = Srcset

instance Attr Img_ Srcset  String  where
  attr Srcset value = unsafeAttribute $ Left $  
    { key: "srcset", value: prop' value }
instance Attr Img_ Srcset (Event.Event  String ) where
  attr Srcset eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "srcset", value: prop' value }


instance Attr Source_ Srcset  String  where
  attr Srcset value = unsafeAttribute $ Left $  
    { key: "srcset", value: prop' value }
instance Attr Source_ Srcset (Event.Event  String ) where
  attr Srcset eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "srcset", value: prop' value }


instance Attr everything Srcset  Unit  where
  attr Srcset _ = unsafeAttribute $ Left $  { key: "srcset", value: unset' }
instance Attr everything Srcset (Event.Event  Unit ) where
  attr Srcset eventValue = unsafeAttribute $ Right $ eventValue <#> \_ ->
    { key: "srcset", value: unset' }
