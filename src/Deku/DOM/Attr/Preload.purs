module Deku.DOM.Attr.Preload where

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

data Preload = Preload

instance Attr Audio_ Preload  String  where
  attr Preload value = unsafeAttribute $ Left $  
    { key: "preload", value: prop' value }
instance Attr Audio_ Preload (Event.Event  String ) where
  attr Preload eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "preload", value: prop' value }


instance Attr Video_ Preload  String  where
  attr Preload value = unsafeAttribute $ Left $  
    { key: "preload", value: prop' value }
instance Attr Video_ Preload (Event.Event  String ) where
  attr Preload eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "preload", value: prop' value }


instance Attr everything Preload  Unit  where
  attr Preload _ = unsafeAttribute $ Left $  { key: "preload", value: unset' }
instance Attr everything Preload (Event.Event  Unit ) where
  attr Preload eventValue = unsafeAttribute $ Right $ eventValue <#> \_ ->
    { key: "preload", value: unset' }
