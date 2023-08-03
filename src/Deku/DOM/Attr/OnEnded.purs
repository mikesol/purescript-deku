module Deku.DOM.Attr.OnEnded where

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

data OnEnded = OnEnded

instance Attr anything OnEnded (NonEmpty.NonEmpty Event.Event  Cb ) where
  attr OnEnded bothValues = unsafeAttribute $ Both (pure 
    { key: "ended", value: cb' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "ended", value: cb' value })
instance Attr anything OnEnded (Product.Product (ST.ST Global.Global) Event.Event  Cb ) where
  attr OnEnded (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "ended", value: cb' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "ended", value: cb' value })
instance Attr anything OnEnded  Cb  where
  attr OnEnded value = unsafeAttribute $ This $ pure $
    { key: "ended", value: cb' value }
instance Attr anything OnEnded (Event.Event  Cb ) where
  attr OnEnded eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "ended", value: cb' value }

instance Attr anything OnEnded (ST.ST Global.Global  Cb ) where
  attr OnEnded stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "ended", value: cb' value }

instance Attr anything OnEnded (NonEmpty.NonEmpty Event.Event  (Effect Unit) ) where
  attr OnEnded bothValues = unsafeAttribute $ Both (pure 
    { key: "ended", value: cb' (Cb (const ((NonEmpty.head bothValues) $> true))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "ended", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnEnded (Product.Product (ST.ST Global.Global) Event.Event  (Effect Unit) ) where
  attr OnEnded (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "ended", value: cb' (Cb (const ((value) $> true))) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "ended", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnEnded  (Effect Unit)  where
  attr OnEnded value = unsafeAttribute $ This $ pure $
    { key: "ended", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnEnded (Event.Event  (Effect Unit) ) where
  attr OnEnded eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "ended", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnEnded (ST.ST Global.Global  (Effect Unit) ) where
  attr OnEnded stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "ended", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnEnded (NonEmpty.NonEmpty Event.Event  (Effect Boolean) ) where
  attr OnEnded bothValues = unsafeAttribute $ Both (pure 
    { key: "ended", value: cb' (Cb (const (NonEmpty.head bothValues))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "ended", value: cb' (Cb (const value)) }
    )
instance Attr anything OnEnded (Product.Product (ST.ST Global.Global) Event.Event  (Effect Boolean) ) where
  attr OnEnded (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "ended", value: cb' (Cb (const (value))) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "ended", value: cb' (Cb (const value)) }
    )
instance Attr anything OnEnded  (Effect Boolean)  where
  attr OnEnded value = unsafeAttribute $ This $ pure $
    { key: "ended", value: cb' (Cb (const value)) }
instance Attr anything OnEnded (Event.Event  (Effect Boolean) ) where
  attr OnEnded eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "ended", value: cb' (Cb (const value)) }

instance Attr anything OnEnded (ST.ST Global.Global  (Effect Boolean) ) where
  attr OnEnded stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "ended", value: cb' (Cb (const value)) }

instance Attr everything OnEnded (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr OnEnded bothValues = unsafeAttribute $ Both (pure 
    { key: "ended", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "ended", value: unset' })
instance Attr everything OnEnded (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr OnEnded (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \_ ->  
    { key: "ended", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "ended", value: unset' })
instance Attr everything OnEnded  Unit  where
  attr OnEnded _ = unsafeAttribute $ This $ pure $ { key: "ended", value: unset' }
instance Attr everything OnEnded (Event.Event  Unit ) where
  attr OnEnded eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "ended", value: unset' }

instance Attr everything OnEnded (ST.ST Global.Global  Unit ) where
  attr OnEnded stValue = unsafeAttribute $ This $ stValue <#> \_ ->
    { key: "ended", value: unset' }
