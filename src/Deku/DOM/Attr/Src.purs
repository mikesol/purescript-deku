module Deku.DOM.Attr.Src where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Audio (Audio_)
import Deku.DOM.Elt.Embed (Embed_)
import Deku.DOM.Elt.Iframe (Iframe_)
import Deku.DOM.Elt.Img (Img_)
import Deku.DOM.Elt.Input (Input_)
import Deku.DOM.Elt.Script (Script_)
import Deku.DOM.Elt.Source (Source_)
import Deku.DOM.Elt.Track (Track_)
import Deku.DOM.Elt.Video (Video_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Src = Src

instance Attr Audio_ Src (NonEmpty.NonEmpty Event.Event  String ) where
  attr Src bothValues = unsafeAttribute $ Both (pure 
    { key: "src", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "src", value: prop' value })
instance Attr Audio_ Src  String  where
  attr Src value = unsafeAttribute $ This $ pure $ { key: "src", value: prop' value }
instance Attr Audio_ Src (Event.Event  String ) where
  attr Src eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "src", value: prop' value }

instance Attr Embed_ Src (NonEmpty.NonEmpty Event.Event  String ) where
  attr Src bothValues = unsafeAttribute $ Both (pure 
    { key: "src", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "src", value: prop' value })
instance Attr Embed_ Src  String  where
  attr Src value = unsafeAttribute $ This $ pure $ { key: "src", value: prop' value }
instance Attr Embed_ Src (Event.Event  String ) where
  attr Src eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "src", value: prop' value }

instance Attr Iframe_ Src (NonEmpty.NonEmpty Event.Event  String ) where
  attr Src bothValues = unsafeAttribute $ Both (pure 
    { key: "src", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "src", value: prop' value })
instance Attr Iframe_ Src  String  where
  attr Src value = unsafeAttribute $ This $ pure $ { key: "src", value: prop' value }
instance Attr Iframe_ Src (Event.Event  String ) where
  attr Src eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "src", value: prop' value }

instance Attr Img_ Src (NonEmpty.NonEmpty Event.Event  String ) where
  attr Src bothValues = unsafeAttribute $ Both (pure 
    { key: "src", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "src", value: prop' value })
instance Attr Img_ Src  String  where
  attr Src value = unsafeAttribute $ This $ pure $ { key: "src", value: prop' value }
instance Attr Img_ Src (Event.Event  String ) where
  attr Src eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "src", value: prop' value }

instance Attr Input_ Src (NonEmpty.NonEmpty Event.Event  String ) where
  attr Src bothValues = unsafeAttribute $ Both (pure 
    { key: "src", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "src", value: prop' value })
instance Attr Input_ Src  String  where
  attr Src value = unsafeAttribute $ This $ pure $ { key: "src", value: prop' value }
instance Attr Input_ Src (Event.Event  String ) where
  attr Src eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "src", value: prop' value }

instance Attr Script_ Src (NonEmpty.NonEmpty Event.Event  String ) where
  attr Src bothValues = unsafeAttribute $ Both (pure 
    { key: "src", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "src", value: prop' value })
instance Attr Script_ Src  String  where
  attr Src value = unsafeAttribute $ This $ pure $ { key: "src", value: prop' value }
instance Attr Script_ Src (Event.Event  String ) where
  attr Src eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "src", value: prop' value }

instance Attr Source_ Src (NonEmpty.NonEmpty Event.Event  String ) where
  attr Src bothValues = unsafeAttribute $ Both (pure 
    { key: "src", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "src", value: prop' value })
instance Attr Source_ Src  String  where
  attr Src value = unsafeAttribute $ This $ pure $ { key: "src", value: prop' value }
instance Attr Source_ Src (Event.Event  String ) where
  attr Src eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "src", value: prop' value }

instance Attr Track_ Src (NonEmpty.NonEmpty Event.Event  String ) where
  attr Src bothValues = unsafeAttribute $ Both (pure 
    { key: "src", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "src", value: prop' value })
instance Attr Track_ Src  String  where
  attr Src value = unsafeAttribute $ This $ pure $ { key: "src", value: prop' value }
instance Attr Track_ Src (Event.Event  String ) where
  attr Src eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "src", value: prop' value }

instance Attr Video_ Src (NonEmpty.NonEmpty Event.Event  String ) where
  attr Src bothValues = unsafeAttribute $ Both (pure 
    { key: "src", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "src", value: prop' value })
instance Attr Video_ Src  String  where
  attr Src value = unsafeAttribute $ This $ pure $ { key: "src", value: prop' value }
instance Attr Video_ Src (Event.Event  String ) where
  attr Src eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "src", value: prop' value }

instance Attr everything Src (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Src bothValues = unsafeAttribute $ Both (pure  { key: "src", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "src", value: unset' })
instance Attr everything Src  Unit  where
  attr Src _ = unsafeAttribute $ This $ pure $ { key: "src", value: unset' }
instance Attr everything Src (Event.Event  Unit ) where
  attr Src eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "src", value: unset' }
