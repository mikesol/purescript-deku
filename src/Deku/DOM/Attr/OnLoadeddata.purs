module Deku.DOM.Attr.OnLoadeddata where

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

data OnLoadeddata = OnLoadeddata

instance Attr anything OnLoadeddata (NonEmpty.NonEmpty Event.Event  Cb ) where
  attr OnLoadeddata bothValues = unsafeAttribute $ Both (pure 
    { key: "loadeddata", value: cb' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "loadeddata", value: cb' value })
instance Attr anything OnLoadeddata (Product.Product (ST.ST Global.Global) Event.Event  Cb ) where
  attr OnLoadeddata (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "loadeddata", value: cb' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "loadeddata", value: cb' value })
instance Attr anything OnLoadeddata  Cb  where
  attr OnLoadeddata value = unsafeAttribute $ This $ pure $
    { key: "loadeddata", value: cb' value }
instance Attr anything OnLoadeddata (Event.Event  Cb ) where
  attr OnLoadeddata eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "loadeddata", value: cb' value }

instance Attr anything OnLoadeddata (ST.ST Global.Global  Cb ) where
  attr OnLoadeddata iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "loadeddata", value: cb' value }

instance Attr anything OnLoadeddata (NonEmpty.NonEmpty Event.Event  (Effect Unit) ) where
  attr OnLoadeddata bothValues = unsafeAttribute $ Both (pure 
    { key: "loadeddata", value: cb' (Cb (const ((NonEmpty.head bothValues) $> true))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "loadeddata", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnLoadeddata (Product.Product (ST.ST Global.Global) Event.Event  (Effect Unit) ) where
  attr OnLoadeddata (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "loadeddata", value: cb' (Cb (const ((value) $> true))) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "loadeddata", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnLoadeddata  (Effect Unit)  where
  attr OnLoadeddata value = unsafeAttribute $ This $ pure $
    { key: "loadeddata", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnLoadeddata (Event.Event  (Effect Unit) ) where
  attr OnLoadeddata eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "loadeddata", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnLoadeddata (ST.ST Global.Global  (Effect Unit) ) where
  attr OnLoadeddata iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "loadeddata", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnLoadeddata (NonEmpty.NonEmpty Event.Event  (Effect Boolean) ) where
  attr OnLoadeddata bothValues = unsafeAttribute $ Both (pure 
    { key: "loadeddata", value: cb' (Cb (const (NonEmpty.head bothValues))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "loadeddata", value: cb' (Cb (const value)) }
    )
instance Attr anything OnLoadeddata (Product.Product (ST.ST Global.Global) Event.Event  (Effect Boolean) ) where
  attr OnLoadeddata (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "loadeddata", value: cb' (Cb (const (value))) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "loadeddata", value: cb' (Cb (const value)) }
    )
instance Attr anything OnLoadeddata  (Effect Boolean)  where
  attr OnLoadeddata value = unsafeAttribute $ This $ pure $
    { key: "loadeddata", value: cb' (Cb (const value)) }
instance Attr anything OnLoadeddata (Event.Event  (Effect Boolean) ) where
  attr OnLoadeddata eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "loadeddata", value: cb' (Cb (const value)) }

instance Attr anything OnLoadeddata (ST.ST Global.Global  (Effect Boolean) ) where
  attr OnLoadeddata iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "loadeddata", value: cb' (Cb (const value)) }

instance Attr everything OnLoadeddata (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr OnLoadeddata bothValues = unsafeAttribute $ Both (pure 
    { key: "loadeddata", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "loadeddata", value: unset' })
instance Attr everything OnLoadeddata (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr OnLoadeddata (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \_ ->  
    { key: "loadeddata", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "loadeddata", value: unset' })
instance Attr everything OnLoadeddata  Unit  where
  attr OnLoadeddata _ = unsafeAttribute $ This $ pure $
    { key: "loadeddata", value: unset' }
instance Attr everything OnLoadeddata (Event.Event  Unit ) where
  attr OnLoadeddata eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "loadeddata", value: unset' }

instance Attr everything OnLoadeddata (ST.ST Global.Global  Unit ) where
  attr OnLoadeddata iValue = unsafeAttribute $ This $ iValue #
    \_ -> { key: "loadeddata", value: unset' }
