module Deku.DOM.Attr.Poster where


import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Deku.DOM.Elt.Video (Video_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Poster = Poster

instance Attr Video_ Poster  String  where
  attr Poster value = unsafeAttribute $ Left $  
    { key: "poster", value: prop' value }
instance Attr Video_ Poster (Event.Event  String ) where
  attr Poster eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "poster", value: prop' value }


instance Attr everything Poster  Unit  where
  attr Poster _ = unsafeAttribute $ Left $  { key: "poster", value: unset' }
instance Attr everything Poster (Event.Event  Unit ) where
  attr Poster eventValue = unsafeAttribute $ Right $ eventValue <#> \_ ->
    { key: "poster", value: unset' }
