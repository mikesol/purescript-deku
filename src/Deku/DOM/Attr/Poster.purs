module Deku.DOM.Attr.Poster where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Video (Video_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Poster = Poster

instance Attr Video_ Poster (NonEmpty.NonEmpty Event.Event  String ) where
  attr Poster bothValues = unsafeAttribute $ Both (pure 
    { key: "poster", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "poster", value: prop' value })
instance Attr Video_ Poster  String  where
  attr Poster value = unsafeAttribute $ This $ pure $
    { key: "poster", value: prop' value }
instance Attr Video_ Poster (Event.Event  String ) where
  attr Poster eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "poster", value: prop' value }

instance Attr everything Poster (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Poster bothValues = unsafeAttribute $ Both (pure 
    { key: "poster", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "poster", value: unset' })
instance Attr everything Poster  Unit  where
  attr Poster _ = unsafeAttribute $ This $ pure $ { key: "poster", value: unset' }
instance Attr everything Poster (Event.Event  Unit ) where
  attr Poster eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "poster", value: unset' }
