module Deku.DOM.Attr.OnLoadeddata where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnLoadeddata = OnLoadeddata

instance Attr anything OnLoadeddata (NonEmpty.NonEmpty Event.Event  Cb ) where
  attr OnLoadeddata bothValues = unsafeAttribute $ Both
    { key: "loadeddata", value: cb' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "loadeddata", value: cb' value })
instance Attr anything OnLoadeddata  Cb  where
  attr OnLoadeddata value = unsafeAttribute $ This
    { key: "loadeddata", value: cb' value }
instance Attr anything OnLoadeddata (Event.Event  Cb ) where
  attr OnLoadeddata eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "loadeddata", value: cb' value }

instance Attr anything OnLoadeddata (NonEmpty.NonEmpty Event.Event  (Effect Unit) ) where
  attr OnLoadeddata bothValues = unsafeAttribute $ Both
    { key: "loadeddata", value: cb' (Cb (const ((NonEmpty.head bothValues) $> true))) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "loadeddata", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnLoadeddata  (Effect Unit)  where
  attr OnLoadeddata value = unsafeAttribute $ This
    { key: "loadeddata", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnLoadeddata (Event.Event  (Effect Unit) ) where
  attr OnLoadeddata eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "loadeddata", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnLoadeddata (NonEmpty.NonEmpty Event.Event  (Effect Boolean) ) where
  attr OnLoadeddata bothValues = unsafeAttribute $ Both
    { key: "loadeddata", value: cb' (Cb (const (NonEmpty.head bothValues))) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "loadeddata", value: cb' (Cb (const value)) }
    )
instance Attr anything OnLoadeddata  (Effect Boolean)  where
  attr OnLoadeddata value = unsafeAttribute $ This
    { key: "loadeddata", value: cb' (Cb (const value)) }
instance Attr anything OnLoadeddata (Event.Event  (Effect Boolean) ) where
  attr OnLoadeddata eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "loadeddata", value: cb' (Cb (const value)) }

type OnLoadeddataEffect =
  forall element
   . Attr element OnLoadeddata (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnLoadeddata (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr OnLoadeddata bothValues = unsafeAttribute $ Both
    { key: "loadeddata", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "loadeddata", value: unset' })
instance Attr everything OnLoadeddata  Unit  where
  attr OnLoadeddata _ = unsafeAttribute $ This
    { key: "loadeddata", value: unset' }
instance Attr everything OnLoadeddata (Event.Event  Unit ) where
  attr OnLoadeddata eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "loadeddata", value: unset' }
