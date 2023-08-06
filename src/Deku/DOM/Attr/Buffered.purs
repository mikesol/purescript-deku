module Deku.DOM.Attr.Buffered where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Audio (Audio_)
import Deku.DOM.Elt.Video (Video_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Buffered = Buffered

instance Attr Audio_ Buffered  String  where
  attr Buffered value = unsafeAttribute $ Left $  
    { key: "buffered", value: prop' value }
instance Attr Audio_ Buffered (Event.Event  String ) where
  attr Buffered eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "buffered", value: prop' value }


instance Attr Video_ Buffered  String  where
  attr Buffered value = unsafeAttribute $ Left $  
    { key: "buffered", value: prop' value }
instance Attr Video_ Buffered (Event.Event  String ) where
  attr Buffered eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "buffered", value: prop' value }


instance Attr everything Buffered  Unit  where
  attr Buffered _ = unsafeAttribute $ Left $  
    { key: "buffered", value: unset' }
instance Attr everything Buffered (Event.Event  Unit ) where
  attr Buffered eventValue = unsafeAttribute $ Right $ eventValue <#> \_ ->
    { key: "buffered", value: unset' }
