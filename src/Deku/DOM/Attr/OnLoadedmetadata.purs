module Deku.DOM.Attr.OnLoadedmetadata where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute, unset')

data OnLoadedmetadata = OnLoadedmetadata

instance Attr anything OnLoadedmetadata (NonEmpty.NonEmpty Event.Event  Cb ) where
  attr OnLoadedmetadata bothValues = unsafeAttribute $ Both (pure 
    { key: "loadedmetadata", value: cb' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "loadedmetadata", value: cb' value })
instance Attr anything OnLoadedmetadata (Product.Product (ST.ST Global.Global) Event.Event  Cb ) where
  attr OnLoadedmetadata (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "loadedmetadata", value: cb' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "loadedmetadata", value: cb' value })
instance Attr anything OnLoadedmetadata  Cb  where
  attr OnLoadedmetadata value = unsafeAttribute $ This $ pure $
    { key: "loadedmetadata", value: cb' value }
instance Attr anything OnLoadedmetadata (Event.Event  Cb ) where
  attr OnLoadedmetadata eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "loadedmetadata", value: cb' value }

instance Attr anything OnLoadedmetadata (ST.ST Global.Global  Cb ) where
  attr OnLoadedmetadata iValue = unsafeAttribute $ This $ iValue
    <#> \value -> { key: "loadedmetadata", value: cb' value }

instance Attr anything OnLoadedmetadata (NonEmpty.NonEmpty Event.Event  (Effect Unit) ) where
  attr OnLoadedmetadata bothValues = unsafeAttribute $ Both (pure 
    { key: "loadedmetadata"
    , value: cb' (Cb (const ((NonEmpty.head bothValues) $> true)))
    })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "loadedmetadata", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnLoadedmetadata (Product.Product (ST.ST Global.Global) Event.Event  (Effect Unit) ) where
  attr OnLoadedmetadata (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "loadedmetadata"
    , value: cb' (Cb (const ((value) $> true)))
    })
    ( Tuple.snd bothValues <#> \value ->
        { key: "loadedmetadata", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnLoadedmetadata  (Effect Unit)  where
  attr OnLoadedmetadata value = unsafeAttribute $ This $ pure $
    { key: "loadedmetadata", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnLoadedmetadata (Event.Event  (Effect Unit) ) where
  attr OnLoadedmetadata eventValue = unsafeAttribute $ That $ eventValue
    <#> \value ->
      { key: "loadedmetadata", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnLoadedmetadata (ST.ST Global.Global  (Effect Unit) ) where
  attr OnLoadedmetadata iValue = unsafeAttribute $ This $ iValue
    <#> \value ->
      { key: "loadedmetadata", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnLoadedmetadata (NonEmpty.NonEmpty Event.Event  (Effect Boolean) ) where
  attr OnLoadedmetadata bothValues = unsafeAttribute $ Both (pure 
    { key: "loadedmetadata", value: cb' (Cb (const (NonEmpty.head bothValues))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "loadedmetadata", value: cb' (Cb (const value)) }
    )
instance Attr anything OnLoadedmetadata (Product.Product (ST.ST Global.Global) Event.Event  (Effect Boolean) ) where
  attr OnLoadedmetadata (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "loadedmetadata", value: cb' (Cb (const (value))) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "loadedmetadata", value: cb' (Cb (const value)) }
    )
instance Attr anything OnLoadedmetadata  (Effect Boolean)  where
  attr OnLoadedmetadata value = unsafeAttribute $ This $ pure $
    { key: "loadedmetadata", value: cb' (Cb (const value)) }
instance Attr anything OnLoadedmetadata (Event.Event  (Effect Boolean) ) where
  attr OnLoadedmetadata eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "loadedmetadata", value: cb' (Cb (const value)) }

instance Attr anything OnLoadedmetadata (ST.ST Global.Global  (Effect Boolean) ) where
  attr OnLoadedmetadata iValue = unsafeAttribute $ This $ iValue
    <#> \value -> { key: "loadedmetadata", value: cb' (Cb (const value)) }

instance Attr everything OnLoadedmetadata (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr OnLoadedmetadata bothValues = unsafeAttribute $ Both (pure 
    { key: "loadedmetadata", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "loadedmetadata", value: unset' })
instance Attr everything OnLoadedmetadata (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr OnLoadedmetadata (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \_ ->  
    { key: "loadedmetadata", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "loadedmetadata", value: unset' })
instance Attr everything OnLoadedmetadata  Unit  where
  attr OnLoadedmetadata _ = unsafeAttribute $ This $ pure $
    { key: "loadedmetadata", value: unset' }
instance Attr everything OnLoadedmetadata (Event.Event  Unit ) where
  attr OnLoadedmetadata eventValue = unsafeAttribute $ That $ eventValue
    <#> \_ -> { key: "loadedmetadata", value: unset' }

instance Attr everything OnLoadedmetadata (ST.ST Global.Global  Unit ) where
  attr OnLoadedmetadata iValue = unsafeAttribute $ This $ iValue
    <#> \_ -> { key: "loadedmetadata", value: unset' }
