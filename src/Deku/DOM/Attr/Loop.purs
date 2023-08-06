module Deku.DOM.Attr.Loop where

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

data Loop = Loop

instance Attr Audio_ Loop  String  where
  attr Loop value = unsafeAttribute $ Left $  
    { key: "loop", value: prop' value }
instance Attr Audio_ Loop (Event.Event  String ) where
  attr Loop eventValue = unsafeAttribute $ Right $ eventValue <#> \value ->
    { key: "loop", value: prop' value }


instance Attr Video_ Loop  String  where
  attr Loop value = unsafeAttribute $ Left $  
    { key: "loop", value: prop' value }
instance Attr Video_ Loop (Event.Event  String ) where
  attr Loop eventValue = unsafeAttribute $ Right $ eventValue <#> \value ->
    { key: "loop", value: prop' value }


instance Attr everything Loop  Unit  where
  attr Loop _ = unsafeAttribute $ Left $  { key: "loop", value: unset' }
instance Attr everything Loop (Event.Event  Unit ) where
  attr Loop eventValue = unsafeAttribute $ Right $ eventValue <#> \_ ->
    { key: "loop", value: unset' }
