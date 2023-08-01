module Deku.DOM.Attr.OnLoadedmetadata where

import Prelude
import Data.These (These(..))
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnLoadedmetadata = OnLoadedmetadata

instance Attr anything OnLoadedmetadata Cb where
  attr OnLoadedmetadata bothValues = unsafeAttribute $ Both
    { key: "loadedmetadata", value: cb' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "loadedmetadata", value: cb' value })
  pureAttr OnLoadedmetadata value = unsafeAttribute $ This
    { key: "loadedmetadata", value: cb' value }
  unpureAttr OnLoadedmetadata eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "loadedmetadata", value: cb' value }

instance Attr anything OnLoadedmetadata (Effect Unit) where
  attr OnLoadedmetadata bothValues = unsafeAttribute $ Both
    { key: "loadedmetadata"
    , value: cb' (Cb (const ((NonEmpty.head bothValues) $> true)))
    }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "loadedmetadata", value: cb' (Cb (const (value $> true))) }
    )
  pureAttr OnLoadedmetadata value = unsafeAttribute $ This
    { key: "loadedmetadata", value: cb' (Cb (const (value $> true))) }
  unpureAttr OnLoadedmetadata eventValue = unsafeAttribute $ That $ eventValue
    <#> \value ->
      { key: "loadedmetadata", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnLoadedmetadata (Effect Boolean) where
  attr OnLoadedmetadata bothValues = unsafeAttribute $ Both
    { key: "loadedmetadata", value: cb' (Cb (const (NonEmpty.head bothValues))) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "loadedmetadata", value: cb' (Cb (const value)) }
    )
  pureAttr OnLoadedmetadata value = unsafeAttribute $ This
    { key: "loadedmetadata", value: cb' (Cb (const value)) }
  unpureAttr OnLoadedmetadata eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "loadedmetadata", value: cb' (Cb (const value)) }

type OnLoadedmetadataEffect =
  forall element
   . Attr element OnLoadedmetadata (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnLoadedmetadata Unit where
  attr OnLoadedmetadata bothValues = unsafeAttribute $ Both
    { key: "loadedmetadata", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "loadedmetadata", value: unset' })
  pureAttr OnLoadedmetadata _ = unsafeAttribute $ This
    { key: "loadedmetadata", value: unset' }
  unpureAttr OnLoadedmetadata eventValue = unsafeAttribute $ That $ eventValue
    <#> \_ -> { key: "loadedmetadata", value: unset' }
