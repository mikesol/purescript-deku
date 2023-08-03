module Deku.DOM.Attr.OnLoadedmetadata where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnLoadedmetadata = OnLoadedmetadata

instance Attr anything OnLoadedmetadata (NonEmpty.NonEmpty Event.Event  Cb ) where
  attr OnLoadedmetadata bothValues = unsafeAttribute $ Both
    { key: "loadedmetadata", value: cb' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "loadedmetadata", value: cb' value })
instance Attr anything OnLoadedmetadata  Cb  where
  attr OnLoadedmetadata value = unsafeAttribute $ This $ pure $
    { key: "loadedmetadata", value: cb' value }
instance Attr anything OnLoadedmetadata (Event.Event  Cb ) where
  attr OnLoadedmetadata eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "loadedmetadata", value: cb' value }

instance Attr anything OnLoadedmetadata (NonEmpty.NonEmpty Event.Event  (Effect Unit) ) where
  attr OnLoadedmetadata bothValues = unsafeAttribute $ Both
    { key: "loadedmetadata"
    , value: cb' (Cb (const ((NonEmpty.head bothValues) $> true)))
    }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "loadedmetadata", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnLoadedmetadata  (Effect Unit)  where
  attr OnLoadedmetadata value = unsafeAttribute $ This $ pure $
    { key: "loadedmetadata", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnLoadedmetadata (Event.Event  (Effect Unit) ) where
  attr OnLoadedmetadata eventValue = unsafeAttribute $ That $ eventValue
    <#> \value ->
      { key: "loadedmetadata", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnLoadedmetadata (NonEmpty.NonEmpty Event.Event  (Effect Boolean) ) where
  attr OnLoadedmetadata bothValues = unsafeAttribute $ Both
    { key: "loadedmetadata", value: cb' (Cb (const (NonEmpty.head bothValues))) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "loadedmetadata", value: cb' (Cb (const value)) }
    )
instance Attr anything OnLoadedmetadata  (Effect Boolean)  where
  attr OnLoadedmetadata value = unsafeAttribute $ This $ pure $
    { key: "loadedmetadata", value: cb' (Cb (const value)) }
instance Attr anything OnLoadedmetadata (Event.Event  (Effect Boolean) ) where
  attr OnLoadedmetadata eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "loadedmetadata", value: cb' (Cb (const value)) }

type OnLoadedmetadataEffect =
  forall element
   . Attr element OnLoadedmetadata (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnLoadedmetadata (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr OnLoadedmetadata bothValues = unsafeAttribute $ Both
    { key: "loadedmetadata", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "loadedmetadata", value: unset' })
instance Attr everything OnLoadedmetadata  Unit  where
  attr OnLoadedmetadata _ = unsafeAttribute $ This $ pure $
    { key: "loadedmetadata", value: unset' }
instance Attr everything OnLoadedmetadata (Event.Event  Unit ) where
  attr OnLoadedmetadata eventValue = unsafeAttribute $ That $ eventValue
    <#> \_ -> { key: "loadedmetadata", value: unset' }
